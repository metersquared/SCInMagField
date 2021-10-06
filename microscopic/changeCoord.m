function coordNew=changeCoord(coord,xChange,yChange,in)
coordNew.x=mod(coord.x+xChange-1,in.Nx)+1;
coordNew.y=mod(coord.y+yChange-1,in.Ny)+1;
end