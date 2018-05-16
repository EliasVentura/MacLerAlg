function mij = aprendemaxloo(p,n,m,mu2,X,Y)
% 
%  Producto Máximo, M. A. Morfológicas
% 
%   mij = aprendemaxloo(p,n,m,mu2,X,Y)
%   

    mij=-inf(m,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                if (mu~=mu2)
                    z=0;
                    z=Y(mu,i)+X(mu,j);
                    mij(i,j)=max(z,mij(i,j));
                end
            end
        end
    end