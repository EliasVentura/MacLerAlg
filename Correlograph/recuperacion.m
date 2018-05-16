function yw = recuperacion(p,n,m,mij,X)
%  Operacion de recuperación para la Red Asociativa de Willshaw
%
%   yw = recuperacion(p,n,m,mij,X)
%   

    u=2*ceil(log2(n))+1
    y=mij*X'
    
    for mu=1:1:p,
        for i=1:1:m,
            if (y(i,mu)>u)
                yw(i,mu)=1;
            else
                yw(i,mu)=0;
            end
        end
    end
    yw