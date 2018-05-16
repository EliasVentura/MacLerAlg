function yw = leaveoneoutsimple(XC,p,n,m,X,Y)
%  Validación Leave-One-Out simple para Linear Associator!
%
%  yw = leaveoneoutsimple(XC,p,n,m,X,Y)
%
    
    Memoria = aprendizaje(p,n,m,X,Y);
    yw=zeros(p,n);
    bien=0;
    dxx=0;

for mu2=1:1:p,

    %%APRENDIZAJE
    dmij=zeros(m,n);
    for i=1:1:m,
        for j=1:1:n,
            dmij(i,j)=X(mu2,j)*Y(mu2,i);
        end
    end
    NMemoria=Memoria-dmij;

   %%RECUPERACIÓN
    yw(mu2,:) = recuperacionloos(p,n,m,NMemoria,X(mu2,:));

    dist=zeros(p,1);
    for mu=1:1:p,
        for j=1:1:n,
            dxx = power(abs(yw(mu2,j)-X(mu,j)),2);
            dist(mu) = dist(mu) + dxx;
        end
    end
    dist
    minimadis = min(dist)

    mu=1;
    while dist(mu)~=minimadis
        mu=mu+1;
    end
    clasif=mu;
    if (XC(clasif,n+1)==XC(mu2,n+1))
        bien=bien+1;
    end

end

performance = bien*100/p;
sprintf('El clasificador obtuvo: %d buenas',bien)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performance)