function []=tDependence(filename_in,filename_out)
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
vars.gapArray=zeros(length(tFactor),in.Nx*in.Ny);
vars.muHist=zeros(length(tFactor),in.maxIterations);
vars.gapHist=zeros(length(tFactor),in.maxIterations);
vars.nHist=zeros(length(tFactor),in.maxIterations);
for i=1:length(tFactor)
	in.Nx
	in.Ny
	int2str(i)+"/"+int2str(N)
        currentVar=varCalc(in,tFactor(i));
        currentVar.chemPot
	currentVar.gapNorm
        vars.chemPot(i)=currentVar.chemPot;
        vars.gapNorm(i)=currentVar.gapNorm;
	vars.gapArray(i,:)=currentVar.gapArray;
	vars.muHist(i,:)=currentVar.muHist;
	vars.gapHist(i,:)=currentVar.gapHist;
	vars.nHist(i,:)=currentVar.nHist;
	save(filename_out,'vars');
end
