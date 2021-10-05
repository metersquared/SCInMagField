function fluxDens=fluxdensityHex(lpd,b,a,x,y)
    fluxDens=0;
    b1=2*pi/a*[1 -1/sqrt(3)];
    b2=2*pi/a*2/sqrt(3)*[0 1];
    r=[x y];
    for h=-50:50
        for k=-50:50
            Q=h*b1+k*b2;
            fluxDens=fluxDens+b*exp(1i*2*pi*a*(h*x+1/sqrt(3)*(2*k-h)*y))/(1+lpd^2*4*pi^2/a^2*(h^2+1/3*(2*k-h)^2));
            %fluxDens=fluxDens+b*exp(1i*dot(Q,r))/(1+lpd^2*dot(Q,Q));
            h
            k
        end
    end
end