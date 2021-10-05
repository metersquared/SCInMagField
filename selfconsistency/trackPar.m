% minPower=-1.3;
% maxPower=-5;  
% pointsPower=10;
% tFactor=logspace(minPower,maxPower,pointsPower);

minT=0.000001;
maxT=0.015;
%numPoints=15;
%interval=abs(maxT-minT)/numPoints;
%tFactor=(minT:interval:maxT);
tFactor=minT
%tFactor=maxT

Nx=[50];
Ny=[25];
vFactor=1.95;
hopInt=1.0;
nTarget=0.35;
b=1/(Nx*Ny);
initialChemPot=-0.73;
%initialChemPot=vars.chemPot(1);
alpha=0.7;
beta=0.5;
maxIterations=10000;
impurityCoords=[;]; 

for i=1:length(Nx)
    in.Nx=Nx(i);
    in.Ny=Ny(i);
    in.vFactor=vFactor;
    in.hopInt=hopInt;
    in.nTarget=nTarget;
    in.b=b;
    in.beta=beta;
    in.chemPot=initialChemPot;
    in.alpha=alpha;
    in.maxIterations=maxIterations;
    in.tFactor=tFactor;
    in.counter=1;
    in.gapArray=0.15*ones(1,Nx(i)*Ny(i));%exp(2i*pi*rand(1,Nx(i)*Ny(i)));
    %in.gapArray=vars.gapArray(1,:);
    in.impurityArray=generateImpurity(1.95,impurityCoords,Nx(i),Ny(i));
    filename = ['trackParN' num2str(in.Nx) 'x' num2str(in.Ny) 'n' num2str(nTarget) 'v' num2str(vFactor) 'b' num2str(b) 't' num2str(tFactor) 'Pure.mat'];
    save(filename);
end