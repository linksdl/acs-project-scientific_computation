function [x,f] = bisection( fnon, xL, xR, tol, maxit )
global a rho

fL = feval(fnon,xL);
fR = feval(fnon,xR);

if(fL * fR >= 0)
    error('Sign change within interval not guaranteed!')
end

k=0;
fprintf('   i   x_i          |F(x_i)|\n')
while ((xR - xL) > tol && k < maxit)    
    xC = (xL + xR) / 2;
    fC = feval(fnon,xC);
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
    f(k) = feval(fnon,xC);
end
xC = (xL + xR) / 2;
x(k) = xC;
f(k) = feval(fnon,xC);

fprintf(' %3d   %1.8f   %1.2e\n',k,xC,abs(fC));