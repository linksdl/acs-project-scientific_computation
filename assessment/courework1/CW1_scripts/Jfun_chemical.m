function jf = Jfun_chemical(a, V, G, k, a0)

    % The nonlinear equation system F(U)
    %
    % function f = fun_chemical(a, V, G, k, a0)
    %
    % Input: 
    %      a - current solution
    %      V - constants
    %      G - constants
    %      k - constants
    %     a0 - constants
    %
    % Output: 
    %     jf = Jacobian matrix
    %
   jf = [
         (k*V/G)*2*a(1) + 1, 0, 0, 0, 0;
        -1, (k*V/G)*2*a(2) + 1, 0, 0, 0;
        0, -1, (k*V/G)*2*a(3) + 1, 0, 0;
        0, 0, -1, (k*V/G)*2*a(4) + 1, 0;
        0, 0,  0, -1, (k*V/G)*2*a(5) + 1
       ];
   
end