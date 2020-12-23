function [ x,y,z, u ] = runFDM( mIn )
% Solve our nonlinear 3D FDM model 
%   function [ x,y, u ] = runFDM( mIn )
% Input: mIn - grid size in each coordinate direction
% Output: x,y,z,u - 3d grid (x,y) and solution data

global m N h x y z
global A loc nf

close('all');

m = mIn;
[x,y,z] = meshgrid( linspace(-10,10,m ) ); % 3d mesh for entire domain
h = 20/(m-1);
N = (m-2)^3; % unknown d.o.f

fprintf('\n Grid size %d x %d x %d\n',m,m,m);
fprintf(' Nonlinear system size %d\n\n', N );

[ A, nz ] = sparsePattern3DFD( m ); % 3d FDM sparsity pattern
[ loc, nf ] = sparseJac( A,N );     % sparse function calls for J evaluation

u0 = zeros( N,1 ); % initial guess for interior solution

tic; % start a timer

% call Newton solver: 
%  u0 - initial guess
%  @fdm3D - the function defining the nonlinear equations
%  @fdJacobian - a function that computes the Jacobian matrix
%  @linearSolve - a function that solves the linear system J.d=-f

%[ u,f,iter ] = newtonAlgorithm( @fdm3D, u0, 1e-8, @fdJacobian, @linearSolve, 40 );
[ u,f,iter ] = newtonAlgorithm( @fdm3D, u0, 1e-8, @buildJacobian, @linearSolve, 40 );
%[ u,f,iter ] = newtonAlgorithm( @fdm3D, u0, 1e-8, @fdJacobian, @matlabLinearSolve, 40 );

%[ u,f,iter ] = newtonAlgorithm( @fdm3D, u0, 1e-8, @fdJacobian, @linearSolve, 40 );
%[ u,f,iter ] = newtonAlgorithm( @fdm3D, u0, 1e-8, @tridiagonalJacobian, @sparseThomas, 40 );

Trun = toc; % overall time taken

fprintf(' Time taken %f seconds\n', Trun );

% visualise
v = zeros([m,m,m]);
v(2:m-1,2:m-1,2:m-1) = reshape(u,[m-2 m-2 m-2]);
slice(x,y,z,v, [-3 3],1,-4);
colorbar;


spy(A)
%[L,U,P] = lu(A)

%figure(2)
%subplot(1,3,1); spy(A); title('Matrix A, unordered')
%subplot(1,3,2); spy(L); title('Factor L')
%subplot(1,3,3); spy(U); title('Factor U')



end
