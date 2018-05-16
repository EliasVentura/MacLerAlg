function yw = recuperaminloos(p,n,m,mij,x)
% 
%  Producto Mínimo, M. A. Morfológicas
% 


yw=inf(1,m);
for i=1:1:m,
    for j=1:1:n,
        z=0;
        z=mij(i,j)+x(j);
        yw(1,i)=min(z,yw(1,i));
    end
end