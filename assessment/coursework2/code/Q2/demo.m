N=[2197,4913,9261];
tS=[0.036117,0.054768,0.120236];
%plot(log(N), log(tS), '*')
%hold on
figure
xlabel('Log(N)')
ylabel('Log(tS)')
p=polyfit(log(N),log(tS),1);
s=polyval(p,log(N));
plot(log(N),log(tS),'k',log(N),s,'r-.');
%