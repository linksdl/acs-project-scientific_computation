function [x,f,xhist] = secant(fnon,x0,tol,maxk)

% function [x,f] = secant(fnon,x0,tol,maxk)
%
% Use the secant method to find the root of the nonlinear equation
% fnon(x)=0, starting from the estimate x0.
%
% ARGUMENTS:  fnon  the nonlinear function
%             x0    the initial estimate
%             tol   convergence tolerance
%             maxk  maximum numer of iterations
%
% RETURNS:    x     the computed root
%             f     the function value at that root


% Print column headings for output.
fprintf('      x            f(x)\n')

% Evaluate the function at the initial estimate for the root.
f0 = feval(fnon,x0);

% Calculate the derivative approximation for the first iteration using
% a backward difference with optimal step length.
h  = 10*sqrt(eps);
x1 = x0 + h;
f1 = feval(fnon,x1);

k=0;
  
% Print the estimate and function value.
fprintf('   k      x_k   F(x_k)\n');
fprintf(' %3d %8.4g %8.3g\n',k,x1,f1);

% Repeat the secant iteration until the magnitude of the function value is
% less than tol.

xhist=zeros(maxk,1);

while (abs(f1) > tol && k < maxk)
  step=1;
  % Apply one iteration of the secant method and evaluate the function at the
  % new estimate (df1 approximates the derivative of fnon at x1).
  df1  = (f1-f0)/(x1-x0);
  delta = f1/df1;
  
  fnew = abs(f1)+eps;
  while( abs(fnew) > abs(f1) )
      
      xnew = x1 - step*delta;
      fnew = feval(fnon,xnew);
      step = step/2;
  end

  
  % Reuse the estimates and function values for efficiency.
  x0 = x1;
  f0 = f1;
  x1 = xnew;
  f1 = fnew;

  % Print the new estimate and function value. 
  k=k+1;
  xhist(k,:)=x1;
  fprintf(' %3d %8.4g %8.3g\n',k,x1,f1);
end

% Set the final estimate and function value there.
  x = x1;
  f = f1;
