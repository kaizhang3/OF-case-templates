r = 0.5;
R = 4;
Side = 15;
Grid_Side = 80;
Prog_Side = 1.01;

Inlet = -15;
Grid_Inlet = 20;
Prog_Inlet = 1.2;

Outlet = 6;
Grid_Outlet = 30;
Prog_Outlet = 1;

Outlet2 = 40;
Grid_Outlet2 = 12;
Prog_Outlet2 = 1;

cylinder_surface_grids = 50;
Grid_BL = 120;
Prog_BL = 1.02;

Point(0) = {0, 0, 0};
Point(1) = {Sqrt(2)/2*r, Sqrt(2)/2*r, 0};
Point(2) = {Sqrt(2)/2*r, -Sqrt(2)/2*r, 0};
Point(3) = {-Sqrt(2)/2*r, -Sqrt(2)/2*r, 0};
Point(4) = {-Sqrt(2)/2*r, Sqrt(2)/2*r, 0};

Circle(1) = {1, 0, 2}; Transfinite Line {1} = cylinder_surface_grids Using Progression 1.00;
Circle(2) = {2, 0, 3}; Transfinite Line {2} = cylinder_surface_grids+1 Using Progression 1.00;
Circle(3) = {3, 0, 4}; Transfinite Line {3} = cylinder_surface_grids Using Progression 1.00;
Circle(4) = {4, 0, 1}; Transfinite Line {4} = cylinder_surface_grids Using Progression 1.00;

Point(5) = {Sqrt(2)/2*R, Sqrt(2)/2*R, 0};
Point(6) = {Sqrt(2)/2*R, -Sqrt(2)/2*R, 0};
Point(7) = {-Sqrt(2)/2*R, -Sqrt(2)/2*R, 0};
Point(8) = {-Sqrt(2)/2*R, Sqrt(2)/2*R, 0};

Circle(5) = {5, 0, 6}; Transfinite Line {5} = cylinder_surface_grids Using Progression 1.00;
Circle(6) = {6, 0, 7}; Transfinite Line {6} = cylinder_surface_grids+1 Using Progression 1.00;
Circle(7) = {7, 0, 8}; Transfinite Line {7} = cylinder_surface_grids Using Progression 1.00;
Circle(8) = {8, 0, 5}; Transfinite Line {8} = cylinder_surface_grids Using Progression 1.00;

Line(9) = {1, 5}; Transfinite Line {9} = Grid_BL Using Progression Prog_BL;
Line(10) = {2, 6}; Transfinite Line {10} = Grid_BL Using Progression Prog_BL;
Line(11) = {3, 7}; Transfinite Line {11} = Grid_BL Using Progression Prog_BL;
Line(12) = {4, 8}; Transfinite Line {12} = Grid_BL Using Progression Prog_BL;


Line Loop(1) = {1, 10, -5, -9};
Plane Surface(1) = {1};
Line Loop(2) = {6, -11, -2, 10};
Plane Surface(2) = {2};
Line Loop(3) = {7, -12, -3, 11};
Plane Surface(3) = {3};
Line Loop(4) = {8, -9, -4, 12};
Plane Surface(4) = {4};

/************************* Inner circle finished *****************************/

Point(9) = {Sqrt(2)/2*R, Side, 0};
Point(10) = {Sqrt(2)/2*R, -Side, 0};
Point(11) = {-Sqrt(2)/2*R, -Side, 0};
Point(12) = {-Sqrt(2)/2*R, Side, 0};

Line(13) = {5, 9}; Transfinite Line {13} = Grid_Side Using Progression Prog_Side;
Line(14) = {6, 10}; Transfinite Line {14} = Grid_Side Using Progression Prog_Side;
Line(15) = {7, 11}; Transfinite Line {15} = Grid_Side Using Progression Prog_Side;
Line(16) = {8, 12}; Transfinite Line {16} = Grid_Side Using Progression Prog_Side;

Point(13) = {Inlet, Sqrt(2)/2*R, 0};
Point(14) = {Inlet, -Sqrt(2)/2*R, 0};
Line(17) = {8, 13}; Transfinite Line {17} = Grid_Inlet Using Progression Prog_Inlet;
Line(18) = {7, 14}; Transfinite Line {18} = Grid_Inlet Using Progression Prog_Inlet;

Point(15) = {Outlet, Sqrt(2)/2*R, 0};
Point(16) = {Outlet, -Sqrt(2)/2*R, 0};
Line(19) = {5, 15}; Transfinite Line {19} = Grid_Outlet Using Progression Prog_Outlet;
Line(20) = {6, 16}; Transfinite Line {20} = Grid_Outlet Using Progression Prog_Outlet;

