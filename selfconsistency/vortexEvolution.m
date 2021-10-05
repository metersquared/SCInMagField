function []=vortexEvolution(filename_in,filename_out)
if nargin < 2
    filename_out='default_out.mat';
end
if nargin <1
    filename_in='default_in.mat';
end
load(filename_in);
vars.chemPot=zeros(1,length(tFactor));
vars.gapNorm=zeros(1,length(tFactor));
vars.tFactor=tFactor;
N=length(tFactor);
vars.gapArray=zeros(20,in.Nx*in.Ny);
in.muHist=zeros(length(tFactor),in.maxIterations);
in.gapHist=zeros(length(tFactor),in.maxIterations);
in.nHist=zeros(length(tFactor),in.maxIterations);
checkpoints=floor(logspace(1,log10(in.maxIterations),20));
checkCount=1;
for i=1:length(tFactor)
	while checkCount<=20
        in.Nx
        in.Ny
        int2str(i)+"/"+int2str(N)
            currentVar=varCalcTrack(in,tFactor(i),checkpoints(checkCount));
            currentVar.chemPot
            currentVar.gapNorm
            vars.chemPot(i)=currentVar.chemPot;
            vars.gapNorm(i)=currentVar.gapNorm;
        vars.gapArray(checkCount,:)=currentVar.gapArray;
        in.gapArray=vars.gapArray(checkCount,:);
        in.chemPot=currentVar.chemPot;
        vars.muHist=currentVar.muHist;
	in.muHist=vars.muHist;
        vars.gapHist=currentVar.gapHist;
        in.gapHist=vars.gapHist;
	vars.nHist=currentVar.nHist;
        in.nHist=vars.nHist;
	save(filename_out,'vars');
        in.counter=checkpoints(checkCount);
        checkCount=checkCount+1;
    end
end
