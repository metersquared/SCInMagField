load("trackOutN50x25n0.35v1.95b0.0008t1e-06Pure.mat");
order=reshape(vars.gapArray(19,:),50,25)';
observable=abs(order);
phaseAng=angle(order);
f=figure(2);
subplot(3,2,[1,2])
semilogy(vars.gapHist(1,:),'k');
ylim([1e-17 max(vars.gapHist)])
xlim([0 5000])
yticks([10^-16 10^-12 10^-8 10^-4])
xlabel("Iterations",'Interpreter','latex','FontSize',12)
ylabel("$\frac{||\Delta-\Delta'||_1}{||\Delta||_1}$",'Interpreter','latex','FontSize',12)
title('$N_x\times N_y=40\times 34, V=-1.95, \alpha=0.7, n_\mathrm{target}=0.35$','Interpreter','latex')
grid on
pbaspect([2 1 1])
subplot(3,2,[3,4])
surface(observable,'EdgeAlpha',0);
colorbar
%caxis([0.15 max(observable,[],'all')])
xlim([1 50])
ylim([1 25])
pbaspect([2 1 1])
xlabel('x','Interpreter','latex','FontSize',12)
ylabel('y','Interpreter','latex','FontSize',12)
title('$|\Delta|$','Interpreter','latex')
ax=subplot(3,2,[5,6]);
surface(phaseAng,'EdgeAlpha',0);
c=colorbar;
xlim([1 50])
ylim([1 25])
pbaspect([2 1 1])
xlabel('x','Interpreter','latex','FontSize',12)
ylabel('y','Interpreter','latex','FontSize',12)
title('$arg(\Delta)$','Interpreter','latex')
colormap(ax(1),'hsv');
caxis([-pi pi])
c.Ticks=[-pi -pi/2 0 pi/2 pi];
c.TickLabels={'$-\pi$' '$-\frac{\pi}{2}$' '0' '$\frac{\pi}{2}$' '$\pi$'};
c.TickLabelInterpreter='latex';
c.FontSize=10;
set(gcf, 'Position',  [100, 100, 500, 600])
exportgraphics(f,"trackOutN50x25n0.35v1.95b0.0008t1e-06Pure.pdf",'ContentType','vector');