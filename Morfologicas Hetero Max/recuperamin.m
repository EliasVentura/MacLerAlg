function yw = recuperamin(p,n,m,mij,X)
% 
%  Producto Mínimo, M. A. Morfológicas
% 


yw=inf(p,m);
for mu=1:1:p,
    for i=1:1:m,
        for j=1:1:n,
            z=0;
            z=mij(i,j)+X(mu,j);
            yw(mu,i)=min(z,yw(mu,i));
        end
    end
end