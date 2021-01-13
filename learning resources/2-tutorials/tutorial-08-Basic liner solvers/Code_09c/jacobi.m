function x = jacobi(A, b, x0, tol, maxIter)

r = b - A*x0;
k=1;

% Split the matrix A = D + E to the diagonal and the rest
D = diag(diag(A));
E = A - D;

Bfun = @(X)(-D\(E*X));
N = size(A,1);

% Estimates the largest eigenvalue of iteration matrix B
spec_radius = eigs(Bfun,N,1);

fprintf('Norm of iteration matrix ||B|| = %1.3f\n', abs(spec_radius))

if (abs(spec_radius) > 1)
    error('Spectral norm of iteration matrix ||B|| > 1.')
end

z = D \ b;
fprintf('Iter  RelResidual\n')
fprintf('------------------\n')

while (norm(r)/norm(x0) > tol && k < maxIter)
    x = Bfun(x0) + z;
    x0 = x;
    r = b - A*x0;
    fprintf('%3.0f   %1.3e\n',[k norm(r)/norm(x)])
    k=k+1;
end