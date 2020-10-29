function f_x = fun_arm(x, locx, locy)

   f_x = [cos(x(1)) + cos(x(2)) - locx; sin(x(1)) + sin(x(2)) - locy];
   
end