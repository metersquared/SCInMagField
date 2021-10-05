function gap=gapEquation(T,MaxGap,Tc)
    syms D;
    eqn=tanh(D./(T/Tc))==D;
    gap=MaxGap*double(arrayfun(@vpasolve,eqn,ones(1,length(T))));
end