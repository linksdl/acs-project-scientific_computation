function f_h = fun_sphere(H, a, rhos)

   % The nonlinear equations Fa,phos (H) = 0
   % the weight of the water: W_w = pi * H.^2 * (a - H/3)
   % the weight of the sphere: W_s = 4/3 * pi * rhos * a.^3
   % 
   % function f_h = fun_sphere(H, a, rhos)
   % 
   % Input: H - a depth below the water surface
   %        a - the radius of sphere, constant value
   %        rhos - the density of sphere, constant value
   %
   % Output: f_h - final function value 
   %
   
   f_h = pi * H.^2 * (a - H/3) - 4/3 * pi * rhos * a.^3;
   
end
