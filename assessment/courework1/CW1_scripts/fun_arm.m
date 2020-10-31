function f = fun_arm(x, locx, locy)
    % Systems of nonlinear equations for control of a robot arm 
    % system of 2 nonlinear equations
    % function f_x = fun_arm(x, locx, locy)
    % 
    % Input: x - current solution
    %        locx - current location x
    %        locy - current location y
    %
    % Output: f - final function value
          
    f = [cos(x(1)) + cos(x(2)) - locx; 
         sin(x(1)) + sin(x(2)) - locy];        
   
end