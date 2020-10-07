% BISECTION
disp('Bisection method:')
[x,f,xhist] = bisection(@example1,0,2,1e-12,100);

% Plot the convergence history
figure(1)
semilogy(abs(sqrt(2) - xhist),'o-','LineWidth',2)
xlabel('Iteration i')
ylabel('Error |x^* - x_i|')