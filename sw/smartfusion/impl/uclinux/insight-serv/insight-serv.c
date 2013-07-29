//**************************************************************************************************
// insight-serv.c
//
// Russ Bielawski
// University of Michigan
// 2012-11-14: created
// 2013-03-01: runs on smartfusion uClinux (no fork()).  discriminates good vs bad requests (good
//             requests start with the string "GET" and the rest is ignored).
// 2013-06-18: added support for multiple cameras.  however, only CAM0 is actually being used, and
//             its data is being transmitted thrice as if to appear to be three distinct cameras.
//             this is because the APB3 bus cannot keep up with all three cameras and the FIFOs
//             overflow.  by only using CAM0, all the other FIFOs overflow, but we can keep up with
//             CAM0
//**************************************************************************************************


//**************************************************************************************************
// includes
//
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>
#include <assert.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <arpa/inet.h>
// camera calibration mask
#include "stonymask_nomask.h"
//#include "stonymask_cam12_sf-test.h"
//#include "stonymask_cam12_sf.h"
//#include "stonymask_cam12_3v3_sf.h"


//**************************************************************************************************
// defines / constants
//
typedef  unsigned long   uint32;
typedef  unsigned short  uint16;
typedef  unsigned char   uint8;

#define DEFAULT_PORT              (80)
#define MAX_CONNS                 (1)
#define REQ_MAX_LEN               (1024)  // Bytes (chosen arbitrarily)
#define RESOLUTION_ROWS           (112)
#define RESOLUTION_COLS           (112)
#define RESOLUTION                (RESOLUTION_ROWS*RESOLUTION_COLS)

#define SYMBOL_SOF                ((uint8)0xFF)

#define OPCODE_START              ((uint8)0x01)
#define OPCODE_STOP               ((uint8)0x02)
#define OPCODE_SINGLE_FRAME       ((uint8)0x04)
#define OPCODE_START_ACK          ((uint8)0x81)
#define OPCODE_STOP_ACK           ((uint8)0x82)
#define OPCODE_FRAME              ((uint8)0x84)

#define OPCODE_REQ_NUM_CAMS       ((uint8)0x21)
#define OPCODE_RESP_NUM_CAMS      ((uint8)0xA1)

#define REG_BASE_ADDR             (0x40060000ul)
#define REG_MASK_CAM_IND          (0x00000080ul)
#define REG_CAM_REG_SPACE_WIDTH   (0x00000020ul)
#define REG_SET_OFFSET_CAM0       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*0))
#define REG_SET_OFFSET_CAM1       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*1))
#define REG_SET_OFFSET_CAM2       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*2))
#define REG_SET_OFFSET_CAM3       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*3))
#define REG_OFFSET_GLOB_STARTCAP  (0x00000000ul)
#define REG_OFFSET_GLOB_STATUS    (0x00000000ul)
#define REG_OFFSET_CAMX_STATUS    (0x00000000ul)
#define REG_OFFSET_CAMX_PXDATA    (0x00000004ul)

#define REG_CTRL                  (*((volatile uint32*)(REG_BASE_ADDR+REG_OFFSET_GLOB_STARTCAP)))
#define REG_FLAGS                 (*((volatile uint32*)(REG_BASE_ADDR+REG_OFFSET_GLOB_STATUS)))
#define REG_CAMX_BASE(xx)         (REG_BASE_ADDR+REG_MASK_CAM_IND+(REG_CAM_REG_SPACE_WIDTH*(xx)))
#define REG_CAMX_STATUS(xx)       (*((volatile uint32*)(REG_CAMX_BASE(xx)+REG_OFFSET_CAMX_STATUS)))
#define REG_CAMX_PXDATA(xx)       (*((volatile uint32*)(REG_CAMX_BASE(xx)+REG_OFFSET_CAMX_PXDATA)))

#define FLAG_SHIFT_BUSY           (0u)
#define FLAG_SHIFT_EMPTY          (0u)
#define FLAG_SHIFT_FULL           (1u)
#define FLAG_SHIFT_AFULL          (2u)

const char RESP_BAD_REQUEST[] = "HTTP/1.0 400 Bad Request\n";
// a success header is not currently used
const char RESP_SUCCESS_HEADER[] = "HTTP/1.0 200 OK\n";
const char RESP_FRAME_HEADER[] = {SYMBOL_SOF,OPCODE_FRAME};

#define NUM_CAMS                  (3)
#define NUM_BUFS_PER_CAM          (1) // currently not implemented, leave as 1


//**************************************************************************************************
// globals
//
uint8 *imgbuf[NUM_CAMS];


