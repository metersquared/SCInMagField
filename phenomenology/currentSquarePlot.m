load("datacurrentsquare.mat");
f=figure(5);
q=quiver(currentsquare.x,currentsquare.y,'LineWidth',1.5,'Color','k');
set(q,'AutoScale','on', 'AutoScaleFactor',0.55)
pbaspect([2 1 1]);
xlabel('$x$', 'Interpreter','latex','FontSize',18)
ylabel('$y$', 'Interpreter','latex','FontSize',18)
xlim([1 50]);
ylim([1 25]);
exportgraphics(f,"datacurrentsquare.pdf",'ContentType','vector');