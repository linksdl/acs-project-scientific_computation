T = 10; % final time until which we compute
k = 5.0;
m = 0.5;
x0 = 1.0;
v0 = 0.1;
alpha = sqrt(k/m);
N = [100, 80, 70, 60, 50, 30, 10];
% define the exact solution as a function handle
B = x0;
A = v0/alpha;

% xexact = A*sin(alpha*taxis) + B*cos(alpha*taxis);

% allocate vectors to store errors for every run
err_semi = zeros(1,length(N));
dts = zeros(1,length(N));
for n=1:length(N)
 taxis = linspace(0, T, N(n)+1); % add +1 to account for t=0
 u_semi(2,n+1)=u_semi(2,n)-dt*k/m*u_semi(1,n);
    u_semi(1,n+1)=u_semi(1,n)+dt*u_semi(2,n+1);
    dts(n) = taxis(2)-taxis(1);
    err_semi(1,n+1) = max(abs(u_semi - xexact(taxis)));
end
p_semi = polyfit(log(dts), log(err_semi), 1);
 
figure(1);
loglog(dts, err_semi, 'ro', 'markerfacecolor', 'r'); hold on;
% Because we fitted log(err), we need to apply exp to obtain err.
loglog(dts, semi(polyval(p_exp, log(dts))), 'r-');
txt = strcat('Slope p=', num2str(p_semi(1),'%3.2f'));
text(1e-2, 1e-3, txt); % this needs retuning if values in N are changed
xlim([dts(1) dts(end)])
xlabel('\Delta t');
ylabel('Error');
grid on;
legend('Semi Euler', 'Linear fit', 'location', 'NorthWest');

