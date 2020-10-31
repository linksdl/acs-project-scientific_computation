function [locx, locy] = traceFn(t)
    % traceFn is the function defining path 
    % of the free end of the arm.
    % trace path defined by the following fucniton 
    % (x,y)=(t, 0.1+sin(2t-0.5)), and (-1<=t<= 1)
    %  
    % function [locx, locy] = traceFn(t)
    % Input: t - param variables,from t=-1 to t=1
    % 
    % Output: locx - the location point x
	%         locy - the location point y
    
    locx = t;
    locy = 0.1 + sin(2*t - 0.5);

end