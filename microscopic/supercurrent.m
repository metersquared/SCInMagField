function j=supercurrent(in,eigenE,eigenV)
    totState=in.Nx*in.Ny;
    jPlus.x=zeros(in.Ny,in.Nx);
    jPlus.y=zeros(in.Ny,in.Nx);
    jMin.x=zeros(in.Ny,in.Nx);
    jMin.y=zeros(in.Ny,in.Nx);
    j.x=zeros(in.Ny,in.Nx);
    j.y=zeros(in.Ny,in.Nx);
    for i=1:totState
        i
        coord=indexToXY(i,in);
        %X-wards current
        nnPlusX=XYToIndex(changeCoord(coord,1,0,in),in);
        nnMinusX=XYToIndex(changeCoord(coord,-1,0,in),in);
        nnPlusY=XYToIndex(changeCoord(coord,0,1,in),in);
        nnMinusY=XYToIndex(changeCoord(coord,0,-1,in),in);
%         txPlus=hamiltonian(nnPlusX,i);
%         txMinus=hamiltonian(nnMinusX,i);
%         tyPlus=hamiltonian(nnPlusY,i);
%         tyMinus=hamiltonian(nnMinusY,i);
        txPlus=in.hopInt*exp(1i*2*pi*in.b*coord.y);
        txMinus=in.hopInt*exp(-1i*2*pi*in.b*coord.y);
        tyPlus=in.hopInt;
        tyMinus=in.hopInt;
        if coord.y==1
            tyMinus=in.hopInt*exp(1i*2*pi*in.b*in.Ny*coord.x);
        end
        if coord.y==in.Ny
            tyPlus=in.hopInt*exp(-1i*2*pi*in.b*in.Ny*coord.x);
        end
        
