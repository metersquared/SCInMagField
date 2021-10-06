load("ParNormalMetalN50x25n0.35v1.7b0.0008.mat")
n=1;
b=linspace(0,n/(in.Nx*in.Ny),n+1);
T=linspace(1e-4,0.15,50);
freeEnergy=zeros(2,length(T));
for i=1:2
    in.b=b(i);
    b(i)
    for j=1:length(T)
        j
        in.tFactor=T(j);
        var=varCalcChemPot(in,in.tFactor);
        in.chemPot=var.chemPot;
        chemPot=var.chemPot;
        hamiltonian=bcsRectangularCellFix(in);
        [V,E]=eig(hamiltonian);
        freeEnergy(i,j)=freeEnergyBCS(in,V,E)
    end
end

save("freeEnergyNormalMetalN50x25n0.35v1.7b0.0008.mat",'freeEnergy')

load("tOutN50x25n0.35v1.7b0alpha0.7newGapSweep.mat")
freeEnergySC=zeros(2,length(vars.tFactor));
for j=1:length(vars.tFactor)
    j
    in.tFactor=vars.tFactor(j);
    in.chemPot=vars.chemPot(j);
    in.gapArray=vars.gapArray(j,:);
    hamiltonian=bcsRectangularCellFix(in);
    [V,E]=eig(hamiltonian);
    freeEnergySC(1,j)=freeEnergyBCS(in,V,E);
end

load("tOutN50x25n0.35v1.7b0.0008alpha0.7newGapSweep.mat")
for j=1:length(vars.tFactor)
    j
    in.tFactor=vars.tFactor(j);
    in.chemPot=vars.chemPot(j);
    in.gapArray=vars.gapArray(j,:);
    hamiltonian=bcsRectangularCellFix(in);
    [V,E]=eig(hamiltonian);
    freeEnergySC(2,j)=freeEnergyBCS(in,V,E);
end

save("freeEnergySCN50x25n0.35v1.7b0.0008.mat",'freeEnergySC')