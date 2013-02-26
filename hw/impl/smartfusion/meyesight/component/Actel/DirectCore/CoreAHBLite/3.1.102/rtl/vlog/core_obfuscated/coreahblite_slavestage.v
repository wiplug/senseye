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
CAHBLTl0Il
(
input
HCLK,
input
HRESETN,
input
CAHBLTO1Il,
input
CAHBLTOOII,
output
reg
CAHBLTI1Il,
output
reg
[
31
:
0
]
CAHBLTI0OI,
output
reg
[
2
:
0
]
CAHBLTO1OI,
output
wire
CAHBLTI1OI,
output
reg
CAHBLTl1OI,
output
reg
[
31
:
0
]
CAHBLTl1Il,
output
wire
CAHBLTOOll,
output
reg
CAHBLTl0OI,
input
[
1
:
0
]
CAHBLTOl1,
input
[
1
:
0
]
CAHBLTIOll,
input
[
1
:
0
]
CAHBLTlOll,
output
reg
[
1
:
0
]
CAHBLTOIll,
output
reg
[
1
:
0
]
CAHBLTIIll,
output
reg
[
1
:
0
]
CAHBLTlIll,
input
[
31
:
0
]
CAHBLTOlll,
input
CAHBLTll1,
input
[
2
:
0
]
CAHBLTIlll,
input
CAHBLTllll,
input
CAHBLTO0ll,
input
[
31
:
0
]
CAHBLTI0ll,
input
CAHBLTO01,
input
[
2
:
0
]
CAHBLTl0ll,
input
CAHBLTO1ll,
input
CAHBLTI1ll,
input
[
31
:
0
]
HWDATA_M0,
input
[
31
:
0
]
HWDATA_M1
)
;
localparam
CAHBLTl1ll
=
1
'b
0
;
localparam
CAHBLTOlOI
=
2
'b
00
;
wire
[
1
:
0
]
CAHBLTOO0l
;
reg
[
1
:
0
]
CAHBLTIO0l
;
reg
CAHBLTlO0l
;
wire
CAHBLTOI0l
;
reg
CAHBLTII0l
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
CAHBLTIO0l
<=
CAHBLTOlOI
;
else
if
(
CAHBLTOOll
)
CAHBLTIO0l
<=
CAHBLTOO0l
;
end
CAHBLTlI1
CAHBLTlI0l
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
.CAHBLTOl1
(
CAHBLTOl1
)
,
.CAHBLTIl1
(
CAHBLTOOll
)
,
.CAHBLTll1
(
CAHBLTll1
)
,
.CAHBLTO01
(
CAHBLTO01
)
,
.CAHBLTI01
(
CAHBLTOO0l
)
)
;
always
@(*)
begin
casez
(
CAHBLTOO0l
)
2
'b
?1
:
begin
CAHBLTI1Il
=
1
'b
1
;
CAHBLTII0l
=
CAHBLTllll
;
CAHBLTO1OI
=
CAHBLTIlll
;
CAHBLTl1OI
=
CAHBLTO0ll
;
CAHBLTI0OI
=
CAHBLTOlll
;
CAHBLTl0OI
=
CAHBLTll1
;
CAHBLTlO0l
=
CAHBLTlOll
[
0
]
;
end
2
'b
1?
:
begin
CAHBLTI1Il
=
1
'b
1
;
CAHBLTII0l
=
CAHBLTO1ll
;
CAHBLTO1OI
=
CAHBLTl0ll
;
CAHBLTl1OI
=
CAHBLTI1ll
;
CAHBLTI0OI
=
CAHBLTI0ll
;
CAHBLTl0OI
=
CAHBLTO01
;
CAHBLTlO0l
=
CAHBLTlOll
[
1
]
;
end
default
:
begin
CAHBLTI1Il
=
1
'b
0
;
CAHBLTII0l
=
CAHBLTl1ll
;
CAHBLTO1OI
=
2
'b
00
;
CAHBLTl1OI
=
1
'b
0
;
CAHBLTI0OI
=
32
'h
0
;
CAHBLTl0OI
=
1
'b
0
;
CAHBLTlO0l
=
1
'b
1
;
end
endcase
end
assign
CAHBLTOI0l
=
|
(
CAHBLTOO0l
&
CAHBLTIOll
)
;
assign
CAHBLTI1OI
=
CAHBLTII0l
&&
(
CAHBLTlO0l
||
CAHBLTOI0l
)
;
assign
CAHBLTOOll
=
CAHBLTO1Il
;
always
@(*)
begin
casez
(
CAHBLTIO0l
)
2
'b
?1
:
begin
CAHBLTl1Il
=
HWDATA_M0
;
end
2
'b
1?
:
begin
CAHBLTl1Il
=
HWDATA_M1
;
end
default
:
begin
CAHBLTl1Il
=
32
'h
0
;
end
endcase
end
always
@(*)
begin
CAHBLTlIll
=
2
'b
00
;
casez
(
CAHBLTIO0l
)
2
'b
?1
:
begin
CAHBLTlIll
[
0
]
=
CAHBLTOOII
;
end
2
'b
1?
:
begin
CAHBLTlIll
[
1
]
=
CAHBLTOOII
;
end
default
:
begin
CAHBLTlIll
=
2
'b
00
;
end
endcase
end
always
@(*)
begin
if
(
CAHBLTOl1
[
0
]
&&
!
CAHBLTOO0l
[
0
]
)
CAHBLTOIll
[
0
]
=
1
'b
0
;
else
if
(
CAHBLTOl1
[
0
]
&&
CAHBLTOO0l
[
0
]
)
CAHBLTOIll
[
0
]
=
CAHBLTO1Il
;
else
CAHBLTOIll
[
0
]
=
1
'b
1
;
end
always
@(*)
begin
if
(
CAHBLTOl1
[
1
]
&&
!
CAHBLTOO0l
[
1
]
)
CAHBLTOIll
[
1
]
=
1
'b
0
;
else
if
(
CAHBLTOl1
[
1
]
&&
CAHBLTOO0l
[
1
]
)
CAHBLTOIll
[
1
]
=
CAHBLTO1Il
;
else
CAHBLTOIll
[
1
]
=
1
'b
1
;
end
always
@(*)
begin
if
(
CAHBLTIOll
[
0
]
&&
!
CAHBLTIO0l
[
0
]
)
CAHBLTIIll
[
0
]
=
1
'b
0
;
else
if
(
CAHBLTIOll
[
0
]
&&
CAHBLTIO0l
[
0
]
)
CAHBLTIIll
[
0
]
=
CAHBLTO1Il
;
else
CAHBLTIIll
[
0
]
=
1
'b
1
;
end
always
@(*)
begin
if
(
CAHBLTIOll
[
1
]
&&
!
CAHBLTIO0l
[
1
]
)
CAHBLTIIll
[
1
]
=
1
'b
0
;
else
if
(
CAHBLTIOll
[
1
]
&&
CAHBLTIO0l
[
1
]
)
CAHBLTIIll
[
1
]
=
CAHBLTO1Il
;
else
CAHBLTIIll
[
1
]
=
1
'b
1
;
end
endmodule