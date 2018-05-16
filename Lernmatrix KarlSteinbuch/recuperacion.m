function yw = recuperacion(p,n,m,mij,X)
%  Operacion de aprendizaje de la Lernmatrix
%
%   Yw = recuperacion(p,n,m,mij,X)
%   

    y=mij*X';
    maximo=max(y);
    
    for mu=1:1:p,
        for i=1:1:m,
            if (y(i,mu)==maximo(mu))
                yw(i,mu)=1;
            else
                yw(i,mu)=0;
            end
        end
    end