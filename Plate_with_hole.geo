SetFactory("OpenCASCADE");

R = 8;
L = 10*R;

Rectangle(1) = {-L/2, -L/2, 0, L, L, 0};

Circle(5) = {0, 0, 0, R, 0, 2*Pi};
Curve Loop(2) = {4, 1, 2, 3};
Curve Loop(3) = {5};
Plane Surface(2) = {2, 3};

Recursive Delete {
  Surface{1}; 
}

Physical Curve(1) = {5};
Physical Curve(2) = {4, 3, 2, 1};

Physical Surface(1) = {2};

Mesh.MeshSizeMin = 5;
Mesh.MeshSizeMax = 5;