function currentDens=currentSquare(lpd,b,a,x,y)
    currentDens.x=0;
    currentDens.y=0;
    for h=-50:50
        for k=-50:50
            currentDens.x=currentDens.x+1i/(2*a)*k*b*exp(1i*2*pi*a*(h*x+k*y))/(1+lpd^2*4*pi^2*a^2*(h^2+k^2));
            currentDens.y=currentDens.y-1i/(2*a)*h*b*exp(1i*2*pi*a*(h*x+k*y))/(1+lpd^2*4*pi^2*a^2*(h^2+k^2));
            h
            k
        end
    end
%     latticeCount=[-50:50];
%     [hGrid,kGrid]=meshgrid(latticeCount);
%     currentDensGrid=b*kGrid.*exp(1i*2*pi/a*(hGrid*x+kGrid*y))./(1+lpd^2*4*pi^2*a^2*(hGrid.^2+kGrid.^2));
%     currentDens.x=sum(currentDensGrid,"all");
%     currentDensGrid=-b*hGrid.*exp(1i*2*pi/a*(hGrid*x+kGrid*y))./(1+lpd^2*4*pi^2*a^2*(hGrid.^2+kGrid.^2));
%     currentDens.y=sum(currentDensGrid,"all");
end