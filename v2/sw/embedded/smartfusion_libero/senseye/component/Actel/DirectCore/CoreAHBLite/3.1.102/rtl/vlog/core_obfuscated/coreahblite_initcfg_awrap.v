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
CAHBLTOl0l
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
[
15
:
0
]
CAHBLTI1Il,
input
[
2
:
0
]
CAHBLTO1OI,
input
CAHBLTIl0l,
input
[
1
:
0
]
CAHBLTI1OI,
input
CAHBLTl1OI,
input
[
31
:
0
]
CAHBLTl1Il,
output
wire
[
31
:
0
]
CAHBLTIOII,
output
wire
CAHBLTOOII,
output
wire
CAHBLTO1Il,
output
wire
[
15
:
0
]
CAHBLTll0l,
output
wire
[
15
:
0
]
CAHBLTO00l,
output
wire
[
11
:
0
]
CAHBLTI00l,
output
wire
[
31
:
0
]
CAHBLTl00l
)
;
localparam
[
1
:
0
]
CAHBLTl1ll
=
2
'b
00
;
localparam
[
1
:
0
]
CAHBLTO10l
=
2
'b
01
;
localparam
[
1
:
0
]
CAHBLTI10l
=
2
'b
10
;
localparam
[
1
:
0
]
CAHBLTl10l
=
2
'b
11
;
localparam
[
0
:
0
]
CAHBLTOO1l
=
1
'b
0
;
localparam
[
0
:
0
]
CAHBLTIO1l
=
1
'b
1
;
localparam
[
2
:
0
]
CAHBLTlO1l
=
3
'b
000
;
localparam
[
2
:
0
]
CAHBLTOI1l
=
3
'b
001
;
localparam
[
2
:
0
]
CAHBLTII1l
=
3
'b
010
;
wire
CAHBLTlI1l
;
wire
CAHBLTOl1l
;
reg
CAHBLTIl1l
;
wire
CAHBLTll1l
;
wire
CAHBLTO01l
;
reg
CAHBLTI01l
;
reg
CAHBLTl01l
;
reg
CAHBLTO11l
;
reg
[
11
:
0
]
CAHBLTI11l
;
reg
[
15
:
0
]
CAHBLTl11l
;
reg
CAHBLTOOO0
;
reg
[
15
:
0
]
CAHBLTIOO0
;
reg
CAHBLTlOO0
;
wire
[
15
:
0
]
CAHBLTOIO0
;
wire
CAHBLTIIO0
;
reg
CAHBLTlIO0
;
assign
CAHBLTOOII
=
CAHBLTOO1l
;
assign
CAHBLTIOII
=
32
'b
0
;
assign
CAHBLTlI1l
=
(
|
CAHBLTI1Il
[
15
:
0
]
)
;
assign
CAHBLTO01l
=
CAHBLTOl1l
&&
CAHBLTIl0l
&&
CAHBLTlI1l
&&
(
(
CAHBLTI1OI
==
CAHBLTI10l
)
||
(
CAHBLTI1OI
==
CAHBLTl10l
)
)
;
assign
CAHBLTIIO0
=
CAHBLTlI1l
&
CAHBLTl1OI
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
CAHBLTI01l
<=
1
'b
0
;
CAHBLTIl1l
<=
1
'b
0
;
CAHBLTI11l
<=
12
'b
0
;
CAHBLTlOO0
<=
1
'b
0
;
CAHBLTOOO0
<=
1
'b
0
;
CAHBLTIOO0
<=
16
'b
0
;
CAHBLTl01l
<=
1
'b
0
;
CAHBLTO11l
<=
1
'b
0
;
CAHBLTl11l
<=
16
'b
0
;
CAHBLTlIO0
<=
1
'b
0
;
end
else
begin
CAHBLTlIO0
<=
CAHBLTIIO0
;
CAHBLTI01l
<=
CAHBLTO01l
;
CAHBLTIl1l
<=
CAHBLTOl1l
;
if
(
CAHBLTO01l
)
begin
case
(
CAHBLTO1OI
)
CAHBLTlO1l
:
begin
CAHBLTI11l
[
11
:
0
]
<=
CAHBLTI0OI
[
11
:
0
]
;
CAHBLTlOO0
<=
(
&
CAHBLTI0OI
[
11
:
0
]
)
&
CAHBLTl1OI
;
end
CAHBLTOI1l
:
begin
CAHBLTI11l
[
11
:
0
]
<=
{
1
'b
0
,
CAHBLTI0OI
[
11
:
1
]
}
;
CAHBLTlOO0
<=
(
&
CAHBLTI0OI
[
11
:
1
]
)
&
CAHBLTl1OI
;
end
default
:
begin
CAHBLTI11l
[
11
:
0
]
<=
{
2
'b
00
,
CAHBLTI0OI
[
11
:
2
]
}
;
CAHBLTlOO0
<=
(
&
CAHBLTI0OI
[
11
:
2
]
)
&
CAHBLTl1OI
;
end
endcase
CAHBLTOOO0
<=
CAHBLTl1OI
;
CAHBLTIOO0
<=
CAHBLTI1Il
;
end
if
(
CAHBLTO01l
&
CAHBLTl1OI
)
CAHBLTl01l
<=
1
'b
1
;
else
if
(
CAHBLTO11l
)
CAHBLTl01l
<=
1
'b
0
;
CAHBLTO11l
<=
(
CAHBLTI01l
&
CAHBLTOOO0
)
;
if
(
CAHBLTO11l
&
CAHBLTOOO0
)
begin
:
CAHBLTOlO0
integer
CAHBLTIlO0
;
for
(
CAHBLTIlO0
=
0
;
CAHBLTIlO0
<
16
;
CAHBLTIlO0
=
CAHBLTIlO0
+
1
)
begin
if
(
CAHBLTIOO0
[
CAHBLTIlO0
]
)
begin
if
(
CAHBLTlOO0
)
CAHBLTl11l
[
CAHBLTIlO0
]
<=
1
'b
1
;
else
CAHBLTl11l
[
CAHBLTIlO0
]
<=
1
'b
0
;
end
end
end
end
end
assign
CAHBLTll1l
=
CAHBLTOl1l
&
~
CAHBLTIl1l
;
assign
CAHBLTOl1l
=
~
(
(
~
CAHBLTlIO0
&
CAHBLTIIO0
)
|
(
CAHBLTl01l
&
~
CAHBLTO11l
)
)
;
assign
CAHBLTO1Il
=
CAHBLTOl1l
;
assign
CAHBLTI00l
[
11
:
0
]
=
CAHBLTI11l
[
11
:
0
]
;
assign
CAHBLTOIO0
[
15
:
0
]
=
{
16
{
CAHBLTO11l
}
}
&
CAHBLTIOO0
[
15
:
0
]
;
assign
CAHBLTll0l
[
15
:
0
]
=
CAHBLTOIO0
[
15
:
0
]
;
assign
CAHBLTO00l
[
15
:
0
]
=
CAHBLTl11l
[
15
:
0
]
;
assign
CAHBLTl00l
[
31
:
0
]
=
CAHBLTl1Il
[
31
:
0
]
;
endmodule