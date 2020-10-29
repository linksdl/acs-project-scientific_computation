function f_h = fun_sphere(H)

   % W_w = pi * H.^2 * (a - H/3);
   % W_s = 4/3 * pi * rho_s * a.^3
   %
   
   syms r_a rho_s;
   r_a = 1;
   rho_s = 0.45;
   f_h = pi * H.^2 * (r_a - H/3) - 4/3 * pi * rho_s * r_a.^3;
   
end
