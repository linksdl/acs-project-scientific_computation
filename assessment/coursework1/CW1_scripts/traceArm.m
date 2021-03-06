function t_out = traceArm(traceFn,nSteps, x0)
   
    % Trace path of the free end of arm at at initial x0
    % 
    % function t_out = traceArm(traceFn,nSteps, x0)
    % 
    % Input: 
    %    traceFn - the function  is to create the location (x,y)
    %    nSteps  - the number of steps for t, to split the t
    %    x0      - the init guess value for Newton method
    %
    % Output: 
    %     t_out  - a table to recording the angles theta and phi at
    % each step.
    %
    
    step = 2 / (nSteps -1);
    i = 1;
    
    step_list = [];
    t = [];
    x_list = [];
    y_list = [];
    theta_list = []; 
    phi_list = [];
    for st = -1:step:1
        [locx, locy] = feval(traceFn, st)
        [xx, f] = newtonSys2(@fun_arm, @Jfun_arm, x0, 1e-10, 100,locx,locy);
        t = [t st];
        step_list = [step_list i];
        x_list = [x_list locx];
        y_list = [y_list locy];
        theta_list = [theta_list xx(1,:)];
        phi_list = [phi_list xx(2,:)];
        i = i + 1;
    end
    nSteps = step_list';
    nT = t';
    nLocx  = x_list';
    nLocy  = y_list';
    Theta  = theta_list';
    Phi    = phi_list';
    t_out = table(nSteps,nT, nLocx, nLocy,Theta,Phi);
        
end