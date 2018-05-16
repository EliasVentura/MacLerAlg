function mij = aprendemax(p,n,m,X,Y)
% 
%  Producto Máximo, M. A. Morfológicas
% 


mij=-inf(m,n);
for mu=1:1:p,
    for i=1:1:m,
        for j=1:1:n,
            z=0;
            z=Y(mu,i)+X(mu,j);
            mij(i,j)=max(z,mij(i,j));
        end
    end
end