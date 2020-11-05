function f = fun_chemical(a, V, G, k, a0)

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
    %     f = final function value
    %
    f = [(k*V/G)*a(1).^2 - a0 + a(1);
         (k*V/G)*a(2).^2 - a(1) + a(2);
         (k*V/G)*a(3).^2 - a(2) + a(3);
         (k*V/G)*a(4).^2 - a(3) + a(4);
         (k*V/G)*a(5).^2 - a(4) + a(5)
         ];    
end