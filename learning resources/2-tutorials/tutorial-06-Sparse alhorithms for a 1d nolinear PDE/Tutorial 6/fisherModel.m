%%
% driver for the time stepping

function [ u,t ] = fisherModel( dtIn, nTimeSteps, mIn, plotSol, linearSolve )

% Implicit Euler in time, finite difference in space
% numerical model for the Fisher Equation
%  function [ u,t ] = fisherModel( dt,nt, n )
% Input: time step size dtIn
%        number of time steps nTimeSteps
%        grid dimension mIn
%        do we plot the solution after every iteration plotSol
% Output: final solution profile u(m)
%         final time t

global uOld dt n uL uR

dt = dtIn; % time step size
m = mIn; % dimension of spatial mesh for [X1,X2]
n = m-2; % number of nonlinear equations (excluding BC)

[t,u0,x] = initialData( m ); % initial and boundary conditions

u = u0;
ux0 = [ uL; u; uR ];
 

% time stepping

for k = 1:nTimeSteps
    t = t + dt;
    
    uOld = u;
    u = newtonAlgorithm( @fisherFDM, uOld, 1e-10, @fdJacobian, linearSolve, 40 ); 
     
    %fprintf(' Completed step %d, time is %f\n',k,t);
    
    % Plot intermediate solution
    ux = [ uL; u; uR ];
    
    if (plotSol)
        plot( x,ux0,'or', x,ux,'-b' );
        legend('Initial conditions','Final computed solution');
        xlabel('X'); ylabel('U'); axis([0 1 -0.1 1.1]);
        pause(0.1);
    end
end 
%fprintf('\n Total time taken %f seconds\n', Trun );

ux = [ uL; u; uR ];

if (plotSol)
    plot( x,ux0,'or', x,ux,'-b' );
    legend('Initial conditions','Final computed solution');
    xlabel('X'); ylabel('U'); axis([0 1 -0.1 1.1]);
end
end

