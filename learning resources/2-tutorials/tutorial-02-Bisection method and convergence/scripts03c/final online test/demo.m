% BISECTION
% disp('Bisection method:')
% [x,f,xhist] = bisection(@example1,0,2,1e-12,100);
% 
% % Plot the convergence history
% figure(1)
% semilogy(abs(sqrt(2) - xhist),'o-','LineWidth',2)
% xlabel('Iteration i')
% ylabel('Error |x^* - x_i|')

% NEWTON
disp(' ')
disp('Newton method:')
[x,f,xhist] = MyNewton(@fx, @dfx, 2, 1e-14, 100);
% 
% % Convergence order test
error = abs(sqrt(2) - xhist);
alpha = error(2:end) ./ error(1:end-1).^1;
%disp(alpha)
% 
% Plot the convergence history
figure(2)
semilogy(abs(sqrt(2) - xhist),'o-','LineWidth',2)
xlabel('Iteration i')
ylabel('Error |x^* - x_i|')


% SECANT
% disp(' ')
% disp('Secant method:')
% [x,f,xhist] = secant(@example1,1,1e-12,100);
% 
% % Convergence order test
% error = abs(sqrt(2) - xhist);
% alpha = error(2:end) ./ error(1:end-1).^(1.618);
% 
% % Plot the convergence history
% figure(3)
% semilogy(abs(sqrt(2) - xhist),'o-','LineWidth',2)
% xlabel('Iteration i')
% ylabel('Error |x^* - x_i|')