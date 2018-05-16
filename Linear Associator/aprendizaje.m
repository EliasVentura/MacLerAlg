function mij = aprendizaje(p,n,m,X,Y)
%  Operacion de aprendizaje de la Lernmatrix
%
%   mij = aprendizaje(p,n,m,X,Y)
%

    mij=zeros(m,n);
    for mu=1:1:p,
        for i=1:1:m,
            for j=1:1:n,
                dmij(i,j)=X(mu,j)*Y(mu,i);
                mij(i,j)=mij(i,j) + dmij(i,j);
            end
        end
    end