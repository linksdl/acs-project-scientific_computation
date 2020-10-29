function df_h = dfun_sphere(H)

   %
   %
   %
   syms r_a rho_s;
   r_a = 1;
   % rho_s = 0.45;

   df_h = 2*H*pi*r_a - pi*H.^2;

end