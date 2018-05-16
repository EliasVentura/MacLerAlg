function mij = aprendizajeloo(p,n,m,mu2,X,Y)
%  Operacion de aprendizaje de la Red Asociativa de Willshaw
%
%   mij = aprendizajeloo(p,n,m,mu2,X,Y)
%   

    mij=zeros(m,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                if (mu~=mu2)
                    if (X(mu,j)==1 && Y(mu,i)==1)
                        mij(i,j)=1;
                    end
                end
            end
        end
    end