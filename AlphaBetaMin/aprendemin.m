function mij = aprendemin(p,n,m,X,Y)
% 
%  Producto Mínimo, M. A. Alfa-Beta
% 


mij=inf(m,n);
for mu=1:1:p,
    for i=1:1:m,
        for j=1:1:n,
%             z=0;
            z=alfa(Y(mu,i),X(mu,j));
            mij(i,j)=min(z,mij(i,j));
        end
    end
end