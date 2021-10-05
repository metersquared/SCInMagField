load("datasquare2.mat")

x = linspace(-5,5,size(datasquare,2));
y = linspace(-5,5,size(datasquare,1));
levels=10;
minSquare=min(real(datasquare),[],'all')+0.0001;
maxSquare=max(real(datasquare),[],'all');
minPowerSquare=log10(0.98);
maxPowerSquare=log10(maxSquare);
saddleSquare=0.9989;
squareLevels=[(minSquare:(maxSquare-minSquare)/levels:maxSquare) saddleSquare];

figure(1)
subplot(1,2,1,gca)
mesh(x,y,real(datasquare))
xlim([-1.5 1.5])
ylim([-1.5 1.5])
zlim([min(real(datasquare),[],'all') max(real(datasquare),[],'all')])
xlabel("x")
ylabel("y")
zlabel("B_z")
pbaspect([1 1 1])
view([-28.212 68.842])
f=gcf;
%exportgraphics(f,"fluxDensityMeshSquare.png","Resolution",300);
subplot(1,2,2)
contour(x,y,real(datasquare),squareLevels)
xlim([-1.5 1.5])
ylim([-1.5 1.5])
xticks([])
yticks([])
xlabel("x")
ylabel("y")
pbaspect([1 1 1])
f=gcf;
exportgraphics(f,"fluxDensitySquare.png","Resolution",300);