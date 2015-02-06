// Copyright 2009 Actel Corporation. All rights reserved.
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// Revision Information:
// SVN Revision Information:
// SVN $Revision: $
module
CAHBtoAPB3O1I
(
input
wire
HCLK,
input
wire
HRESETN,
input
wire
CAHBtoAPB3l,
input
wire
CAHBtoAPB3OI,
input
wire
CAHBtoAPB3II,
input
wire
CAHBtoAPB3lI,
input
wire
CAHBtoAPB3Ol,
input
wire
[
23
:
0
]
HADDR,
input
wire
[
31
:
0
]
HWDATA,
output
reg
[
31
:
0
]
HRDATA,
output
reg
[
23
:
0
]
PADDR,
output
reg
[
31
:
0
]
PWDATA,
input
wire
[
31
:
0
]
PRDATA
)
;
reg
[
23
:
0
]
CAHBtoAPB3I1I
;
reg
[
23
:
0
]
CAHBtoAPB3l1I
;
reg
[
31
:
0
]
CAHBtoAPB3OOl
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
CAHBtoAPB3I1I
<=
28
'b
0
;
end
else
begin
if
(
CAHBtoAPB3l
)
begin
CAHBtoAPB3I1I
<=
HADDR
[
23
:
0
]
;
end
else
begin
if
(
CAHBtoAPB3Ol
)
begin
CAHBtoAPB3I1I
<=
CAHBtoAPB3l1I
[
23
:
0
]
;
end
end
end
end
always
@(*)
begin
PADDR
=
CAHBtoAPB3I1I
[
23
:
0
]
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
CAHBtoAPB3l1I
<=
28
'b
0
;
end
else
begin
if
(
CAHBtoAPB3lI
)
begin
CAHBtoAPB3l1I
<=
HADDR
[
23
:
0
]
;
end
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
begin
CAHBtoAPB3OOl
<=
32
'b
0
;
end
else
begin
if
(
CAHBtoAPB3OI
)
begin
CAHBtoAPB3OOl
[
31
:
0
]
<=
HWDATA
[
31
:
0
]
;
end
end
end
always
@(*)
begin
PWDATA
[
31
:
0
]
=
CAHBtoAPB3OOl
[
31
:
0
]
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
HRDATA
[
31
:
0
]
<=
32
'b
0
;
end
else
begin
if
(
CAHBtoAPB3II
)
begin
HRDATA
[
31
:
0
]
<=
PRDATA
[
31
:
0
]
;
end
end
end
endmodule