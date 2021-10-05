function gapArray=calcGap(V,T,P,eigenP)
    totState=length(P)/2;
    %[A,eigenA]=eig(bcsMatrix(1:totState,1:totState));
    %[B,eigenB]=eig(bcsMatrix(1+totState:2*totState,1:totState));
    %=diag(eigen);
    product1=(conj(P(1:totState,1:2*totState)).*(P(1+totState:2*totState,1:2*totState)))*(-tanh(diag(eigenP)/(2*T)));
    %product1=((P(1:totState,:)).*conj(P(1+totState:2*totState,:)))*(fermiDist(diag(eigenP),T));
    %product2=(conj(P(1+totState:2*totState,totState+1:2*totState)).*(P(1:totState,totState+1:2*totState)))*(fermiDist(diag(eigenP(1+totState:2*totState,1+totState:2*totState)),T));
    gapArray=V*(product1);
end