function fluxDens=fluxdensitySquare(lpd,b,a,x,y)
    fluxDens=0;
    for h=-50:50
        for k=-50:50
            fluxDens=fluxDens+b*exp(1i*2*pi*a*(h*x+k*y))/(1+lpd^2*4*pi^2*a^2*(h^2+k^2));
            h
            k
        end
    end
%     latticeCount=[-50:50];
%     [hGrid,kGrid]=meshgrid(latticeCount);
%     fluxDensGrid=b*exp(1i*2*pi/a*(hGrid*x+kGrid*y))./(1+lpd^2*4*pi^2*a^2*(hGrid.^2+kGrid.^2));
%     fluxDens=sum(fluxDensGrid,"all");
end