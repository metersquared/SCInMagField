load('freeEnergy.mat')
figure(4)
N=10.^[1:length(freeEnergy.hex)];
scatter(N,freeEnergy.hex,'k','^');
hold on
scatter(N,freeEnergy.square,'k','s');
grid on
legends=["Hexagonal lattice"
    "Square lattice"];
legend(legends,'Interpreter','latex','Location','northwest','Fontsize',14)
set(gca, 'XScale', 'log')
ax=gca;
ax.FontSize=14;
xlim([10^0.9 10^4.2]);
xlabel('$N$','Interpreter','latex','FontSize',16)
ylabel('$\frac{F-F_{s0}}{L}$','Interpreter','latex','FontSize',20)
f=gcf;
exportgraphics(f,"freeEnergyPlot.pdf","ContentType",'vector');