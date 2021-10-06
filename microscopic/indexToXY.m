function coord=indexToXY(i,in)
    coord.x=mod(i-1,in.Nx)+1;
    coord.y=floor((i-1)/in.Nx)+1;
end