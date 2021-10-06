function dist=fermiDist(E,T)
    x=E/T;
    idx=(1:length(x));
    dist=zeros(length(x),1);
    %conditional indices
    a=idx(x>50);
    b=idx(and(x>=0,x<=50));
    c=idx(and(x<0,x>=-50));
    d=idx(x<-50);
    %compute based on conditional index
    dist(a)=0;
    dist(b)=exp(-x(b))./(1+exp(-x(b)));
    dist(c)=1./(1+exp(x(c)));
    dist(d)=1;
end
