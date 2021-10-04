N=[10 100 1000 10000];
freeEnergy.hex=zeros(1,length(N));
freeEnergy.square=zeros(1,length(N));
for i=1:length(N)
    freeEnergy.hex(i)=freeEnergyHex(1,1,5,N(i))
    freeEnergy.square(i)=freeEnergySquare(1,1,5,N(i))
end
save('freeEnergy.mat','freeEnergy');