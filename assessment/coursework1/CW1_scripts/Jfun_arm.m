function jf = Jfun_arm(x)
  % Analytical Jacobian
  % function jf =  trueJacobian(x)
  %
  % Input: 
  %        x - current solution
  %        
  %        
  % Output: jf - Jacobian matrix

  jf = [-sin(x(1)), -sin(x(2)); cos(x(1)), cos(x(2))];
  
end