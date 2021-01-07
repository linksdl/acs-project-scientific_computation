clc

% Load example matrix
A = mmread('bcsstk20.mtx');

% Generate some random r.h.s vectors for testing
b = randn(size(A,2),1);

% Compute bandwidths
[bwu,bwl] = bandwidth(A); bw(1) = max(bwu,bwl);

% PCG + iChol (no reordering)
opts = struct('type','ict','droptol',1e-5);
Linc = ichol(A,opts);
M = Linc*Linc'; % Preconditioner

figure(1)
subplot(2,3,1); spy(A); title('Matrix A, unordered')
subplot(2,3,2); spy(M); title('Preconditioner M')
subplot(2,3,3); spy(Linc); title('Incomplete factor L')

% Solve problem 100 times without redordering
tic
for i=1:100
    pcg(A, b, 1e-6, 100, M);
end
tA1u = 10*toc;



% PCG + iChol (AMD reordering)
p = symamd(A); A = A(p, p);
Linc = ichol(A,opts);
M = Linc*Linc'; % Preconditioner

subplot(2,3,4); spy(A); title('Matrix A, unordered')
subplot(2,3,5); spy(M); title('Preconditioner M')
subplot(2,3,6); spy(Linc); title('Incomplete factor L')

% Solve problem 100 times with AMD redordering
tic
for i=1:100
   pcg(A, b, 1e-6, 100, M);
end
tA1o = 10*toc;



% Direct solution (exact Cholesky + AMD reordering)

% Solve problem 100 times with AMD redordering
tic
for i=1:100
   directChol(A,b);
end
tA1d = 10*toc;

clc
fprintf('                             Matrix 1  \n')
fprintf('n                            %1.0f\n', [size(A,1) ])
fprintf('nnz                          %1.0f\n', [nnz(A) ])
fprintf('bandwidth                    %1.0f\n', [bw(1) ])
fprintf('---------------------------------------------------------\n')
fprintf('time Cholesky (AMD ichol)   %1.1f ms\n', [tA1d ])
fprintf('time PCG (unordered ichol)  %1.1f ms\n', [tA1u ])
fprintf('time PCG (AMD ichol)        %1.1f ms\n', [tA1o ])
fprintf('time saved                  %1.0f%%\n', [100*(tA1o-tA1d)/tA1d ])
