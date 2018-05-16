function yw = recuperamin(p,n,m,mij,X)
% 
%  Producto M�nimo, M. A. Morfol�gicas
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