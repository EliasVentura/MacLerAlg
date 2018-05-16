function unonn
%Clasificador k Nearest Neighbour, k=1 (1NN)!

clc
op=6;
while op~=5
clc
disp('Clasificador 1NN (1 Nearest Neighbour)')
disp(' ')
disp(' ')
disp(' ')
disp('[1] Cargar base de datos')
disp('[2] Clasificación del conjunto fundamental completo')
disp('[3] Método de validación leave-one-out simple')
disp('[4] Método de validación leave-one-out completo')
disp('[5] Salir')
    
    
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
db='irisc.data';
XC=load(db);
p=length(XC(:,1));
n=length(XC(1,:))-1;
clases=max(XC(:,n+1));
format short g, X(:,1:n)=XC(:,1:n)
clase=XC(:,n+1);

sprintf('Clases: %d',clases)
sprintf('Patrones: %d',p)
sprintf('n = %d',n)

input(' ');
%Fin de caso 1------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 2-------------------------------------------------------------------\
    case 2

%*************************************************************************%
%CLASIFICACIÓN DEL CONJUNTO FUNDAMENTAL
%*************************************************************************%
Distancias = distancias(p,n,X,X);
bien=0;

for mu=1:1:p,
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
sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performance)

input(' ');
%Fin de caso 2------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 3-------------------------------------------------------------------\
    case 3

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT SIMPLE
%*************************************************************************%
leaveoneoutsimple(clase,p,n,X,X);

input(' ');
% %Fin de caso 3------------------------------------------------------------/



%Caso 4-------------------------------------------------------------------\
    case 4

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT COMPLETO
%*************************************************************************%
leaveoneoutcompleto(clase,p,n,X,X);

input(' ');
%Fin de caso 4------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 5-------------------------------------------------------------------\
    case 5
    close
    disp(' ')
    disp('Reconocimiento de Patrones')
    disp('Elias Jesus Ventura Molina DCC-CIC')
%Fin de caso 5------------------------------------------------------------/
    
    otherwise
    disp(' ')
    disp('Elija una opción del 1 al 6.')
    input(' ');
end
end