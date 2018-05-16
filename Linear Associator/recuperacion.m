function yw = recuperacion(p,n,m,mij,X)
%  Operacion de aprendizaje del Linear Associator
%
%   Yw = recuperacion(p,n,m,mij,X)
%   

    yw=zeros(p,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                z=mij(i,j)*X(mu,i);
                yw(mu,j)=yw(mu,j)+z;
            end
        end
    end