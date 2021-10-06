function freeenergy=freeEnergyBCS(in,eigenV,eigenE)
    
    %Hopping energy term
    eigenVX=eigenV;
    totState=in.Nx*in.Ny;
    for i=1:in.Ny
        eigenVX(1+in.Nx*(i-1):in.Nx+in.Nx*(i-1),:)=circshift(eigenVX(1+in.Nx*(i-1):in.Nx+in.Nx*(i-1),:),[-1 0]);
        eigenVX(1+totState+in.Nx*(i-1):in.Nx+totState+in.Nx*(i-1),:)=circshift(eigenVX(1+totState+in.Nx*(i-1):in.Nx+totState+in.Nx*(i-1),:),[-1 0]);
    end
    eigenVY=eigenV;
    eigenVY(1:totState,:)=circshift(eigenVY(1:totState,:),[in.Ny 0]);
    eigenVY(1+totState:2*totState,:)=circshift(eigenVY(1+totState:2*totState,:),[in.Ny 0]);
    phase=1i*in.b*(2*pi);
    xPhase=exp(phase*(1:in.Ny));
    tX=repmat(xPhase',1,in.Nx)';
    tX=in.hopInt*tX(:);
    tY=in.hopInt*ones(1,totState)';
    tY(1:in.Nx)=in.hopInt.*exp(-phase*(1:in.Nx)*in.Ny);
    forwardSumX= tX'*(((eigenV(1:totState,:)).*conj(eigenVX(1:totState,:)))*fermiDist(diag(eigenE),in.tFactor)+((eigenV(1+totState:2*totState,:)).*conj(eigenVX(1+totState:2*totState,:)))*fermiDist(diag(-eigenE),in.tFactor));
    forwardSumY= tY'*(((eigenV(1:totState,:)).*conj(eigenVY(1:totState,:)))*fermiDist(diag(eigenE),in.tFactor)+((eigenV(1+totState:2*totState,:)).*conj(eigenVY(1+totState:2*totState,:)))*fermiDist(diag(-eigenE),in.tFactor));
    backwardSumX=conj(forwardSumX);
    backwardSumY=conj(forwardSumY);
    hoppingEnergy=(forwardSumX+forwardSumY+backwardSumX+backwardSumY);
    
    %Gap energy term
    gapEnergy=-1/in.vFactor*sum(abs(in.gapArray).^2);
    
    %Potential energy term
    potentialEnergy=in.chemPot*calcN(in.tFactor,eigenV,eigenE);
    
    %Spin interaction energy term
    spinInteractionEnergy=-in.vFactor*sum((abs(eigenV(1:totState,:)).^2*fermiDist(diag(eigenE),in.tFactor)).*(abs(eigenV(1+totState:2*totState,:)).^2*fermiDist(diag(-eigenE),in.tFactor)));
    
    %Entropy
    entroA=fermiDist(diag(eigenE),in.tFactor).*log(fermiDist(diag(eigenE),in.tFactor));
    entroB=(1-fermiDist(diag(eigenE),in.tFactor)).*log(1-fermiDist(diag(eigenE),in.tFactor));
    entropy=-(sum(entroA(~isnan(entroA)))+sum(entroB(~isnan(entroB))));
    
    %Field energy
    fieldEnergy=in.b/(8*pi);
    
    freeenergy=(-hoppingEnergy-potentialEnergy+gapEnergy+spinInteractionEnergy-in.tFactor*entropy+fieldEnergy)/(in.Nx*in.Ny);
    
end