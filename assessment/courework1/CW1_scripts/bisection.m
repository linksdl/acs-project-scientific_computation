function [x,f] = bisection( fnon, xL, xR, tol, maxit )
global a rho
a = 1.0;
rho = 0.45;
fL = feval(fnon,xL, a, rho);
fR = feval(fnon,xR, a, rho);

if(fL * fR >= 0)
    error('Sign change within interval not guaranteed!')
end

k=0;
fprintf('   i   x_i          |F(x_i)|\n')
while ((xR - xL) > tol && k < maxit)    
    xC = (xL + xR) / 2;
    fC = feval(fnon,xC, a, rho);
    fprintf(' %3d   %1.8f   %1.2e\n',k,xC,abs(fC));
    
    if (abs(fC) < tol)
        k=k+1;
        break;
    elseif (fL * fC < 0)
        xR = xC;
    else 
        xL = xC;
    end
    k=k+1;
    x(k) = xC;
    f(k) = feval(fnon,xC, a, rho);
end
xC = (xL + xR) / 2;
x(k) = xC;
f(k) = feval(fnon,xC, a, rho);

fprintf(' %3d   %1.8f   %1.2e\n',k,xC,abs(fC));