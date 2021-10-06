load("tOutN50x25n0.35v1.7b0.0008alpha0.7newGap.mat");
f=figure(3);
order=reshape(vars.gapArray(1,:),50,25)';
phaseAng=angle(order);
surface(phaseAng,'EdgeAlpha',0);
c=colorbar;
xlim([1 50])
ylim([1 25])
pbaspect([2 1 1])
xlabel('x','Interpreter','latex','FontSize',12)
ylabel('y','Interpreter','latex','FontSize',12)
title('$arg(\Delta)$','Interpreter','latex')
colormap('hsv');
caxis([-pi pi])
c.Ticks=[-pi -pi/2 0 pi/2 pi];
c.TickLabels={'$-\pi$' '$-\frac{\pi}{2}$' '0' '$\frac{\pi}{2}$' '$\pi$'};
c.TickLabelInterpreter='latex';
c.FontSize=10;
exportgraphics(f,"tOutN50x25n0.35v1.7b0.0008alpha0.7newGapPhaseAngle.png","Resolution",300);