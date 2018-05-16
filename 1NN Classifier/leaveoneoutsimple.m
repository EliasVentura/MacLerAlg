function leaveoneoutsimple(clase,p,n,X,Y)
%  Validación Leave-One-Out simple para el clasificador 1NN!
%
%  yw = leaveoneoutsimple(clase,p,n,X,Y)
%

    bien=0;
    dxx=0;

for mu2=1:1:p,
   %%CLASIFICACIÓN
	dist=zeros(p,1);
    mindist=inf;
    for mu=1:1:p,
        for j=1:1:n,
            dxx = power(abs(X(mu2,j)-Y(mu,j)),2);
            dist(mu) = dist(mu) + dxx;
        end
    end

	for mu=1:1:p,
		if (mu2~=mu)
            if (dist(mu) <= mindist)
                mindist=dist(mu);
			end
		end
    end

    mu=1;
    while dist(mu)~=mindist
        mu=mu+1;
    end
    if (clase(mu)==clase(mu2))
        bien=bien+1;
    end

end

performance = bien*100/p;
sprintf('El clasificador obtuvo: %d buenas',bien)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performance)