function leaveoneoutcompleto(maxepoca,clase,p,n,X)
%  Validación Leave-One-Out Completo para el perceptron!
%
%  leaveoneoutcompleto(maxepoca,clase,p,n,X)
%

buena=0;
bientotal=0;
error=0;
eta=1;

for mu2=1:1:p,

    W=zeros(n+1,1);
    epoca=0;
    bien=0;
    while bien~=p-1
        epoca=epoca+1;
        if (epoca <= maxepoca)
            bien=0;
            for mu=1:1:p,
                if (mu~=mu2)
                    error=clase(mu)-heaviside(X(mu,:)*W);
                    if (error ~= 0)
                        for i=1:1:n+1,
                            W(i) = W(i) + (eta * error * X(mu,i));
                        end
                        W;
                    else
                        bien=bien+1;
                    end
                end
            end
        else
            sprintf('El Perceptron no ha llegado a convergencia después de %d Épocas',epoca-1)
            break;
        end
    end
    bientotal=bientotal+bien;
    
    yw=heaviside(X(mu2,:)*W);
    if (yw == clase(mu2))
        buena=buena+1;
        bientotal=bientotal+1;
    end

performance = buena*100/p;
sprintf('El perceptron obtuvo: %d buenas',buena)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performance)

end

performancetotal = bientotal*100/(p*p);
sprintf('Total de aciertos = %d',bientotal)
sprintf('\n\n\t\tEl performance total es de %0.4f%%',performancetotal)
sprintf('\n\n\t\tPorcentaje de error: %0.4f%%',100-performancetotal)