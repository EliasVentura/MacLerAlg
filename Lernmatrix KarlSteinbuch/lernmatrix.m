function lernmatrix
%Lernmatrix de Steinbuch!

clc
op=7;
while op~=6
clc
disp('Lernmatrix de Steinbuch')
disp(' ')
disp(' ')
disp(' ')
disp('[1] Cargar base de datos')
disp('[2] Realizar la fase de aprendizaje de la memoria')
disp('[3] Recuperación del conjunto fundamental completo')
disp('[4] Método de validación leave-one-out simple')
disp('[5] Método de validación leave-one-out completo')
disp('[6] Salir')
    
    
%Elegimos una opción del menú anterior.....................................
op=input('Elige una opción del menú: ');
%..........................................................................

%Switch para elegir...........................
switch op
%..........................................................................

    
%Caso 1-------------------------------------------------------------------\
    case 1

%*************************************************************************%
%CARGAMOS EL ARCHIVO DE BASE DE DATOS
%*************************************************************************%
db='irisbinc2.data';
XC=load(db);
p=length(XC);
n=length(XC(1,:))-1;
clases=max(XC(:,n+1));
format short g, X(:,1:n)=XC(:,1:n)

Y=zeros(p,clases);
for i=1:1:clases,
    for mu=1:1:p,
        if (XC(mu,n+1)==i)
            Y(mu,i)=1;
        end
    end
end
m=length(Y(1,:));

sprintf('Clases: %d',clases)
sprintf('Patrones: %d',p)

input(' ');
%Fin de caso 1------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 2-------------------------------------------------------------------\
    case 2

%*************************************************************************%
%INICIA LA FASE DE APRENDIZAJE DE LA MEMORIA
%*************************************************************************%
Memoria=aprendizaje(p,n,m,X,Y)

input(' ');
%Fin de caso 2------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 3-------------------------------------------------------------------\
    case 3

%*************************************************************************%
%RECUPERACION DEL CONJUNTO FUNDAMENTAL
%*************************************************************************%
bien=0;
yw = recuperacion(p,n,m,Memoria,X);

for mu=1:1:p,
    for i=1:1:m,
        if (sum(yw(:,mu))<2)
            if (yw(i,mu)==1)
                if(i==XC(mu,n+1))
                    bien=bien+1;
                end
            end
        end
    end
end

performance = bien*100/p;
sprintf('El clasificador obtuvo: %d buenas',bien)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performance)

input(' ');
%Fin de caso 3------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 4-------------------------------------------------------------------\
    case 4

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT SIMPLE
%*************************************************************************%
bien=0;
yw=zeros(p,m);
for mu2=1:1:p,
    
    %%APRENDIZAJE    
    for i=1:1:m,
        for j=1:1:n,
            mij(i,j)=dmij(X(mu2,j),Y(mu,i));
        end
    end
    NMemoria=Memoria-mij;
    

   %%RECUPERACIÓN       
    yw(mu2,:) = recuperacionloos(p,n,m,NMemoria,X(mu2,:));
    if(yw(mu2,:)==Y(mu2,:))
        bien=bien+1;
    end

end

performance = bien*100/p;
sprintf('El clasificador obtuvo: %d buenas',bien)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performance)

input(' ');
% %Fin de caso 4------------------------------------------------------------/



%Caso 5-------------------------------------------------------------------\
    case 5

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT COMPLETO
%*************************************************************************%
bientotal=0;
performancetotal=0;
for mu2=1:1:p,
    
    %%APRENDIZAJE
    sprintf('\n\n\t\tCorrida número: %d',mu2)
    yw=zeros(p,m);
    bien=0;
    for i=1:1:m,
        for j=1:1:n,
            mij(i,j)=dmij(X(mu2,j),Y(mu,i));
        end
    end
    NMemoria=Memoria-mij;


    %%RECUPERACIÓN
    yw = recuperacion(p,n,m,NMemoria,X);
    for mu=1:1:p,
        for i=1:1:m,
            if (sum(yw(:,mu))<2)
                if (yw(i,mu)==1)
                    if(i==XC(mu,n+1))
                        bien=bien+1;
                    end
                end
            end
        end
    end

    performance = bien*100/p;
    sprintf('El clasificador obtuvo: %d buenas',bien)
    sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
    sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performance)
    bientotal=bientotal+bien;
end
performancetotal = bientotal*100/(p*p);
sprintf('Total de aciertos = %d',bientotal)
sprintf('\n\n\t\tEl performance total es de %0.4f%%',performancetotal)
sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performancetotal)

input(' ');
%Fin de caso 5------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 6-------------------------------------------------------------------\
    case 6
    close
    disp(' ')
    disp('Reconocimiento de Patrones')
    disp('Elias Jesus Ventura Molina DCC-CIC')
%Fin de caso 6------------------------------------------------------------/
    
    otherwise
    disp(' ')
    disp('Elija una opción del 1 al 6.')
    input(' ');
end
end