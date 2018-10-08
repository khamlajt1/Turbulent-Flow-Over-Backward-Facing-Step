D = 0.1;
x=2;
density_inlet_h = 101*x;
density_inlet_v = 91*x;
density_outlet_h = 151*x;
density_outlet_v = 41*x;

Point(1) = {   0,   0, 0};
Point(2) = {-10*D,   0, 0};
Point(3) = {-10*D, 5*D, 0};
Point(4) = {   0, 5*D, 0};
Point(5) = {30*D, 5*D, 0};
Point(6) = {30*D,   0, 0};
Point(7) = {   0,  -D, 0};
Point(8) = {30*D,  -D, 0};

Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};
Line(5) = {4, 5};
Line(6) = {5, 6};
Line(7) = {6, 1};
Line(8) = {1, 7};
Line(9) = {7, 8};
Line(10) = {8, 6};
Line Loop(11) = {1, 2, 3, 4};
Plane Surface(12) = {11};
Line Loop(13) = {5, 6, 7, -3};
Plane Surface(14) = {13};
Line Loop(15) = {9, 10, 7, 8};
Plane Surface(16) = {15};
Extrude {0, 0, 1} {
  Surface{12, 14, 16};
  Layers{1};
  Recombine;
}

Transfinite Line {-2, 4, -19, 21} = density_inlet_h Using Progression 1.02;
Transfinite Line {1, 3, 18, 20, -6, 41} = density_inlet_v Using Bump 0.038;
Transfinite Line {5, -7, 40, -42, 9, 62} = density_outlet_h Using Progression 1.018;
Transfinite Line {8, 65, 10, 63} = density_outlet_v Using Bump 0.038;
Transfinite Surface "*";
Recombine Surface "*";

// Ruller to measure y+ for the given Reynolds number

// Medium Mesh
Point(91) = {0, 0.0002529, 1.0};

Physical Surface("inlet") = {25};
Physical Surface("outlet") = {51, 73};
Physical Surface("bottom") = {37, 81, 69};
Physical Surface("top") = {29, 47};
Physical Surface("back") = {38, 60, 82};
Physical Surface("front") = {12, 14, 16};
Physical Volume("internal") = {2, 1, 3};
