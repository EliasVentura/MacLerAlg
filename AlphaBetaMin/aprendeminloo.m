function mij = aprendeminloo(p,n,m,mu2,X,Y)
% 
%  Producto Mínimo, M. A. Alfa-Beta
% 
%   mij = aprendeminloo(p,n,m,mu2,X,Y)
%   

    mij=inf(m,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                if (mu~=mu2)
%                     z=0;
                    z=alfa(Y(mu,i),X(mu,j));
                    mij(i,j)=min(z,mij(i,j));
                end
            end
        end
    end