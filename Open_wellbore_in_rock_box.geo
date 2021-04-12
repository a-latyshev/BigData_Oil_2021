SetFactory("OpenCASCADE");
Geometry.OldNewReg=0;

//Reading from file
input = ListFromFile["../configs/geometry.txt"];
n = #input[];
If (n == 0 || n > 7)
	Printf("GMSH: 'geometry.txt' is empty or somthing was going wrong. Please, be sure, that you have made 'geometry.txt' with 6 parameters: R__L__X__Y__Z__Theta__Phi ");	
	R = 0;// This will make error
Else
	R = input[0]; //radius of wellbore
	L = input[1]; //lengths of wellbore
EndIf

input = ListFromFile["../configs/mesh.txt"];
n = #input[];
If (n == 0)
	Printf("GMSH: 'gmsh.txt' is empty");
	R = 0;// This will make error
Else
	N_circle = input[0]; //number of nodes of circles
EndIf

X = 0;
Y = 0;
Z = 0;

Theta = 0;
Phi = 0;

U = L*Sin(Theta)*Cos(Phi);
V = L*Sin(Theta)*Sin(Phi);
W = L*Cos(Theta);

A = 20 * R;
B = A;

N_hor = Ceil(N_circle / 4) + 1;
N_ver = Ceil(N_hor * L / A);
N_cyl_line = Ceil(N_circle * L / (2*Pi*R));

Box(1) = {X - A/2, Y - B/2, Z, A, B, L}; Delete { Volume{1}; Surface{6,5}; }
Rotate {{0, 1, 0}, {X, Y, Z}, Theta} { Surface{1:4}; }
Rotate {{0, 0, 1}, {X, Y, Z}, Phi} { Surface{1:4};}
Cylinder(1) = {X, Y, Z, U, V, W, R, 2*Pi};
Delete { Volume{1}; Surface{6,7}; }
Curve Loop(18) = {32, -35, -28, 33}; Curve Loop(19) = {39}; Plane Surface(6) = {18, 19}; 
Curve Loop(20) = {30, -36, -26, 34}; Curve Loop(21) = {37}; Plane Surface(7) = {20, 21};
Surface Loop(3) = {7, 3, 6, 2, 4, 1, 5}; Volume(1) = {3};
Delete { Surface{7}; }

Reverse Surface {5:6};

Transfinite Curve {37,39} = N_circle Using Progression 1;
Transfinite Curve {38} = N_cyl_line Using Progression 1;
Transfinite Curve {25,27,29,31} = N_ver Using Progression 1;
Transfinite Curve {26,28,32:36,30} = N_hor Using Progression 1;

Transfinite Surface {1:4};

Physical Surface("INSIDE_SIDE",1) = {5};
/*
Physical Surface("ROCK_BOTTOM",2) = {6};
Physical Surface("ROCK_TOP",3) = {8};
Physical Surface("ROCK_SIDE",4) = {1:4};
*/
Physical Surface("OUTSIDE_SIDE",2) = {1:4,6,8};
Physical Volume("ROCK",5) = {1};


Color RoyalBlue1 {Surface {5};}
Hide { Surface {1:4,8,6};}