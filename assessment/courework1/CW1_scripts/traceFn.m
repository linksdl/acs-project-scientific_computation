function [locx, locy] = traceFn(t)

    locx = t;
    locy = 0.1 + sin(2*t - 0.5);

end