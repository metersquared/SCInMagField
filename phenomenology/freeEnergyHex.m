function dFtr=freeEnergyHex(a,b,lpd,N)
    dFtr=0;
    nLattice=[-N/2:N/2];
    [hGrid, kGrid]=meshgrid(nLattice,nLattice);
    freeEnergyGrid=1./(1+lpd^2*4*pi^2/a^2*(hGrid.^2+1/3*(2*kGrid-hGrid).^2));
    dFtr=sum(freeEnergyGrid,"all");
    dFtr=b^2/(8*pi)*dFtr
end