function y = recuperacionloos(p,n,m,mij,X)
%  Recuperación mediante el metodo LEAVE-ONE-OUT simple
%
%   y = recuperacionloos(p,n,m,mij,X)
%   

    y=zeros(1,n);
    for i=1:1:m,
        for j=1:1:n,
            z=mij(i,j)*X(i);
            y(j)=y(j)+z;
        end
    end