function yw = recuperacionloos(p,n,m,mij,X)
%  Operacion de recuperación para la Red Asociativa de Willshaw
%
%   yw = recuperacionloos(p,n,m,mij,X)
%   

    u=2*ceil(log2(n))+1
    y=mij*X'
    
    for i=1:1:m,
        if (y(i)>u)
            yw(i)=1;
        else
            yw(i)=0;
        end
    end
    yw