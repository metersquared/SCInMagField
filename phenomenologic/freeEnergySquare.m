function dFsq=freeEnergySquare(a,b,lpd,N)
    dFsq=0;
    nLattice=[-N/2:N/2];
    [hGrid, kGrid]=meshgrid(nLattice,nLattice);
    freeEnergyGrid=1./(1+lpd^2*4*pi^2/a^2*(hGrid.^2+kGrid.^2));
    dFsq=sum(freeEnergyGrid,"all");
    dFsq=b^2/(8*pi)*dFsq
end
