function mij = aprendizaje(p,n,m,X)
%  Operacion de aprendizaje de la Memoria Hopfield
%
%   mij = aprendizaje(p,n,m,X)
%

    mij=zeros(m,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                dmij(i,j)=X(mu,j)*X(mu,i);
                mij(i,j)=mij(i,j) + dmij(i,j);
            end
        end
        mij=mij-eye(n)
    end