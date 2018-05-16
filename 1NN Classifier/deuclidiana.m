function distancia = deuclidiana(n,Xmu,Xw)
%  Cálculo de distancias entre patrones!
%
%  Distancia = deuclidiana(n,Xmu,Xw)
%

dxx=0;
distancia=0;
for j=1:1:n,
    dxx = power(abs(Xmu(j)-Xw(j)),2);
    distancia = distancia + dxx;
end