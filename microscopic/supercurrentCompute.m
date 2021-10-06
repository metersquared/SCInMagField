load("trackParN50x25n0.35v1.95b0.0008t1e-06Pure.mat");
load("trackOutN50x25n0.35v1.95b0.0008t1e-06Pure.mat");
in.chemPot=vars.chemPot;
in.gapArray=vars.gapArray(19,:);
hamiltonian=bcsRectangularCell(in);
[eigenV,eigenE]=eig(hamiltonian);
j=supercurrent(in,eigenE,eigenV);
save("jDataN50x25n0.35v1.95b0.0008t1e-06Pure.mat",'j');