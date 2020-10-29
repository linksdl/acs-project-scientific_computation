clc

% PLOT ISOCONTOURS OF THE FUNCTION |F(X)|^2 = c
hold off
plotContours(@exampleFun2);
hold on
x0 = [-4.6;3.6];

% NEWTON WITH TRUE JACOBIAN
%[x,f] = newtonSys(@exampleFun2, @trueJacobian2, x0, 1e-15, 100);

% NEWTON WITH NUMERICAL JACOBIAN
[x,f] = newtonSys(@exampleFun2, @fdJacobian, x0, 1e-15, 100);

% MATLAB BUILT-IN FSOLVE FUNCTION
%[x,f,flag,output] = fsolve(@exampleFun2, x0, optimoptions('fsolve','Display','iter'));
