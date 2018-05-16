function leaveoneoutcompleto(clase,p,n,X,Y)
%  Validación Leave-One-Out completo para el clasificador 1NN!
%
%  yw = leaveoneoutcompleto(clase,p,n,X,Y)
%

    dxx=0;
    bientotal=0;
    minimadis=inf(p,p);
    
for mu2=1:1:p,
   %%CLASIFICACIÓN
    bien=0;
    Distancias=inf(p);
	for mu=1:1:p,
		for j=1:1:p,
			if (mu2~=j)
				Distancias(mu,j)=deuclidiana(n,X(mu,:),X(j,:));
			end
		end
		minimadis(1,mu)=min(Distancias(mu,:));
	end
	
	for mu=1:1:p,
		j=1;
		while Distancias(mu,j)~=minimadis(1,mu)
			j=j+1;
		end
		if (clase(j)==clase(mu))
			bien=bien+1;
		end
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