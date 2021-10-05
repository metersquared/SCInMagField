function n=calcN(T,P,eigenP)
    totState=length(P)/2;
    product1=abs(P(1:totState,:)).^2*fermiDist(diag(eigenP),T);
    product2=abs(P(1+totState:2*totState,:)).^2*(1-fermiDist(diag(eigenP),T));
    %product1A=P(1:totState,1+totState:2*totState).*conj(P(1:totState,1+totState:2*totState))*fermiDist(diag(eigenP(1+totState:2*totState,1+totState:2*totState)),T);
    %product2A=abs(P(1+totState:2*totState,1+totState:2*totState)).^2*(1-fermiDist(diag(eigenP(1+totState:2*totState,1+totState:2*totState)),T));
    %product1A=abs(P(1:totState,1+totState:2*totState)).^2*fermiDist(diag(eigenP(1+totState:2*totState,1+totState:2*totState)),T);
    n=real(sum(product1+product2,'all'));
end