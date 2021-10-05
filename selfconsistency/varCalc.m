function vars=varCalc(in,tFactor)
    
    totState=in.Nx*in.Ny;
    in.chemPot=in.initialChemPot;
    V=-in.vFactor*abs(in.hopInt);
    T=tFactor*abs(in.hopInt);
    rng('default');
    %initialGapArray=exp(2i)*0.344704999850110*ones(totState,1);
    diffGap=1;
    counter=1;
    vars.nHist=zeros(1,in.maxIterations);
    vars.gapHist=zeros(1,in.maxIterations);
    vars.muHist=zeros(1,in.maxIterations);
    %real diff at 3.15e-16
    while and(diffGap>3.15e-16,max(abs(in.gapArray))>1e-10)
       tic
       Hamiltonian=bcsRectangularCell(in);
       [P,eigenP]=eig(Hamiltonian);
       newGapArray=calcGap(V,T,P,eigenP);
       n=calcN(T,P,eigenP)/totState;
       diffN=(in.nTarget-n)/in.nTarget;
       in.chemPot=in.chemPot+in.beta*diffN;
       oldGapArray=in.gapArray;
       in.gapArray=in.gapArray*in.alpha+newGapArray'*(1-in.alpha);
       diffGap=norm(oldGapArray-in.gapArray,1)/norm(in.gapArray,1)
       vars.nHist(counter)=n;
       vars.gapHist(counter)=diffGap;
       vars.muHist(counter)=in.chemPot;
       toc
       counter=counter+1
       if counter==in.maxIterations
           break
       end
    end
    vars.chemPot=in.chemPot;
    vars.gapNorm=norm(in.gapArray,1)/totState;
    vars.gapArray=in.gapArray;
end
