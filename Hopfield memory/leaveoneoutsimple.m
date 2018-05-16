function xtau = leaveoneoutsimple(p,n,m,Memoria,X)
%  Validación Leave-One-Out simple para Linear Associator!
%
%  xtau = leaveoneoutsimple(p,n,m,Memoria,X)
%

xtete=inf(3,n);
xtau=X;
for mu=1:1:p,

    %%APRENDIZAJE
    mij=zeros(m,n);
    for i=1:1:m,
        for j=1:1:n,
            mij(i,j)=X(mu,j)*X(mu,i);
        end
    end
    mij=mij-eye(n);
    NMemoria=Memoria-mij

   %%RECUPERACIÓN
    salir=0;
    while salir~=1
        xte2=zeros(1,n);
        xte(mu,:)=xtau(mu,:);
        xtete(2,:)=xtau(mu,:);
        for i=1:1:m,

            for j=1:1:n,
                z=NMemoria(i,j)*xte(mu,j);
                xte2(1,i)=xte2(1,i)+z;
            end

            if (xte2(1,i)>0)
                xtau(mu,i)=1;
            elseif (xte2(1,i)<0)
                xtau(mu,i)=-1;
            else
                xtau(mu,i)=xte(mu,i);
            end

        end
        xtete(3,:)=xtau(mu,:);

        if (xte(mu,:)==xtau(mu,:))
            salir=1;
        else
            salir=0;
        end

        if (xtete(1,:)==xtete(3,:))
            salir=1;
        end
        xtete(1,:)=xtete(2,:);
    end

end