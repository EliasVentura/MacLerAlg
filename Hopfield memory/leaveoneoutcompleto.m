function xtau = leaveoneoutcompleto(p,n,m,Memoria,X)
%  Validación Leave-One-Out completo para la memoria Hopfield!
%
%  xtau = leaveoneoutcompleto(p,n,m,Memoria,X)
%

    bientotal=0;
    performancetotal=0;

for mu2=1:1:p,
    %%APRENDIZAJE
    sprintf('\n\n\t\tCorrida número: %d',mu2)
    mij=zeros(m,n);
    for i=1:1:m,
        for j=1:1:n,
            mij(i,j)=X(mu2,j)*X(mu2,i);
        end
    end
    mij=mij-eye(n);
    NMemoria=Memoria-mij

   %%RECUPERACIÓN
    xtau = recuperacion(p,n,m,Memoria,X)

    bien=0;
    for mu=1:1:p,
        if (xtau(mu,:)==X(mu,:))
            bien=bien+1;
        end
    end

    performance = bien*100/p;
    sprintf('La Memoria obtuvo: %d buenas',bien)
    sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
    sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performance)
    bientotal=bientotal+bien;
end

performancetotal = bientotal*100/(p*p);
sprintf('Total de aciertos = %d',bientotal)
sprintf('\n\n\t\tEl performance total es de %0.4f%%',performancetotal)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performancetotal)