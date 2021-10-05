N=30;
x0=[0.009,0.005];

load('tOutN50x25n0.35v0.8b0alpha0.7newGapComplexSweep.mat');
ydata=vars.gapNorm;
xdata=vars.tFactor;
fun=@(x,xdata)gapEquation(xdata,x(1),x(2));
x=lsqcurvefit(fun,x0,xdata,ydata);
T=linspace(0,xdata(length(xdata)));

f=figure(1);
hold on

plot(T,gapEquation(T,x(1),x(2)),'Color','blue','LineStyle','-','DisplayName','Analytical fit');
scatter(xdata,ydata,100,'x','k','DisplayName','Numerical data','LineWidth',1);
xlabel('$T/t$','Interpreter','latex')
ylabel('$|\Delta|/t$','Interpreter','latex')
xlim([0 1.1*x(2)]);
ylim([0 1.1*max(ydata)]);
TcText=['$T_c=' num2str(x(2)) '$'];
DeltaText=['$|\Delta(0)|=' num2str(x(1)) '$'];
RatioText=['$|\Delta(0)|/T_c=' num2str(x(1)/x(2)) '$'];
Annotate(gca, 'textarrow', [0.9*x(2),x(2)], [max(ydata)*0.1,0], 'string', {TcText},'TextEdgeColor','none','FontWeight','bold','interpreter','latex','FontSize',14);
Annotate(gca, 'textarrow', [0.1*1.1*x(2),0.0001], [0.8*x(1),x(1)], 'string', {DeltaText},'TextEdgeColor','none','FontWeight','bold','interpreter','latex','FontSize',14);
Annotate(gca, 'textbox', [0.6*1.1*x(2) 0.98*1.1*x(2)], [0.9*1.1*max(ydata) 0.98*1.1*max(ydata)], 'string', {RatioText},'FontWeight','bold','FontSize',14,'interpreter','latex');
set(gca,'FontSize',14);
legend('Location','southwest','Interpreter','latex')
hold off
exportgraphics(f,"tOutN50x25n0.35v0.8b0alpha0.7newGapComplexSweep.pdf","ContentType",'vector');