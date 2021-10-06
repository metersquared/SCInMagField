partitionNum=1000;
totalLength=10;
partitionLength=totalLength/partitionNum;
nLattice=[1:partitionNum];
[m,n]=meshgrid(nLattice);
x=m*partitionLength-totalLength/2;
y=n*partitionLength-totalLength/2;
datahex=fluxdensityHex(5,1,1,x,y);
save('datahex.mat','datahex');