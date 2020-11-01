figure
h = 1e-6:0.001:3-1e-6;
y = pi.*h.^2.*(1- h/3) - 4/3 .* pi .* 0.45 .* 1;
plot(h,y)

hold on
y1 = h-h;
plot(h,y1)
hold off

xlabel('H')
ylabel('pi.*h.^2.*(1- h/3) - 4/3 .* pi .* 0.45 .* 1')
title('Plot of the F(H) Function')