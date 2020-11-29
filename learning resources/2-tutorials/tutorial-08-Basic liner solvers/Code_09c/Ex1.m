clc

% Load three example matrices
A1 = mmread('bcsstk20.mtx');
A2 = mmread('steam1.mtx');
A3 = mmread('e05r0100.mtx');

% Visualise the sparsity patterns of these matrices
figure(1)
subplot(1,3,1); spy(A1); title('Example matrix 1')
subplot(1,3,2); spy(A2); title('Example matrix 2')
subplot(1,3,3); spy(A3); title('Example matrix 3')

% Generate some random r.h.s vectors for testing
b1 = randn(size(A1,2),1);
b2 = randn(size(A2,2),1);
b3 = randn(size(A3,2),1);

% Compute bandwidths
[bwu,bwl] = bandwidth(A1); bw(1) = max(bwu,bwl);
[bwu,bwl] = bandwidth(A2); bw(2) = max(bwu,bwl);
[bwu,bwl] = bandwidth(A3); bw(3) = max(bwu,bwl);

% EXPERIMENT WITH EXAMPLE MATRIX 1

% Compute LU factorisation without reordering 
[L1,U1,P1] = lu(A1);

figure(2)
subplot(2,3,1); spy(A1); title('Matrix A, unordered')
subplot(2,3,2); spy(L1); title('Factor L')
subplot(2,3,3); spy(U1); title('Factor U')

% Solve problem 100 times without redordering
tic
for i=1:100
    directLU(A1,b1);
end
tA1u = 10*toc;

% Compute LU factorisation with AMD reordering 
p1 = symamd(A1); A1 = A1(p1, p1);
[L1,U1,P1] = lu(A1);

subplot(2,3,4); spy(A1); title('Matrix A, reordered with AMD')
subplot(2,3,5); spy(L1); title('Factor L')
subplot(2,3,6); spy(U1); title('Factor U')

% Solve problem 100 times with AMD redordering
tic
for i=1:100
   directLU(A1,b1);
end
tA1o = 10*toc;


% EXPERIMENT WITH EXAMPLE MATRIX 2

% Compute LU factorisation without reordering 
[L2,U2,P2] = lu(A2);

figure(3)
subplot(2,3,1); spy(A2); title('Matrix A, unordered')
subplot(2,3,2); spy(L2); title('Factor L')
subplot(2,3,3); spy(U2); title('Factor U')

% Solve problem 100 times without redordering
tic
for i=1:100
    directLU(A2,b2);
end
tA2u = 10*toc;

% Compute LU factorisation with AMD reordering 
p2 = symamd(A2); A2 = A2(p2, p2);
[L2,U2,P2] = lu(A2);

subplot(2,3,4); spy(A2); title('Matrix A, reordered with AMD')
subplot(2,3,5); spy(L2); title('Factor L')
subplot(2,3,6); spy(U2); title('Factor U')

% Solve problem 100 times with AMD redordering
tic
for i=1:100
    directLU(A2,b2);
end
tA2o = 10*toc;



% EXPERIMENT WITH EXAMPLE MATRIX 3

% Compute LU factorisation without reordering 
[L3,U3,P3] = lu(A3);

figure(4)
subplot(2,3,1); spy(A3); title('Matrix A, unordered')
subplot(2,3,2); spy(L3); title('Factor L')
subplot(2,3,3); spy(U3); title('Factor U')

% Solve problem 100 times without redordering
tic
for i=1:100
    directLU(A3,b3);
end
tA3u = 10*toc;

% Compute LU factorisation with AMD reordering 
p3 = symamd(A3); A3 = A3(p3, p3);
[L3,U3,P3] = lu(A3);

subplot(2,3,4); spy(A3); title('Matrix A, reordered with AMD')
subplot(2,3,5); spy(L3); title('Factor L')
subplot(2,3,6); spy(U3); title('Factor U')

% Solve problem 100 times with AMD redordering
tic
for i=1:100
    directLU(A3,b3);
end
tA3o = 10*toc;

clc
fprintf('                             Matrix 1  Matrix 2  Matrix 3\n')
fprintf('n                            %1.0f       %1.0f       %1.0f\n', [size(A1,1) size(A2,1) size(A3,1)])
fprintf('nnz                          %1.0f      %1.0f      %1.0f\n', [nnz(A1) nnz(A2) nnz(A3)])
fprintf('bandwidth                    %1.0f        %1.0f       %1.0f\n', [bw(1) bw(2) bw(3)])
fprintf('---------------------------------------------------------\n')
fprintf('time direct sol (unordered)  %1.1f ms    %1.1f ms    %1.1f ms\n', [tA1u tA2u tA3u])
fprintf('time direct sol (AMD)        %1.1f ms    %1.1f ms    %1.1f ms\n', [tA1o tA2o tA3o])
fprintf('time saved                  %1.0f%%       %1.0f%%       %1.0f%%\n', [100*(tA1o-tA1u)/tA1u 100*(tA2o-tA2u)/tA2u 100*(tA3o-tA3u)/tA3u])
