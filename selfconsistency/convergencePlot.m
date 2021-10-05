load("trackOutN50x25n0.35v1.95b0.0008alpha0.7Pure.mat");
f=figure(2);
semilogy(vars.gapHist(1,:),'k');
ylim([1e-17 max(vars.gapHist)])
xlim([0 3000])
yticks([10^-16 10^-12 10^-8 10^-4])
xlabel("Iterations",'Interpreter','latex','FontSize',14)
ylabel("$\frac{||\mathbf{\Delta}-\mathbf{\Delta}'||_1}{||\mathbf{\Delta}||_1}$",'Interpreter','latex','FontSize',18)
grid on
exportgraphics(f,"convergenceN50x25n0.35v1.95b0.0008alpha0.7Pure.pdf",'ContentType','vector');