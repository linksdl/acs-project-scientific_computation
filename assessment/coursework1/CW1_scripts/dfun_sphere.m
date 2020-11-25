function df_h = dfun_sphere(H, a, rhos)

   % The derivation funciton of nonlinear equations Fa,phos (H)
   % 
   % function df_h = dfun_sphere(H, a, rhos)
   % 
   % Input: H - a depth below the water surface
   %        a - the radius of sphere, constant value
   %        rhos - the density of sphere, constant value
   %
   % Output: df_h - derivation function value 
   %
   
   df_h = 2*pi*a*H - pi * H.^2;

end