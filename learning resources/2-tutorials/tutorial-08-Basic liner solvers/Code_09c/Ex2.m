clc

% Generate random test matrix
A = randn(5,5); A = A'*A; A = round(A + eye(5)*4);

A
 
% Generate some random r.h.s vectors for testing
b = randn(size(A,2),1);

% Use zero vector as initial guess
x0 = 0*b;

disp('GAUSS-SEIDEL ITERATION')
x1gs = gaussseidel(A, b, x0, 1e-3, 200);

disp('JACOBI ITERATION')
x1gs = jacobi(A, b, x0, 1e-3, 200);