//**************************************************************************************************
// local function prototypes
//
static void request_handler(int sd);
static void request_send_data(int sd);
/*static void printusage(char *progname);
static void printhelp(char *progname);
static int  parseargs(int argc, char **argv);*/


//**************************************************************************************************
// main
//
int main(int argc, char** argv)
{
   unsigned ii;
   int sd_listen, sd_client;
   struct sockaddr_in sockaddr_server, sockaddr_client;
   unsigned len;


   // start up the server
   sd_listen = socket(AF_INET, SOCK_STREAM, 0);
   if(0 > sd_listen)
   {
      fprintf(stderr,"ERROR: can't create listening socket\n");
      exit(1);
   }


   // fill in socket details
   memset(&sockaddr_server,0,sizeof(sockaddr_server));
   sockaddr_server.sin_family      = AF_INET;
   sockaddr_server.sin_addr.s_addr = htonl(INADDR_ANY);
   sockaddr_server.sin_port        = htons(DEFAULT_PORT);


   // bind
   if(0 > bind(sd_listen, (struct sockaddr*)&sockaddr_server, sizeof(sockaddr_server)))
   {
      fprintf(stderr,"ERROR: could not bind listening socket\n");
      exit(1);
   }

   // listen
   if(0 > listen(sd_listen, MAX_CONNS))
   {
      fprintf(stderr,"ERROR: listen call failed\n");
      exit(1);
   }


   // malloc the image buffers (this is required for uclinux)
   for(ii=0; ii<NUM_CAMS; ++ii)
   {
      imgbuf[ii] = (uint8*)malloc(NUM_BUFS_PER_CAM*RESOLUTION*sizeof(uint8));
      if(NULL==imgbuf[ii])
      {
         fprintf(stderr,"couldn't malloc %d bytes for the image buffer\n");
         exit(1);
      }
   }

   // and away we go
   while(1)
   {
      sd_client = accept(sd_listen, (struct sockaddr*)&(sockaddr_client), &len);
      if(0 > sd_client)
      {
         fprintf(stderr,"ERROR: accept call failed\n");
         exit(1);
      }

// FIXME: no fork() in uClinux TODO: use vfork() instead (requires exec() to be called)?
//      pid = fork();
//      if(0 == pid)
//      {
//         // child
         request_handler(sd_client);
         if(0 > close(sd_client))
         {
            fprintf(stderr,"ERROR: close call failed\n");
            fflush(stderr);
            exit(1);
         }
//         exit(0);
//      }
//      else
//      {
//         // parent
//
//         // just close socket
//         if(0 > close(sd_client))
//         {
//            fprintf(stderr,"ERROR: close call failed\n");
//            fflush(stderr);
//            exit(1);
//         }
//
//         // TODO russ: should I wait on the child?  (I don't think so)
//      }
   }

   // unreachable
   return -1;
}


//**************************************************************************************************
// local function definitions
//
static void request_handler(int sd)
{
   unsigned ii;
   uint8_t recvBuf[REQ_MAX_LEN];
   unsigned recvLen, recvLenTotal;
   unsigned flag_bad_request;
   unsigned send_len_ret;

   flag_bad_request=0;

   recvLenTotal=0;
   recvBuf[0] = '\0';
   do
   {
      recvLen = recv(sd, (void*)(&(recvBuf[recvLenTotal])), (REQ_MAX_LEN-recvLenTotal), 0);
      if(0 > recvLen)
      {
         if(EAGAIN == errno)
         {
            // do nothing, just try again later
         }
         else
         {
            fprintf(stderr, "request_handler: recv call returns failure");
            fflush(stderr);
            exit(1);
         }
      }
      else if(0 == recvLen)
      {
         flag_bad_request = 1;
      }
      else
      {
         recvLenTotal += recvLen;
         for(ii=0; ii<recvLen; ++ii)
         {
            // I'll just treat a null char as a new line
            if(    ('\0' == recvBuf[recvLenTotal-recvLen+ii])
                || ('\n' == recvBuf[recvLenTotal-recvLen+ii]) )
            {
               // null terminate the request string (we'll ignore the rest)
               recvBuf[recvLenTotal-recvLen+ii] = '\0';
               recvLenTotal = recvLenTotal-recvLen+ii;
               break;
            }
         }
      }
   } while((REQ_MAX_LEN > recvLenTotal) && (0 != recvLen) && ('\0' != recvBuf[recvLenTotal]));

   if(0 == flag_bad_request)
   {
      if((3 <= recvLenTotal) && ('G' == recvBuf[0]) && ('E' == recvBuf[1]) && ('T' == recvBuf[2]))
      {
         // good request!
         // return data
         // TODO: remove debug output (maybe)
         fprintf(stderr, "good request!\n");
         /*FIXME put this back in (right?)
          * send_len_ret = send(sd, (const void*)(&RESP_SUCCESS_HEADER), sizeof(RESP_SUCCESS_HEADER), 0);
         if(sizeof(RESP_SUCCESS_HEADER) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length");
            fflush(stderr);
            exit(1);
         }*/

         // send data!
         request_send_data(sd);
      }
      else
      {
         // bad request :(
         // TODO: remove debug output (maybe)
         flag_bad_request=1; // unnecessary
         fprintf(stderr, "bad request :(\n");
         send_len_ret = send(sd, (const void*)(&RESP_BAD_REQUEST), sizeof(RESP_BAD_REQUEST), 0);
         if(sizeof(RESP_BAD_REQUEST) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length");
            fflush(stderr);
            exit(1);
         }
      }
   }
}

