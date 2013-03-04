// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
// Revision Information:
// 10Feb10		Production Release Version 3.1
// SVN Revision Information:
// SVN $Revision: 11955 $
// SVN $Date: 2010-01-30 15:35:13 -0800 (Sat, 30 Jan 2010) $
`timescale 1ns/1ps
module
CAHBLTO0OI
#
(
parameter
[
0
:
0
]
MODE_CFG
=
0
,
parameter
[
16
:
0
]
CAHBLTI
=
(
2
**
17
)
-
1
,
parameter
[
15
:
0
]
CAHBLTl
=
0
)
(
input
HCLK,
input
HRESETN,
input
[
31
:
0
]
CAHBLTI0OI,
input
CAHBLTl0OI,
input
[
2
:
0
]
CAHBLTO1OI,
input
CAHBLTI1OI,
input
CAHBLTl1OI,
output
reg
CAHBLTOOII,
output
reg
[
31
:
0
]
CAHBLTIOII,
output
wire
CAHBLTlOII,
input
CAHBLTII,
input
[
16
:
0
]
CAHBLTOIII,
input
[
16
:
0
]
CAHBLTIIII,
input
[
16
:
0
]
CAHBLTlIII,
input
CAHBLTOlII,
input
CAHBLTIlII,
input
CAHBLTllII,
output
wire
[
31
:
0
]
CAHBLTO0II,
output
reg
CAHBLTI0II,
output
reg
[
2
:
0
]
CAHBLTl0II,
output
reg
CAHBLTO1II,
output
reg
CAHBLTI1II,
output
wire
[
16
:
0
]
CAHBLTl1II,
output
wire
[
16
:
0
]
CAHBLTOOlI,
output
wire
[
15
:
0
]
CAHBLTIOlI,
output
wire
CAHBLTlOlI,
output
wire
CAHBLTOIlI,
output
reg
CAHBLTIIlI,
input
[
31
:
0
]
HRDATA_S0,
input
HREADYOUT_S0,
input
[
31
:
0
]
HRDATA_S1,
input
HREADYOUT_S1,
input
[
31
:
0
]
HRDATA_S2,
input
HREADYOUT_S2,
input
[
31
:
0
]
HRDATA_S3,
input
HREADYOUT_S3,
input
[
31
:
0
]
HRDATA_S4,
input
HREADYOUT_S4,
input
[
31
:
0
]
HRDATA_S5,
input
HREADYOUT_S5,
input
[
31
:
0
]
HRDATA_S6,
input
HREADYOUT_S6,
input
[
31
:
0
]
HRDATA_S7,
input
HREADYOUT_S7,
input
[
31
:
0
]
HRDATA_S8,
input
HREADYOUT_S8,
input
[
31
:
0
]
HRDATA_S9,
input
HREADYOUT_S9,
input
[
31
:
0
]
HRDATA_S10,
input
HREADYOUT_S10,
input
[
31
:
0
]
HRDATA_S11,
input
HREADYOUT_S11,
input
[
31
:
0
]
HRDATA_S12,
input
HREADYOUT_S12,
input
[
31
:
0
]
HRDATA_S13,
input
HREADYOUT_S13,
input
[
31
:
0
]
HRDATA_S14,
input
HREADYOUT_S14,
input
[
31
:
0
]
HRDATA_S15,
input
HREADYOUT_S15,
input
[
31
:
0
]
HRDATA_SHG,
input
HREADYOUT_SHG,
input
CAHBLTlIlI
)
;
localparam
CAHBLTIO1
=
1
'b
0
;
localparam
CAHBLTOllI
=
1
'b
1
;
localparam
CAHBLTIllI
=
17
'b
0_0000_0000_0000_0000
;
localparam
CAHBLTlllI
=
16
'b
0000_0000_0000_0000
;
reg
[
31
:
0
]
CAHBLTO0lI
;
reg
CAHBLTI0lI
;
reg
CAHBLTl0lI
;
reg
CAHBLTO1lI
;
reg
[
31
:
0
]
CAHBLTI1lI
;
reg
CAHBLTl1lI
;
reg
[
2
:
0
]
CAHBLTOO0I
;
reg
CAHBLTIO0I
;
reg
CAHBLTlO0I
;
reg
CAHBLTOI0I
;
reg
CAHBLTII0I
;
wire
[
16
:
0
]
CAHBLTlI0I
;
wire
[
15
:
0
]
CAHBLTOl0I
;
wire
CAHBLTIl0I
;
reg
[
16
:
0
]
CAHBLTll0I
;
reg
[
15
:
0
]
CAHBLTO00I
;
reg
CAHBLTI00I
;
reg
[
16
:
0
]
CAHBLTl00I
;
reg
[
15
:
0
]
CAHBLTO10I
;
reg
CAHBLTI10I
;
wire
[
17
:
0
]
CAHBLTl10I
;
wire
CAHBLTl10
;
wire
CAHBLTOO1
;
wire
CAHBLTI10
;
wire
CAHBLTOO1I
;
wire
CAHBLTIO1I
;
wire
CAHBLTlO1I
;
wire
CAHBLTOI1I
;
wire
CAHBLTII1I
;
wire
CAHBLTlI1I
;
wire
CAHBLTOl1I
;
wire
CAHBLTIl1I
;
wire
CAHBLTll1I
;
wire
CAHBLTO01I
;
wire
CAHBLTI01I
;
wire
CAHBLTl01I
;
wire
CAHBLTO11I
;
wire
CAHBLTI11I
;
wire
CAHBLTl11I
;
wire
CAHBLTOOOl
;
wire
CAHBLTIOOl
;
wire
CAHBLTlOOl
;
wire
CAHBLTOIOl
;
wire
CAHBLTIIOl
;
wire
CAHBLTlIOl
;
wire
CAHBLTOlOl
;
wire
CAHBLTIlOl
;
wire
CAHBLTllOl
;
wire
CAHBLTO0Ol
;
wire
CAHBLTI0Ol
;
wire
CAHBLTl0Ol
;
wire
CAHBLTO1Ol
;
wire
CAHBLTI1Ol
;
wire
CAHBLTl1Ol
;
wire
CAHBLTOOIl
;
wire
CAHBLTIOIl
;
wire
CAHBLTlOIl
;
wire
CAHBLTOIIl
;
reg
CAHBLTIIIl
;
wire
CAHBLTlIIl
;
reg
CAHBLTOlIl
;
reg
CAHBLTIlIl
;
reg
CAHBLTllIl
;
assign
CAHBLTl1II
=
CAHBLTll0I
[
16
:
0
]
;
assign
CAHBLTOOlI
=
CAHBLTl00I
[
16
:
0
]
;
assign
CAHBLTIOlI
=
CAHBLTO00I
[
15
:
0
]
;
assign
CAHBLTlOlI
=
CAHBLTI00I
;
assign
CAHBLTOIlI
=
CAHBLTI10I
;
assign
CAHBLTOO1I
=
(
CAHBLTl00I
[
0
]
&
(
!
CAHBLTI
[
0
]
)
)
;
assign
CAHBLTIO1I
=
(
CAHBLTl00I
[
1
]
&
(
!
CAHBLTI
[
1
]
)
)
;
assign
CAHBLTlO1I
=
(
CAHBLTl00I
[
2
]
&
(
!
CAHBLTI
[
2
]
)
)
;
assign
CAHBLTOI1I
=
(
CAHBLTl00I
[
3
]
&
(
!
CAHBLTI
[
3
]
)
)
;
assign
CAHBLTII1I
=
(
CAHBLTl00I
[
4
]
&
(
!
CAHBLTI
[
4
]
)
)
;
assign
CAHBLTlI1I
=
(
CAHBLTl00I
[
5
]
&
(
!
CAHBLTI
[
5
]
)
)
;
assign
CAHBLTOl1I
=
(
CAHBLTl00I
[
6
]
&
(
!
CAHBLTI
[
6
]
)
)
;
assign
CAHBLTIl1I
=
(
CAHBLTl00I
[
7
]
&
(
!
CAHBLTI
[
7
]
)
)
;
assign
CAHBLTll1I
=
(
CAHBLTl00I
[
8
]
&
(
!
CAHBLTI
[
8
]
)
)
;
assign
CAHBLTO01I
=
(
CAHBLTl00I
[
9
]
&
(
!
CAHBLTI
[
9
]
)
)
;
assign
CAHBLTI01I
=
(
CAHBLTl00I
[
10
]
&
(
!
CAHBLTI
[
10
]
)
)
;
assign
CAHBLTl01I
=
(
CAHBLTl00I
[
11
]
&
(
!
CAHBLTI
[
11
]
)
)
;
assign
CAHBLTO11I
=
(
CAHBLTl00I
[
12
]
&
(
!
CAHBLTI
[
12
]
)
)
;
assign
CAHBLTI11I
=
(
CAHBLTl00I
[
13
]
&
(
!
CAHBLTI
[
13
]
)
)
;
assign
CAHBLTl11I
=
(
CAHBLTl00I
[
14
]
&
(
!
CAHBLTI
[
14
]
)
)
;
assign
CAHBLTOOOl
=
(
CAHBLTl00I
[
15
]
&
(
!
CAHBLTI
[
15
]
)
)
;
assign
CAHBLTIOOl
=
(
CAHBLTl00I
[
16
]
&
(
!
CAHBLTI
[
16
]
)
)
;
assign
CAHBLTlOOl
=
(
CAHBLTO10I
[
0
]
&
(
!
CAHBLTl
[
0
]
)
)
;
assign
CAHBLTOIOl
=
(
CAHBLTO10I
[
1
]
&
(
!
CAHBLTl
[
1
]
)
)
;
assign
CAHBLTIIOl
=
(
CAHBLTO10I
[
2
]
&
(
!
CAHBLTl
[
2
]
)
)
;
assign
CAHBLTlIOl
=
(
CAHBLTO10I
[
3
]
&
(
!
CAHBLTl
[
3
]
)
)
;
assign
CAHBLTOlOl
=
(
CAHBLTO10I
[
4
]
&
(
!
CAHBLTl
[
4
]
)
)
;
assign
CAHBLTIlOl
=
(
CAHBLTO10I
[
5
]
&
(
!
CAHBLTl
[
5
]
)
)
;
assign
CAHBLTllOl
=
(
CAHBLTO10I
[
6
]
&
(
!
CAHBLTl
[
6
]
)
)
;
assign
CAHBLTO0Ol
=
(
CAHBLTO10I
[
7
]
&
(
!
CAHBLTl
[
7
]
)
)
;
assign
CAHBLTI0Ol
=
(
CAHBLTO10I
[
8
]
&
(
!
CAHBLTl
[
8
]
)
)
;
assign
CAHBLTl0Ol
=
(
CAHBLTO10I
[
9
]
&
(
!
CAHBLTl
[
9
]
)
)
;
assign
CAHBLTO1Ol
=
(
CAHBLTO10I
[
10
]
&
(
!
CAHBLTl
[
10
]
)
)
;
assign
CAHBLTI1Ol
=
(
CAHBLTO10I
[
11
]
&
(
!
CAHBLTl
[
11
]
)
)
;
assign
CAHBLTl1Ol
=
(
CAHBLTO10I
[
12
]
&
(
!
CAHBLTl
[
12
]
)
)
;
assign
CAHBLTOOIl
=
(
CAHBLTO10I
[
13
]
&
(
!
CAHBLTl
[
13
]
)
)
;
assign
CAHBLTIOIl
=
(
CAHBLTO10I
[
14
]
&
(
!
CAHBLTl
[
14
]
)
)
;
assign
CAHBLTlOIl
=
(
CAHBLTO10I
[
15
]
&
(
!
CAHBLTl
[
15
]
)
)
;
assign
CAHBLTOIIl
=
CAHBLTI10I
&
~
CAHBLTIIIl
;
assign
CAHBLTI10
=
(
CAHBLTOO1I
|
CAHBLTIO1I
|
CAHBLTlO1I
|
CAHBLTOI1I
|
CAHBLTII1I
|
CAHBLTlI1I
|
CAHBLTOl1I
|
CAHBLTIl1I
|
CAHBLTll1I
|
CAHBLTO01I
|
CAHBLTI01I
|
CAHBLTl01I
|
CAHBLTO11I
|
CAHBLTI11I
|
CAHBLTl11I
|
CAHBLTOOOl
|
CAHBLTIOOl
|
CAHBLTlOOl
|
CAHBLTOIOl
|
CAHBLTIIOl
|
CAHBLTlIOl
|
CAHBLTOlOl
|
CAHBLTIlOl
|
CAHBLTllOl
|
CAHBLTO0Ol
|
CAHBLTI0Ol
|
CAHBLTl0Ol
|
CAHBLTO1Ol
|
CAHBLTI1Ol
|
CAHBLTl1Ol
|
CAHBLTOOIl
|
CAHBLTIOIl
|
CAHBLTlOIl
|
CAHBLTOIIl
|
CAHBLTIlIl
)
;
always
@
(
posedge
HCLK
or
negedge
HRESETN
)
begin
if
(
!
HRESETN
)
begin
CAHBLTI1lI
<=
32
'h
0
;
CAHBLTl1lI
<=
1
'b
0
;
CAHBLTOO0I
<=
3
'b
0
;
CAHBLTIO0I
<=
1
'b
0
;
CAHBLTlO0I
<=
1
'b
0
;
end
else
begin
if
(
CAHBLTO1lI
)
begin
CAHBLTI1lI
<=
CAHBLTI0OI
;
CAHBLTl1lI
<=
CAHBLTl0OI
;
CAHBLTOO0I
<=
CAHBLTO1OI
;
CAHBLTIO0I
<=
CAHBLTI1OI
;
CAHBLTlO0I
<=
CAHBLTl1OI
;
end
end
end
always
@(*)
begin
if
(
CAHBLTI0lI
==
1
'b
0
)
begin
CAHBLTO0lI
=
CAHBLTI0OI
;
CAHBLTI0II
=
CAHBLTl0OI
;
CAHBLTl0II
=
CAHBLTO1OI
;
CAHBLTO1II
=
CAHBLTI1OI
;
CAHBLTI1II
=
CAHBLTl1OI
;
end
else
begin
CAHBLTO0lI
=
CAHBLTI1lI
;
CAHBLTI0II
=
CAHBLTl1lI
;
CAHBLTl0II
=
CAHBLTOO0I
;
CAHBLTO1II
=
CAHBLTIO0I
;
CAHBLTI1II
=
CAHBLTlO0I
;
end
end
CAHBLTO
#
(
.MODE_CFG
(
MODE_CFG
)
,
.CAHBLTI
(
CAHBLTI
)
,
.CAHBLTl
(
CAHBLTl
)
)
CAHBLTO0Il
(
.CAHBLTOI
(
CAHBLTO0lI
)
,
.CAHBLTII
(
CAHBLTII
)
,
.CAHBLTlI
(
CAHBLTlI0I
[
16
:
0
]
)
,
.CAHBLTOl
(
CAHBLTOl0I
[
15
:
0
]
)
,
.CAHBLTIl
(
CAHBLTO0II
[
31
:
0
]
)
,
.CAHBLTll
(
CAHBLTlIIl
)
)
;
assign
CAHBLTIl0I
=
(
|
CAHBLTOl0I
[
15
:
0
]
)
;
always
@(*)
begin
if
(
CAHBLTO1II
)
begin
CAHBLTll0I
=
CAHBLTlI0I
;
CAHBLTO00I
=
CAHBLTOl0I
;
CAHBLTI00I
=
CAHBLTIl0I
;
CAHBLTOlIl
=
CAHBLTlIIl
;
end
else
begin
CAHBLTll0I
=
CAHBLTIllI
;
CAHBLTO00I
=
CAHBLTlllI
;
CAHBLTI00I
=
1
'b
0
;
CAHBLTOlIl
=
1
'b
0
;
end
end
always
@
(
posedge
HCLK
or
negedge
HRESETN
)
begin
if
(
!
HRESETN
)
CAHBLTl00I
<=
CAHBLTIllI
;
else
if
(
CAHBLTIIlI
)
CAHBLTl00I
<=
CAHBLTll0I
;
end
always
@
(
posedge
HCLK
or
negedge
HRESETN
)
begin
if
(
!
HRESETN
)
begin
CAHBLTO10I
<=
CAHBLTlllI
;
CAHBLTI10I
<=
1
'b
0
;
CAHBLTIIIl
<=
1
'b
0
;
CAHBLTIlIl
<=
1
'b
0
;
end
else
if
(
CAHBLTIIlI
)
begin
CAHBLTO10I
<=
CAHBLTO00I
;
CAHBLTI10I
<=
CAHBLTI00I
;
CAHBLTIIIl
<=
CAHBLTI1II
;
CAHBLTIlIl
<=
CAHBLTOlIl
;
end
end
assign
CAHBLTl10I
=
{
CAHBLTI10I
,
CAHBLTl00I
[
16
:
0
]
}
;
always
@(*)
begin
if
(
CAHBLTIlIl
)
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
else
begin
casez
(
CAHBLTl10I
)
18
'b
?????????????????1
:
begin
if
(
CAHBLTI
[
0
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
0
]
;
CAHBLTOOII
=
CAHBLTlIII
[
0
]
;
CAHBLTIOII
=
HRDATA_S0
;
CAHBLTIIlI
=
HREADYOUT_S0
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
????????????????1?
:
begin
if
(
CAHBLTI
[
1
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
1
]
;
CAHBLTOOII
=
CAHBLTlIII
[
1
]
;
CAHBLTIOII
=
HRDATA_S1
;
CAHBLTIIlI
=
HREADYOUT_S1
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
???????????????1??
:
begin
if
(
CAHBLTI
[
2
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
2
]
;
CAHBLTOOII
=
CAHBLTlIII
[
2
]
;
CAHBLTIOII
=
HRDATA_S2
;
CAHBLTIIlI
=
HREADYOUT_S2
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
??????????????1???
:
begin
if
(
CAHBLTI
[
3
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
3
]
;
CAHBLTOOII
=
CAHBLTlIII
[
3
]
;
CAHBLTIOII
=
HRDATA_S3
;
CAHBLTIIlI
=
HREADYOUT_S3
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
?????????????1????
:
begin
if
(
CAHBLTI
[
4
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
4
]
;
CAHBLTOOII
=
CAHBLTlIII
[
4
]
;
CAHBLTIOII
=
HRDATA_S4
;
CAHBLTIIlI
=
HREADYOUT_S4
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
????????????1?????
:
begin
if
(
CAHBLTI
[
5
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
5
]
;
CAHBLTOOII
=
CAHBLTlIII
[
5
]
;
CAHBLTIOII
=
HRDATA_S5
;
CAHBLTIIlI
=
HREADYOUT_S5
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
???????????1??????
:
begin
if
(
CAHBLTI
[
6
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
6
]
;
CAHBLTOOII
=
CAHBLTlIII
[
6
]
;
CAHBLTIOII
=
HRDATA_S6
;
CAHBLTIIlI
=
HREADYOUT_S6
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
??????????1???????
:
begin
if
(
CAHBLTI
[
7
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
7
]
;
CAHBLTOOII
=
CAHBLTlIII
[
7
]
;
CAHBLTIOII
=
HRDATA_S7
;
CAHBLTIIlI
=
HREADYOUT_S7
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
?????????1????????
:
begin
if
(
CAHBLTI
[
8
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
8
]
;
CAHBLTOOII
=
CAHBLTlIII
[
8
]
;
CAHBLTIOII
=
HRDATA_S8
;
CAHBLTIIlI
=
HREADYOUT_S8
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
????????1?????????
:
begin
if
(
CAHBLTI
[
9
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
9
]
;
CAHBLTOOII
=
CAHBLTlIII
[
9
]
;
CAHBLTIOII
=
HRDATA_S9
;
CAHBLTIIlI
=
HREADYOUT_S9
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
???????1??????????
:
begin
if
(
CAHBLTI
[
10
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
10
]
;
CAHBLTOOII
=
CAHBLTlIII
[
10
]
;
CAHBLTIOII
=
HRDATA_S10
;
CAHBLTIIlI
=
HREADYOUT_S10
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
??????1???????????
:
begin
if
(
CAHBLTI
[
11
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
11
]
;
CAHBLTOOII
=
CAHBLTlIII
[
11
]
;
CAHBLTIOII
=
HRDATA_S11
;
CAHBLTIIlI
=
HREADYOUT_S11
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
?????1????????????
:
begin
if
(
CAHBLTI
[
12
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
12
]
;
CAHBLTOOII
=
CAHBLTlIII
[
12
]
;
CAHBLTIOII
=
HRDATA_S12
;
CAHBLTIIlI
=
HREADYOUT_S12
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
????1?????????????
:
begin
if
(
CAHBLTI
[
13
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
13
]
;
CAHBLTOOII
=
CAHBLTlIII
[
13
]
;
CAHBLTIOII
=
HRDATA_S13
;
CAHBLTIIlI
=
HREADYOUT_S13
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
???1??????????????
:
begin
if
(
CAHBLTI
[
14
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
14
]
;
CAHBLTOOII
=
CAHBLTlIII
[
14
]
;
CAHBLTIOII
=
HRDATA_S14
;
CAHBLTIIlI
=
HREADYOUT_S14
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
??1???????????????
:
begin
if
(
CAHBLTI
[
15
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
15
]
;
CAHBLTOOII
=
CAHBLTlIII
[
15
]
;
CAHBLTIOII
=
HRDATA_S15
;
CAHBLTIIlI
=
HREADYOUT_S15
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
?1????????????????
:
begin
if
(
CAHBLTI
[
16
]
)
begin
CAHBLTllIl
=
CAHBLTIIII
[
16
]
;
CAHBLTOOII
=
CAHBLTlIII
[
16
]
;
CAHBLTIOII
=
HRDATA_SHG
;
CAHBLTIIlI
=
HREADYOUT_SHG
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
18
'b
1?????????????????
:
begin
if
(
!
CAHBLTIIIl
)
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
else
begin
casez
(
CAHBLTO10I
)
16
'b
???????????????1
:
begin
if
(
CAHBLTl
[
0
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
??????????????1?
:
begin
if
(
CAHBLTl
[
1
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
?????????????1??
:
begin
if
(
CAHBLTl
[
2
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
????????????1???
:
begin
if
(
CAHBLTl
[
3
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
???????????1????
:
begin
if
(
CAHBLTl
[
4
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
??????????1?????
:
begin
if
(
CAHBLTl
[
5
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
?????????1??????
:
begin
if
(
CAHBLTl
[
6
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
????????1???????
:
begin
if
(
CAHBLTl
[
7
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
???????1????????
:
begin
if
(
CAHBLTl
[
8
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
??????1?????????
:
begin
if
(
CAHBLTl
[
9
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
?????1??????????
:
begin
if
(
CAHBLTl
[
10
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
????1???????????
:
begin
if
(
CAHBLTl
[
11
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
???1????????????
:
begin
if
(
CAHBLTl
[
12
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
??1?????????????
:
begin
if
(
CAHBLTl
[
13
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
?1??????????????
:
begin
if
(
CAHBLTl
[
14
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
16
'b
1???????????????
:
begin
if
(
CAHBLTl
[
15
]
)
begin
CAHBLTllIl
=
CAHBLTIlII
;
CAHBLTOOII
=
CAHBLTllII
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTlIlI
;
end
else
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
end
default
:
begin
CAHBLTllIl
=
CAHBLTl10
;
CAHBLTOOII
=
CAHBLTOO1
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
CAHBLTl10
;
end
endcase
end
end
default
:
begin
CAHBLTllIl
=
1
'b
1
;
CAHBLTOOII
=
1
'b
0
;
CAHBLTIOII
=
32
'h
0
;
CAHBLTIIlI
=
1
'b
1
;
end
endcase
end
end
always
@(*)
begin
CAHBLTO1lI
=
1
'b
0
;
CAHBLTl0lI
=
1
'b
0
;
case
(
CAHBLTOI0I
)
CAHBLTIO1
:
begin
if
(
CAHBLTI1OI
&&
CAHBLTlOII
&&
(
(
CAHBLTlI0I
[
0
]
&&
!
CAHBLTOIII
[
0
]
)
||
(
CAHBLTlI0I
[
1
]
&&
!
CAHBLTOIII
[
1
]
)
||
(
CAHBLTlI0I
[
2
]
&&
!
CAHBLTOIII
[
2
]
)
||
(
CAHBLTlI0I
[
3
]
&&
!
CAHBLTOIII
[
3
]
)
||
(
CAHBLTlI0I
[
4
]
&&
!
CAHBLTOIII
[
4
]
)
||
(
CAHBLTlI0I
[
5
]
&&
!
CAHBLTOIII
[
5
]
)
||
(
CAHBLTlI0I
[
6
]
&&
!
CAHBLTOIII
[
6
]
)
||
(
CAHBLTlI0I
[
7
]
&&
!
CAHBLTOIII
[
7
]
)
||
(
CAHBLTlI0I
[
8
]
&&
!
CAHBLTOIII
[
8
]
)
||
(
CAHBLTlI0I
[
9
]
&&
!
CAHBLTOIII
[
9
]
)
||
(
CAHBLTlI0I
[
10
]
&&
!
CAHBLTOIII
[
10
]
)
||
(
CAHBLTlI0I
[
11
]
&&
!
CAHBLTOIII
[
11
]
)
||
(
CAHBLTlI0I
[
12
]
&&
!
CAHBLTOIII
[
12
]
)
||
(
CAHBLTlI0I
[
13
]
&&
!
CAHBLTOIII
[
13
]
)
||
(
CAHBLTlI0I
[
14
]
&&
!
CAHBLTOIII
[
14
]
)
||
(
CAHBLTlI0I
[
15
]
&&
!
CAHBLTOIII
[
15
]
)
||
(
CAHBLTlI0I
[
16
]
&&
!
CAHBLTOIII
[
16
]
)
||
(
CAHBLTIl0I
&&
!
CAHBLTOlII
)
)
)
begin
CAHBLTO1lI
=
1
'b
1
;
CAHBLTl0lI
=
1
'b
1
;
CAHBLTII0I
=
CAHBLTOllI
;
end
else
CAHBLTII0I
=
CAHBLTIO1
;
end
CAHBLTOllI
:
begin
if
(
(
CAHBLTlI0I
[
0
]
&&
CAHBLTOIII
[
0
]
)
||
(
CAHBLTlI0I
[
1
]
&&
CAHBLTOIII
[
1
]
)
||
(
CAHBLTlI0I
[
2
]
&&
CAHBLTOIII
[
2
]
)
||
(
CAHBLTlI0I
[
3
]
&&
CAHBLTOIII
[
3
]
)
||
(
CAHBLTlI0I
[
4
]
&&
CAHBLTOIII
[
4
]
)
||
(
CAHBLTlI0I
[
5
]
&&
CAHBLTOIII
[
5
]
)
||
(
CAHBLTlI0I
[
6
]
&&
CAHBLTOIII
[
6
]
)
||
(
CAHBLTlI0I
[
7
]
&&
CAHBLTOIII
[
7
]
)
||
(
CAHBLTlI0I
[
8
]
&&
CAHBLTOIII
[
8
]
)
||
(
CAHBLTlI0I
[
9
]
&&
CAHBLTOIII
[
9
]
)
||
(
CAHBLTlI0I
[
10
]
&&
CAHBLTOIII
[
10
]
)
||
(
CAHBLTlI0I
[
11
]
&&
CAHBLTOIII
[
11
]
)
||
(
CAHBLTlI0I
[
12
]
&&
CAHBLTOIII
[
12
]
)
||
(
CAHBLTlI0I
[
13
]
&&
CAHBLTOIII
[
13
]
)
||
(
CAHBLTlI0I
[
14
]
&&
CAHBLTOIII
[
14
]
)
||
(
CAHBLTlI0I
[
15
]
&&
CAHBLTOIII
[
15
]
)
||
(
CAHBLTlI0I
[
16
]
&&
CAHBLTOIII
[
16
]
)
||
(
CAHBLTIl0I
&&
CAHBLTOlII
)
)
CAHBLTII0I
=
CAHBLTIO1
;
else
begin
CAHBLTl0lI
=
1
'b
1
;
CAHBLTII0I
=
CAHBLTOllI
;
end
end
default
:
CAHBLTII0I
=
CAHBLTIO1
;
endcase
end
always
@
(
posedge
HCLK
or
negedge
HRESETN
)
begin
if
(
!
HRESETN
)
begin
CAHBLTOI0I
<=
CAHBLTIO1
;
CAHBLTI0lI
<=
1
'b
0
;
end
else
begin
CAHBLTOI0I
<=
CAHBLTII0I
;
CAHBLTI0lI
<=
CAHBLTl0lI
;
end
end
CAHBLTO10
CAHBLTI0Il
(
.HCLK
(
HCLK
)
,
.HRESETN
(
HRESETN
)
,
.CAHBLTI10
(
CAHBLTI10
)
,
.CAHBLTl10
(
CAHBLTl10
)
,
.CAHBLTOO1
(
CAHBLTOO1
)
)
;
assign
CAHBLTlOII
=
CAHBLTllIl
;
endmodule