Point(17) = {Inlet, Side, 0};
Point(18) = {Inlet, -Side, 0};
Point(19) = {Outlet, Side, 0};
Point(20) = {Outlet, -Side, 0};

Line(21) = {12, 17}; Transfinite Line {21} = Grid_Inlet Using Progression Prog_Inlet;
Line(22) = {11, 18}; Transfinite Line {22} = Grid_Inlet Using Progression Prog_Inlet;

Line(23) = {9, 19}; Transfinite Line {23} = Grid_Outlet Using Progression Prog_Outlet;
Line(24) = {10, 20}; Transfinite Line {24} = Grid_Outlet Using Progression Prog_Outlet;

Line(25) = {13, 17}; Transfinite Line {25} = Grid_Side Using Progression Prog_Side;
Line(26) = {15, 19}; Transfinite Line {26} = Grid_Side Using Progression Prog_Side;
Line(27) = {16, 20}; Transfinite Line {27} = Grid_Side Using Progression Prog_Side;
Line(28) = {14, 18}; Transfinite Line {28} = Grid_Side Using Progression Prog_Side;

Line(29) = {13, 14}; Transfinite Line {29} = cylinder_surface_grids Using Progression 1.00;
Line(30) = {12, 9}; Transfinite Line {30} = cylinder_surface_grids Using Progression 1.00;
Line(31) = {11, 10}; Transfinite Line {31} = cylinder_surface_grids+1 Using Progression 1.00;
Line(32) = {15, 16}; Transfinite Line {32} = cylinder_surface_grids Using Progression 1.00;


Line Loop(5) = {25, -21, -16, 17};
Plane Surface(5) = {5};
Line Loop(6) = {29, -18, 7, 17};
Plane Surface(6) = {6};
Line Loop(7) = {15, 22, -28, -18};
Plane Surface(7) = {7};
Line Loop(8) = {15, 31, -14, 6};
Plane Surface(8) = {8};
Line Loop(9) = {20, 27, -24, -14};
Plane Surface(9) = {9};
Line Loop(10) = {19, 32, -20, -5};
Plane Surface(10) = {10};
Line Loop(11) = {26, -23, -13, 19};
Plane Surface(11) = {11};
Line Loop(12) = {16, 30, -13, -8};
Plane Surface(12) = {12};



Point(41) = {Outlet2, Side, 0};
Point(42) = {Outlet2, Sqrt(2)/2*R, 0};
Point(43) = {Outlet2, -Sqrt(2)/2*R, 0};
Point(44) = {Outlet2, -Side, 0};

Line(33) = {19, 41}; Transfinite Line {33} = Grid_Outlet2 Using Progression Prog_Outlet2; 
Line(34) = {15, 42}; Transfinite Line {34} = Grid_Outlet2 Using Progression Prog_Outlet2; 
Line(35) = {16, 43}; Transfinite Line {35} = Grid_Outlet2 Using Progression Prog_Outlet2; 
Line(36) = {20, 44}; Transfinite Line {36} = Grid_Outlet2 Using Progression Prog_Outlet2;

Line(37) = {41, 42}; Transfinite Line {37} = Grid_Side Using Progression Prog_Side;
Line(38) = {42, 43}; Transfinite Line {38} = cylinder_surface_grids Using Progression 1.00;
Line(39) = {43, 44}; Transfinite Line {39} = Grid_Side Using Progression Prog_Side;

Line Loop(13) = {26, 33, 37, -34};
Plane Surface(13) = {13};
Line Loop(14) = {34, 38, -35, -32};
Plane Surface(14) = {14};
Line Loop(15) = {35, 39, -36, -27};
Plane Surface(15) = {15};
Transfinite Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}; Recombine Surface {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};

Extrude {0, 0, 0.05} {
  Surface{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
  Layers{1}; Recombine;
}



Physical Surface("inlet") = {136, 158, 188};
Physical Surface("outlet") = {320, 338, 360};
Physical Surface("sides") = {364, 232, 206, 184, 140, 294, 272, 316};
Physical Surface("front") = {149, 303, 281, 325, 347, 369, 237, 259, 61, 127, 105, 83, 215, 193, 171};
Physical Surface("back") = {7, 6, 5, 12, 11, 13, 14, 15, 9, 8, 2, 1, 3, 4, 10};
Physical Surface("cylinder") = {122, 78, 48, 100};


Physical Volume("internal") = {6, 5, 12, 4, 3, 2, 1, 10, 11, 9, 8, 7, 15, 14, 13};
