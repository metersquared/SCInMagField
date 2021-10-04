load("EN200x25.mat")
figure(1)
scatter(bnew,Enew,'.','k')
xlabel("$\alpha$",'Interpreter','latex','FontSize',18)
ylabel("$\epsilon_\mathbf{k}$",'Interpreter','latex','FontSize',20)
ax=gca;
ax.FontSize=14;
ax.XGrid='on';
pbaspect([1 1 1])
xticks([0 1/8 1/6 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 1])
xticklabels({'$0$','$\frac{1}{8}$','$\frac{1}{6}$','$\frac{1}{5}$','$\frac{1}{4}$','$\frac{1}{3}$','$\frac{2}{5}$','$\frac{1}{2}$','$\frac{3}{5}$','$\frac{2}{3}$','$\frac{3}{4}$','$\frac{4}{5}$','$1$'})
set(gca,'TickLabelInterpreter','latex')
xlim([0 1])
ylim([min(Enew) max(Enew)])
f=gcf;
exportgraphics(f,"eigenValueMagnetN25x200.png",'Resolution',300);