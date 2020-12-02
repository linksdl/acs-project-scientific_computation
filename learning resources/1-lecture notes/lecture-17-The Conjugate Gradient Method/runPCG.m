function runPCG( m )

% Test the CG algorithm for a model FDM discretisation
% of Poisson's equation with 2d (m+2)x(m+2) grid (n=m^2)
% Outputs residual norm data as text and plot
% Input m is interior grid dimension in each direction

% setup data

A=gallery('poisson',m);

n=m^2;
b=ones(n,1);

tol = 1e-10;
maxit = n;

% run PCG algorithm (no preconditioning)
% 'help pcg' for details

[x,flag,relres,iter,resvec] = pcg( A,b, tol,maxit );

% run Jacobi iterations
[x,resJ] = jacobi(A,b,n,2*iter);

% output

fprintf(' FDM for 2d Poisson''s equation\n');
fprintf(' n = %d\n',n);
fprintf(' iterations = %d of maximum %d \n',iter,maxit);
fprintf(' Final residual = %g against tolerance %g\n',relres,tol);

semilogy(0:iter',resvec,'-or',0:(2*iter-1),resJ,'-ob')
legend('CG','Jacobi');
xlabel('Iteration');
ylabel('Residual norm');

end
