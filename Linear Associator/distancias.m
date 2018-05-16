function Distancias = distancias(p,n,Xmu,Xw)
%  Cálculo de distancias entre patrones!
%
%  Distancias = distancias(p,n,X);
%

dxx=0;
Distancias=zeros(p,p);
for mu2=1:1:p,
% mu2=1;
    for mu=1:1:p,
        for j=1:1:n,
            dxx = power(abs(Xmu(mu2,j)-Xw(mu,j)),2);
            Distancias(mu2,mu) = Distancias(mu2,mu) + dxx;
        end
    end
end