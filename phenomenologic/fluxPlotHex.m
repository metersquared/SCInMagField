load("datahex2.mat")

x = linspace(-5,5,size(datahex,2));
y = linspace(-5,5,size(datahex,1));
levels=10;
minHex=min(real(datahex),[],'all')+0.00005;
maxHex=max(real(datahex),[],'all');
minPowerHex=log10(0.965);
maxPowerHex=log10(maxHex);
saddleHex=0.99873;
hexLevels=[(minHex:(maxHex-minHex)/levels:maxHex) saddleHex];

figure(2)
subplot(1,2,1,gca)
mesh(x,y,real(datahex))
xlim([-1.5 1.5])
ylim([-1.5 1.5])
zlim([min(real(datahex),[],'all') max(real(datahex),[],'all')])
xlabel("x")
ylabel("y")
zlabel("B_z")
pbaspect([1 1 1])
view([-28.212 68.842])
f=gcf;
%exportgraphics(f,"fluxDensityMeshHex.png","Resolution",300);
subplot(1,2,2)
contour(x,y,real(datahex),hexLevels)
xlim([-1.5 1.5])
ylim([-1.5 1.5])
xticks([])
yticks([])
xlabel("x")
ylabel("y")
pbaspect([1 1 1])
f=gcf;
exportgraphics(f,"fluxDensityHex.png","Resolution",300);