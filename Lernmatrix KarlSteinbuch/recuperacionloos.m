function yw = recuperacionloos(p,n,m,mij,X)
%  Operacion de aprendizaje de la Lernmatrix
%
%   Yw = recuperacionloos(p,n,m,mij,X)
%   

    y=mij*X';
    maximo=max(y);
    
    for i=1:1:m,
        if (y(i)==maximo)
            yw(i)=1;
        else
            yw(i)=0;
        end
    end