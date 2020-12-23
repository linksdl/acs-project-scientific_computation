function [x, f]  = demo_newton(fnon, dfdx, x0, tol, maxk)


x = x0;
k = 0;
f = feval(fnon, x);

fprintf('   k      x_k   F(x_k)\n');

fprintf(' %3d %8.4g %8.3g\n',k,x,f);

while (norm(f) > tol && k < maxk)
    df = feval(dfdx, x);
    
    x = x - f/df;
    
    f = feval(fnon, x);
   
    k = k +1;
    
    fprintf(' %3d %8.4g %8.3g\n',k,x,f);
end

if (k == maxk)
    
    fprintf('Not converged\n');
    
else
    
    fprintf('Converged\n')
    
end


end




