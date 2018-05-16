function hopfield
%Memoria Asociativa de Hopfield!

clc
op=7;
while op~=6
clc
disp('Memoria Asociativa de Hopfield')
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
db='irisbinc.data';
% db='ejemplo1.data';
XC=load(db);
p=length(XC(:,1));
n=length(XC(1,:))-1;

clases=max(XC(:,n+1));
format short g, X(:,1:n)=XC(:,1:n)
clase=XC(:,n+1);

m=n;

sprintf('Patrones: %d',p)
sprintf('n = m = %d',n)

input(' ');
%Fin de caso 1------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 2-------------------------------------------------------------------\
    case 2

%*************************************************************************%
%INICIA LA FASE DE APRENDIZAJE DE LA MEMORIA
%*************************************************************************%
Memoria = aprendizaje(p,n,m,X)

input(' ');
%Fin de caso 2------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 3-------------------------------------------------------------------\
    case 3

%*************************************************************************%
%RECUPERACION DEL CONJUNTO FUNDAMENTAL
%*************************************************************************%
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
sprintf('\n\n\t\tFactor de Olvido: %0.4f%%',100-performance)

input(' ');
%Fin de caso 3------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 4-------------------------------------------------------------------\
    case 4

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT SIMPLE
%*************************************************************************%
xtau = leaveoneoutsimple(p,n,m,Memoria,X)

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

input(' ');
% %Fin de caso 4------------------------------------------------------------/



%Caso 5-------------------------------------------------------------------\
    case 5

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT COMPLETO
%*************************************************************************%
xtau = leaveoneoutcompleto(p,n,m,Memoria,X)

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