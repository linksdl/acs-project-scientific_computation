clc
clear all
for k=10:20
    funcMeasGE = @() fisherModel( 0.01, 1, 10*k, 0, @denseGE ); 
    funcMeasTA = @() fisherModel( 0.01, 1, 10*k, 0, @sparseThomas );
    
    % Measure total execution time using dense Gaussian elimination
    % vs. Thomas algorithm
    GEtime(k-9) = timeit(funcMeasGE);
    TAtime(k-9) = timeit(funcMeasTA);
end

m = (10:20) * 10;
On = (3*(m-2)-7);
On3 = ((m-2)).^3;

% Rescale plots
On = On * TAtime(1) / On(1);
On3 = On3 * GEtime(1) / On3(1);

semilogy(m,GEtime,'r',m,TAtime,'b',m,On,'k--',m,On3,'k--','Linewidth',2)
legend('Dense Gaussian elemination','Thomas algorithm','O(n) theoretical','O(n^3) theoretical','Location','NorthWest')