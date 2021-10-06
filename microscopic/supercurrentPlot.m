load("jDataN50x25n0.35v1.95b0.0008t1e-06Pure.mat");
f=figure(5);
q=quiver(j.x,j.y,'LineWidth',1.5,'Color','k');
set(q,'AutoScale','on', 'AutoScaleFactor',0.55)
pbaspect([2 1 1]);
xlabel('$x$', 'Interpreter','latex','FontSize',18)
ylabel('$y$', 'Interpreter','latex','FontSize',18)
xlim([1 50]);
ylim([1 25]);
exportgraphics(f,"jDataN50x25n0.35v1.95b0.0008t1e-06Pure.pdf",'ContentType','vector');