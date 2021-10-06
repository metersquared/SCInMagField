load("trackOutN50x25n0.35v1.95b0.0008alpha0.7Impure2.mat");
order=reshape(vars.gapArray(18,:),50,25)';
observable=abs(order);
f=figure(4);
surface(observable,'EdgeAlpha',0.5);
colorbar
caxis([0.16 max(observable,[],'all')])
xlim([1 50])
ylim([1 25])
pbaspect([2 1 1])
xlabel('x','Interpreter','latex','FontSize',12)
ylabel('y','Interpreter','latex','FontSize',12)
title('$|\Delta|/t$','Interpreter','latex')
exportgraphics(f,"FluxPintrackOutN50x25n0.35v1.95b0.0008alpha0.7Impure2.pdf",'ContentType','vector');