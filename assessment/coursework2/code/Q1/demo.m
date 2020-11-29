N=[81,161,321,641];
tS=[0.001745,0.003393,0.005718,0.010418];
%plot(log(N), log(tS), '*')
%hold on
figure
xlabel('Log(N)')
ylabel('Log(tS)')
p=polyfit(log(N),log(tS),1);
s=polyval(p,log(N));
plot(log(N),log(tS),'k',log(N),s,'r-.');
%