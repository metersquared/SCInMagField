function vars=varCalcTrack(in,tFactor,checkpoint)
    
    totState=in.Nx*in.Ny;
    in.chemPot=in.chemPot;
    V=-in.vFactor*abs(in.hopInt);
    T=tFactor*abs(in.hopInt);
    rng('default');
    %initialGapArray=exp(2i)*0.344704999850110*ones(totState,1);
    diffGap=1;
    %counter=1;
    vars.nHist=in.nHist;
    vars.gapHist=in.gapHist;
    vars.muHist=in.muHist;
    %real diff at 3.15e-16
    while and(diffGap>1e-20,max(abs(in.gapArray))>1e-10)
       tic
       Hamiltonian=bcsRectangularCellFix(in);
       [P,eigenP]=eig(Hamiltonian);
       newGapArray=calcGap(V,T,P,eigenP);
       n=calcN(T,P,eigenP)/totState;
       diffN=(in.nTarget-n)/in.nTarget;
       in.chemPot=in.chemPot+in.beta*diffN;
       oldGapArray=in.gapArray;
       in.gapArray=in.gapArray*in.alpha+newGapArray'*(1-in.alpha);
       diffGap=norm(oldGapArray-in.gapArray,1)/norm(in.gapArray,1)
       vars.nHist(in.counter)=n;
       vars.gapHist(in.counter)=diffGap;
       vars.muHist(in.counter)=in.chemPot;
       toc
       in.counter=in.counter+1;
       in.counter
       if in.counter==checkpoint
           break
       end
    end
    vars.chemPot=in.chemPot;
    vars.gapNorm=norm(in.gapArray,1)/totState;
    vars.gapArray=in.gapArray;
end