static void request_send_data(int sd)
{
   unsigned ii;
   uint32 regflags;
   uint32 regdata;
   uint16 pixelcount[NUM_CAMS];
   unsigned send_len_ret;


   // send header
   send_len_ret = send(sd, (const void*)(&RESP_FRAME_HEADER), sizeof(RESP_FRAME_HEADER), 0);
   fprintf(stderr,"send_len: %d\n",send_len_ret);
   if(sizeof(RESP_FRAME_HEADER) != send_len_ret)
   {
      fprintf(stderr, "request_send_data: send call returns wrong length (%d)\n",send_len_ret);
      fflush(stderr);
      exit(1);
   }


   // FIXME: best practice dictates that in the even of hardware failure,
   //        we should NOT go into an infinite loop!
   // BUSY wait (get it!?)
   do {/*nothing*/} while(0!=((1<<FLAG_SHIFT_BUSY)&REG_FLAGS));
   REG_CTRL = 1ul;

   // only actually reading data from CAM0
   pixelcount[0]=0;
   while(RESOLUTION>pixelcount[0])
   {
      regflags = REG_CAMX_STATUS(0);
      if(0 == ((1<<FLAG_SHIFT_EMPTY)&regflags))
      {
         regdata=REG_CAMX_PXDATA(0);
/*         fprintf(stderr,"data read           CAM0_PXDATA:=0x%08X\n",regdata);
         fflush(stderr);*/
/*         fprintf(stderr,"regdata: %d\n",regdata);
         fprintf( stderr,"0x%02X 0x%02X 0x%02X 0x%02X \n",regdata&0xFF,
                  (regdata>>8)&0xFF,(regdata>>);*/
         imgbuf[0][pixelcount[0]]   = (regdata>> 0)&0xFF-stonymask[pixelcount[0]];
         imgbuf[0][pixelcount[0]+1] = (regdata>> 8)&0xFF-stonymask[pixelcount[0]+1];
         imgbuf[0][pixelcount[0]+2] = (regdata>>16)&0xFF-stonymask[pixelcount[0]+2];
         imgbuf[0][pixelcount[0]+3] = (regdata>>24)&0xFF-stonymask[pixelcount[0]+3];
/*         fprintf( stderr,"0x%02X 0x%02X 0x%02X 0x%02X \n",imgbuf[pixelcount],
                  imgbuf[pixelcount+1],imgbuf[pixelcount+2],imgbuf[pixelcount+3]);*/
         pixelcount[0]+=4;
      }
   }

   // transmit data
   // mimic 3 cameras
   for(ii=0;ii<NUM_CAMS;++ii)
   {
      send_len_ret = send(sd, (const void*)(imgbuf[0]), RESOLUTION, 0);
      fprintf(stderr,"send_len: %d\n",send_len_ret);
      if(RESOLUTION != send_len_ret)
      {
         fprintf(stderr, "request_send_data: send call returns wrong length (%d)\n",send_len_ret);
         fflush(stderr);
         exit(1);
      }
   }
}
/* TODO
//
// printusage: prints a usage string for the program
//
static void printusage(char *progname)
{
   fprintf(stderr, "Usage: %s [-p port]\n", progname);
}

//
// printhelp: prints the help for the program
//
static void printhelp(char *progname)
{
   printusage(progname);
   fprintf(stderr,"TODO: NO HELP WRITTEN\n");
}

//
// parseargs: parse cli
//
static int parseargs(int argc, char **argv)
{
   char cc;
   extern char *optarg;

   errno=0;

   while ((cc = getopt(argc, argv, "ho:qr")) != EOF)
   {
      switch (cc) {
         case 'h':
            g_flag_print_help=1;
            break;
         case 'p':
            g_port=atoi(optarg);
            break;
         default:
            errno=EINVAL;
            break;
      }
   }

   return(errno);
}
*/
