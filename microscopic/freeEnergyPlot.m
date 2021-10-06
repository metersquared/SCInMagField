load("freeEnergyNormalMetalN50x25n0.35v1.7b0.0008.mat")


T=linspace(0,0.15,50);

f=figure(1);

plot(T,freeEnergy(1,:),'-b','DisplayName',"$F_\mathrm{n}$, $B=0$");
hold on
load("tOutN50x25n0.35v1.7b0alpha0.7newGapSweep.mat")
load("freeEnergySCN50x25n0.35v1.7b0.0008.mat")
plot(vars.tFactor,freeEnergySC(1,:),'--b','DisplayName',"$F_\mathrm{s}$, $B=0$")

plot(T,freeEnergy(2,:),'-r','DisplayName',"$F_\mathrm{n}$, $B=2\Phi_0$");
xlabel("$T/t$",'Interpreter','latex','FontSize',14)
ylabel("$F/N$",'Interpreter','latex','FontSize',14)




load("tOutN50x25n0.35v1.7b0.0008alpha0.7newGapSweep.mat")
plot(vars.tFactor,freeEnergySC(2,:),'--r','DisplayName',"$F_\mathrm{s}$, $B=2\Phi_0$")
xlim([0 0.15])
legend('Interpreter','latex','FontSize',12)
ax = gca;
ax.FontSize = 14; 
hold off
exportgraphics(f,"freeEnergyComparisonv1.7.pdf",'ContentType','vector')