%         fluxXPlus=1i*((txPlus*(conj(eigenV(nnPlusX,:)).*eigenV(i,:))-conj(txPlus)*(eigenV(nnPlusX,:).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(txPlus*(conj(eigenV(nnPlusX+totState,:)).*eigenV(i+totState,:))-conj(txPlus)*(eigenV(nnPlusX+totState,:).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxXMinus=1i*((txMinus*(conj(eigenV(nnMinusX,:)).*eigenV(i,:))-conj(txMinus)*(eigenV(nnMinusX,:).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(txMinus*(conj(eigenV(nnMinusX+totState,:)).*eigenV(i+totState,:))-conj(txMinus)*(eigenV(nnMinusX+totState,:).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYPlus=1i*((tyPlus*(conj(eigenV(nnPlusY,:)).*eigenV(i,:))-conj(tyPlus)*(eigenV(nnPlusY,:).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(tyPlus*(conj(eigenV(nnPlusY+totState,:)).*eigenV(i+totState,:))-conj(tyPlus)*(eigenV(nnPlusY+totState,:).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYMinus=1i*((tyMinus*(conj(eigenV(nnMinusY,:)).*eigenV(i,:))-conj(tyMinus)*(eigenV(nnMinusY,:).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(tyMinus*(conj(eigenV(nnMinusY+totState,:)).*eigenV(i+totState,:))-conj(tyMinus)*(eigenV(nnMinusY+totState,:).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
          
        fluxXPlus=2*imag(txPlus*((conj(eigenV(nnPlusX,:)).*eigenV(i,:))*fermiDist(diag(eigenE),in.tFactor)+conj(conj(eigenV(nnPlusX+totState,:)).*eigenV(i+totState,:))*fermiDist(diag(-eigenE),in.tFactor)));
        fluxXMinus=2*imag(txMinus*((conj(eigenV(nnMinusX,:)).*eigenV(i,:))*fermiDist(diag(eigenE),in.tFactor)+conj(conj(eigenV(nnMinusX+totState,:)).*eigenV(i+totState,:))*fermiDist(diag(-eigenE),in.tFactor)));
        fluxYPlus=2*imag(tyPlus*((conj(eigenV(nnPlusY,:)).*eigenV(i,:))*fermiDist(diag(eigenE),in.tFactor)+conj(conj(eigenV(nnPlusY+totState,:)).*eigenV(i+totState,:))*fermiDist(diag(-eigenE),in.tFactor)));
        fluxYMinus=2*imag(tyMinus*((conj(eigenV(nnMinusY,:)).*eigenV(i,:))*fermiDist(diag(eigenE),in.tFactor)+conj(conj(eigenV(nnMinusY+totState,:)).*eigenV(i+totState,:))*fermiDist(diag(-eigenE),in.tFactor)));
        
%         fluxXPlus=1i*((txPlus*((eigenV(nnPlusX,:)).*conj(eigenV(i,:)))-conj(txPlus)*(conj(eigenV(nnPlusX,:)).*(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(conj(txPlus)*((eigenV(nnPlusX+totState,:)).*conj(eigenV(i+totState,:)))-(txPlus)*(conj(eigenV(nnPlusX+totState,:)).*(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxXMinus=1i*((txMinus*((eigenV(nnMinusX,:)).*conj(eigenV(i,:)))-conj(txMinus)*(conj(eigenV(nnMinusX,:)).*(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(conj(txMinus)*((eigenV(nnMinusX+totState,:)).*conj(eigenV(i+totState,:)))-(txMinus)*(conj(eigenV(nnMinusX+totState,:)).*(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYPlus=1i*((tyPlus*((eigenV(nnPlusY,:)).*conj(eigenV(i,:)))-conj(tyPlus)*(conj(eigenV(nnPlusY,:)).*(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(conj(tyPlus)*((eigenV(nnPlusY+totState,:)).*conj(eigenV(i+totState,:)))-(tyPlus)*(conj(eigenV(nnPlusY+totState,:)).*(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYMinus=1i*((tyMinus*((eigenV(nnMinusY,:)).*conj(eigenV(i,:)))-conj(tyMinus)*(conj(eigenV(nnMinusY,:)).*(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(conj(tyMinus)*((eigenV(nnMinusY+totState,:)).*conj(eigenV(i+totState,:)))-(tyMinus)*(conj(eigenV(nnMinusY+totState,:)).*(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));

%         fluxXPlus=1i*((txPlus*((eigenV(nnPlusX,:)).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(txPlus*((eigenV(nnPlusX+totState,:)).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxXMinus=1i*((txMinus*((eigenV(nnMinusX,:)).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(txMinus*((eigenV(nnMinusX+totState,:)).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYPlus=1i*((tyPlus*((eigenV(nnPlusY,:)).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(tyPlus*((eigenV(nnPlusY+totState,:)).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));
%         fluxYMinus=1i*((tyMinus*((eigenV(nnMinusY,:)).*conj(eigenV(i,:))))*fermiDist(diag(eigenE),in.tFactor(1))-(tyMinus*((eigenV(nnMinusY+totState,:)).*conj(eigenV(i+totState,:))))*fermiDist(diag(-eigenE),in.tFactor(1)));

        j.xPlus(coord.y,coord.x)=fluxXPlus;
        j.yPlus(coord.y,coord.x)=fluxYPlus;
        j.xMin(coord.y,coord.x)=fluxXMinus;
        j.yMin(coord.y,coord.x)=fluxYMinus;
        j.x(coord.y,coord.x)=fluxXPlus-fluxXMinus;
        j.y(coord.y,coord.x)=fluxYPlus-fluxYMinus;
    end
    
    %[A,eigenA]=eig(bcsMatrix(1:totState,1:totState));
    %[B,eigenB]=eig(bcsMatrix(1+totState:2*totState,1:totState));
    %=diag(eigen);
    %product1=(conj(P(1:totState,1:2*totState)).*(P(1+totState:2*totState,1:2*totState)))*(-tanh(diag(eigenP)/(2*T)));
    %product1=(conj(P(1:totState,1:2*totState)).*(P(1+totState:2*totState,1:2*totState)))*(fermiDist(diag(eigenP),T));
    %product2=(conj(P(1+totState:2*totState,totState+1:2*totState)).*(P(1:totState,totState+1:2*totState)))*(fermiDist(diag(eigenP(1+totState:2*totState,1+totState:2*totState)),T));
end