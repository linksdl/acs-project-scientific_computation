clc

% % PLOT ISOCONTOURS OF THE FUNCTION |F(X)|^2 = c
hold off
plotContours(@exampleFun2);
hold on
x0 = [3;-3.1];    % Newton doesn't converge, everything else does
%x0 = [-0.2;1.2]; % Newton with line search doesn't converge, everything else does

% NEWTON 
%[x,f] = newtonSys(@exampleFun2, @fdJacobian, x0, 1e-6, 100);

% NEWTON WITH LINE SEARCH
%[x,f] = newtonSysL(@exampleFun2, @fdJacobian, x0, 1e-6, 100);

% GRADIENT DESCENT + NEWTON
%[x,f] = gradientDescent(@exampleFun2, @fdJacobian, x0, 1e-1, 10);
%[x,f] = newtonSys(@exampleFun2, @fdJacobian, x, 1e-6, 100);

% HOMOTOPY CONTINUATION + NEWTON
%[x,f] = continuation( @exampleFun2, @fdJacobian, x0, 10); 
%[x,f] = newtonSys(@exampleFun2, @fdJacobian, x, 1e-6, 100);

