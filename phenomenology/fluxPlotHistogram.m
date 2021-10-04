load("datahex2.mat")

figure(3)
[hexFluxHistogram,fieldEdges]=histcounts(real(datahex),400);
fields=(fieldEdges(1:length(hexFluxHistogram))+fieldEdges(2:length(hexFluxHistogram)+1))/2;
bar(fields,hexFluxHistogram/sum(hexFluxHistogram),'white','EdgeColor','black')
ax=gca;
ax.FontSize=14;
xlim([min(fields) 1.01]);
Annotate(gca, 'textarrow', [1.004 0.998751], [0.05,max(hexFluxHistogram/sum(hexFluxHistogram))], 'string', "saddle point",'TextEdgeColor','none','FontWeight','bold','interpreter','latex','FontSize',14);
xlabel('$B$','Interpreter','latex','FontSize',16)
ylabel('$n(B)$','Interpreter','latex','FontSize',16)
f=gcf;
exportgraphics(f,"fluxHistogram.png","Resolution",300);