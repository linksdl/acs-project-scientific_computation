function x = sparseThomas( A, b )

% function x = sparseThomas( A, b )
%  Linear solution algorithm for the
%  tridiagonal system Ax=b
% Input: tridiagonal sparse matrix A
%        n-dim column vector b
% Output: n-dim column vector x

n = length(b);

count = 0;
for j = 2:n
   c = A(j,j-1)/A(j-1,j-1);
   count = count + 1;
   A(j,j) = A(j,j) - A(j-1,j)*c;
   count = count + 1;
   b(j) = b(j) - b(j-1)*c;
   count = count + 1;
end

x = b;
x(n) = x(n)/A(n,n);
count = count + 1;
for j = n-1:-1:1
   x(j) = ( x(j) - A(j,j+1)*x(j+1) )/A(j,j);
   count = count + 1;
end

fprintf("%d", count);
end

