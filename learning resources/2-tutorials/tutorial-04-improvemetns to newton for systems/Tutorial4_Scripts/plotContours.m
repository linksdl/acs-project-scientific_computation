function plotContours(fn)
[xgrid,ygrid] = meshgrid(-3:0.1:5,-3:0.1:5);
nx = size(xgrid,1);
ny = size(xgrid,2);
fgrid = feval(fn, [xgrid(:)'; ygrid(:)']);

V = [1 5 10 50 100];

figure(1)
[c,h] = contour(xgrid, ygrid, reshape(fgrid(1,:).^2+fgrid(2,:).^2,nx,ny), V);
clabel(c,h)
title('Contour map of |F(x)|^2')
xlabel('x')
ylabel('y')