clc

% PLOT ISOCONTOURS OF THE FUNCTION |F(X)|^2 = c
hold off
plotContours(@exampleFun1);
hold on
x0 = [5;-3];

% NEWTON WITH TRUE JACOBIAN
[x,f] = newtonSys(@exampleFun1, @trueJacobian, x0, 1e-15, 100);

% NEWTON WITH NUMERICAL JACOBIAN
%[x,f] = newtonSys(@exampleFun1, @fdJacobian, x0, 1e-15, 100);

% MATLAB BUILT-IN FSOLVE FUNCTION
%[x,f,flag,output] = fsolve(@exampleFun1, x0, optimoptions('fsolve','Display','iter'));
