function yw = leaveoneoutcompleto(XC,p,n,m,X,Y)
%  Validación Leave-One-Out completo para Linear Associator!
%
%  yw = leaveoneoutcompleto(XC,p,n,m,X,Y)
%
    
    Memoria = aprendizaje(p,n,m,X,Y);
    yw=zeros(p,n);
    bientotal=0;
    performancetotal=0;

for mu2=1:1:p,
    %%APRENDIZAJE
    sprintf('\n\n\t\tCorrida número: %d',mu2)
    dmij=zeros(m,n);
    bien=0;
    for i=1:1:m,
        for j=1:1:n,
            dmij(i,j)=X(mu2,j)*Y(mu2,i);
        end
    end
    NMemoria=Memoria-dmij;

   %%RECUPERACIÓN
    yw = recuperacion(p,n,m,NMemoria,Y);
    Distancias = distancias(p,n,yw,X);

    for mu=1:1:p,
        minimadis(1,mu)=min(Distancias(mu,:));
    end

    j=1;
    while Distancias(mu2,j)~=minimadis(1,mu2)
        j=j+1;
    end
    clasif=j;
    if (XC(clasif,n+1)==XC(mu2,n+1))
        bien=bien+1;
    end

    performance = bien*100/p;
    sprintf('El clasificador obtuvo: %d buenas',bien)
    sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
    sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performance)
    bientotal=bientotal+bien;
end

performancetotal = bientotal*100/(p*p);
sprintf('Total de aciertos = %d',bientotal)
sprintf('\n\n\t\tEl performance total es de %0.4f%%',performancetotal)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performancetotal)