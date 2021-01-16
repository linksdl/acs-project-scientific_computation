function [x,f,xhist] = MyBisection(fnon,xL,xR,tol,maxk)

% function [x,f] = bisection(fnon,xL,xR,tol)
%
% Use the basic bisection method to find the root of the nonlinear equation
% fnon(x)=0 within the bracket [xL,xR].
%
% ARGUMENTS:  fnon  the nonlinear function
%             xL, xR
%                   the initial bracket [xL,xR], for which f(xL)*f(xR)<0
%             tol   convergence tolerance
%
% RETURNS:    x     the computed root
%             f     the function value at that root


% Find the function values on the initial bracket.
fL = feval(fnon,xL);
fR = feval(fnon,xR);

% Print column headings for output.
fprintf('   k      x_k     F(x_k)\n');

% Repeat the bisection iteration until the bracket width is less than tol.
k=0;
x=(xL+xR)/2;
f=feval(fnon,x);
fprintf(' %3d %8.4g   %8.3g\n',k,x,f);
xhist=zeros(maxk,1);


while (abs(xR-xL) > tol && k < maxk)
      
    % Find the midpoint of the bracket and evaluate the function there.
    xC = (xL+xR)/2;
    fC = feval(fnon,xC);
    
    % Choose the new bracket to contain the root.
    if fL*fC <= 0
        % The root is to the left of C, so set R=C.
        xR = xC;
        fR = fC;
    else
        % The root is to the right of C, so set L=C.
        xL = xC;
        fL = fC;
    end
    k=k+1;
    x=(xL+xR)/2;
    f=feval(fnon,x);
    xhist(k,:)=x;
    fprintf(' %3d %8.4g   %8.3g\n',k,x,f);
end

% Set final estimate to be the midpoint value.
x = (xL+xR)/2;
f = (fL+fR)/2;
