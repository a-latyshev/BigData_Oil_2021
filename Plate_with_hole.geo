SetFactory("OpenCASCADE");

R = 8;
L = 10*R;

Rectangle(1) = {-L/2, -L/2, 0, L, L, 0};

Circle(5) = {0, 0, 0, R, 0, 2*Pi};

Curve Loop(2) = {4, 1, 2, 3};
Curve Loop(3) = {5};
Plane Surface(2) = {2, 3};

Physical Curve(1) = {5};
Physical Curve(2) = {4, 3, 2, 1};

Physical Surface(1) = {2};

Delete {
  Surface{1}; 
}

// Mesh.MeshSizeMin = 5;
// Mesh.MeshSizeMax = 5;
// Line(6) = {1, 3};
// Line(7) = {4, 2};
// BooleanDifference{ Curve{7}; Curve{6}; Delete; }{ Curve{5}; Delete; }
// Recursive Delete {
//   Curve{7}; Curve{12}; Curve{11}; Curve{8}; 
// }
// BooleanDifference{ Curve{5}; Delete; }{ Curve{13}; Curve{6}; Curve{10}; Curve{9}; }
// Curve Loop(4) = {10, -16, -6, 4};
// Plane Surface(2) = {4};

// Transfinite Line {6, 10} = 32 Using Progression 1;
// Transfinite Line {16} = 10 Using Progression 1;
// Transfinite Line {4} = 27 Using Progression 1;
// Transfinite Line {4,6,10,16} = 10 Using Progression 1;
// Transfinite Line {16} = 9 Using Progression 1;

// Transfinite Surface {2};



// Transfinite Line {1:5} = 20 Using Progression 1;
// Transfinite Surface {2};
// Point(6) = {0, L/2, 0, 1.0};
// Point(7) = {0, -L/2, 0, 1.0};

// Point(8) = {L/2, 0, 0, 1.0};
// Point(9) = {-L/2, 0, 0, 1.0};
// Line(6) = {6, 7};
// BooleanDifference{ Curve{6}; Delete; }{ Curve{5}; Delete; }
// BooleanDifference{ Curve{5}; Delete; }{ Curve{7}; Delete; }
// Curve Loop(2) = {4, 1, 2, 3};


// BooleanDifference{ Curve{3}; Delete; }{ Curve{6}; }
// BooleanDifference{ Curve{1}; Delete; }{ Curve{8}; }



// Line(16) = {9, 8};
// BooleanDifference{ Curve{16}; Delete; }{ Curve{10}; Curve{9}; }
// Recursive Delete {
//   Curve{18}; 
// }
// BooleanDifference{ Curve{4}; Delete; }{ Curve{17}; }
// BooleanDifference{ Curve{2}; Delete; }{ Curve{16}; }
// BooleanDifference{ Curve{10}; Delete; }{ Curve{17}; }
// Curve Loop(3) = {17, -22, -6, 13, 18};
// Plane Surface(1) = {3};
// Transfinite Line {13,17,22,6,18} = 10 Using Progression 1;
// Transfinite Surface {1}