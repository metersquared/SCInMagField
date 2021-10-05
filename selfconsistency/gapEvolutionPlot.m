load("trackOutN50x25n0.35v1.95b0.0008alpha0.7Pure.mat");
f=figure(3);
iterations=floor(logspace(1,log10(6000),20));
for i=1:8
    order=reshape(vars.gapArray(2*i-1,:),50,25)'; 
    observable=abs(order);
    subplot(4,4,[2*i-1,2*i])
    surface(observable,'EdgeAlpha',0);
    xlim([1 50])
    ylim([1 25])
    pbaspect([2 1 1])
%     xlabel('x','Interpreter','latex','FontSize',12)
%     ylabel('y','Interpreter','latex','FontSize',12)
    text=[num2str(iterations(2*i-1)) ' Iterations'];
    title(text,'Interpreter','latex')
end