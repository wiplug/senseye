#ifndef GLASSES_FORMAT_H
#define GLASSES_FORMAT_H
//**************************************************************************************************
// Copyright 2015 Russ Bielawski
//
//
// glasses_format.h
//
// Glasses data exchange format (GDF) C library.
//
//
// Recording file format definitions and helper functions.
//
//
// AUTHOR        FULL NAME             EMAIL ADDRESS
// Russ          Russ Bielawski        russ@bielawski.org
//
// VERSION   DATE        AUTHOR        DESCRIPTION
// 1.00 00   2015-02-15  Russ          Created.
//**************************************************************************************************


//**************************************************************************************************
// Includes
//
// OpenCV is used to work with image formats.
#include "cv.h"


//**************************************************************************************************
// Defines / constants
//
#define GDF_FILE_EXTENSION                 (".gdf.txt")
#define GDF_FRAME_FILE_EXTENSION           (".bmp")
#define GDF_FRAME_FILE_NAME_FORMAT_SUFFIX  ("_<xxxxxx>")
#define GDF_FPS_FILE_EXTENSION             (".txt")
#define GDF_FPS_FILE_NAME_SUFFIX           ("_fps")
enum
{
   GDF_VERSION_MAJOR = 0x01,
   GDF_VERSION_MINOR = 0x01,
   GDF_MAX_LENGTH_PATH = 255,
   GDF_MAX_NUM_CAMS = 4
};

struct gdf_imager_resolution
{
   unsigned horizontal;
   unsigned vertical;
};

struct gdf_capture_record
{
   unsigned version_major;
   unsigned version_minor;
   char path[GDF_MAX_LENGTH_PATH];
   unsigned record_directory_created;
   unsigned num_cams;
   double fps;
   struct gdf_imager_resolution resolution[GDF_MAX_NUM_CAMS];
};


//**************************************************************************************************
// Function prototypes
//
int  gdf_create_record_directory  (struct gdf_capture_record*);
int  gdf_write_metadata_file      (struct gdf_capture_record*);
int  gdf_append_fps               (struct gdf_capture_record*, unsigned, double);
int  gdf_write_frame              (struct gdf_capture_record*, IplImage *[GDF_MAX_NUM_CAMS],
                                   unsigned);

int  gdf_get_metadata_file_name   (struct gdf_capture_record*, char *const);
int  gdf_get_fps_file_name        (struct gdf_capture_record*, char *const);
int  gdf_get_frame_file_name      (struct gdf_capture_record*, char *const, unsigned);


#endif // GLASSES_FORMAT_H
