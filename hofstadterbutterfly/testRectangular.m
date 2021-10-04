%[numerat,denominat]=rat((1:50)/50,1/49);
%b=simplifyFractions(numerat./denominat);
b=(0:200)/200;
in.Nx=200;
in.Ny=25;
E=zeros(in.Nx*in.Ny,length(b));
in.chemPot=0;
in.hopInt=-1;
impurityCoords=[;]
in.impurityArray=generateImpurity(1.0,impurityCoords,in.Nx,in.Ny);

for i=1:length(b)
    in.b=b(i)
    bnew(1+in.Nx*in.Ny*(i-1):in.Nx*in.Ny*i)=b(i)*ones(1,in.Nx*in.Ny);
    E(:,i)=double(eig(normalMetalRectangularCell(in)));
    save('EN200x25.mat');
end
Enew=real(reshape(E,1,in.Nx*in.Ny*length(b)));
save('EN200x25.mat')