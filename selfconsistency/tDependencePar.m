% minPower=-1.3;
% maxPower=-5;  
% pointsPower=10;
% tFactor=logspace(minPower,maxPower,pointsPower);

minT=0.0001;
maxT=0.015;
numPoints=15;
interval=abs(maxT-minT)/numPoints;
tFactor=(minT:interval:maxT);
%tFactor=minT
%tFactor=maxT

Nx=[50];
Ny=[25];
vFactor=1.7;
hopInt=1.0;
nTarget=0.35;
b=6/(Nx*Ny);
%initialChemPot=-0.7268;
initialChemPot=vars.chemPot(1);
alpha=0.7;
beta=0.5;
maxIterations=20000;
impurityCoords=[;]; 

for i=1:length(Nx)
    in.Nx=Nx(i);
    in.Ny=Ny(i);
    in.vFactor=vFactor;
    in.hopInt=hopInt;
    in.nTarget=nTarget;
    in.b=b;
    in.beta=beta;
    in.initialChemPot=initialChemPot;
    in.alpha=alpha;
    in.maxIterations=maxIterations;
    in.tFactor=tFactor;
    %in.gapArray=0.0094*ones(1,Nx(i)*Ny(i));%exp(2i*pi*rand(1,Nx(i)*Ny(i)));
    in.gapArray=vars.gapArray(1,:);
    in.impurityArray=generateImpurity(1.0,impurityCoords,Nx(i),Ny(i));
    filename = ['tParN' num2str(in.Nx) 'x' num2str(in.Ny) 'n' num2str(nTarget) 'v' num2str(vFactor) 'b' num2str(b) 'alpha' num2str(alpha) 'newGapSweep' '.mat'];
    save(filename);
end
