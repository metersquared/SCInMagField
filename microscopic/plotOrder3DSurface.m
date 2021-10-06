load("tOutN50x25n0.35v1.95b0.0008alpha0.7newGap.mat");
f=figure(2);
order=reshape(vars.gapArray(1,:),50,25)';
observable=abs(order);
surf(observable);
xlim([1 50])
ylim([1 25])
pbaspect([2 1 1])
xlabel('$x$','Interpreter','latex','FontSize',12)
ylabel('$y$','Interpreter','latex','FontSize',12)
zlabel('$\Delta_i/t$','Interpreter','latex','FontSize',12)
view([-13.7951086873398 19.1509372376981])
%exportgraphics(f,"tOutN50x25n0.35v1.95b0.0008alpha0.7newGapOrders.pdf","ContentType",'vector');