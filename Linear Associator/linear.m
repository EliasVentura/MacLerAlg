function linear
%Linear Associator de Anderson-Kohonen!

clc
op=7;
while op~=6
clc
disp('Linear Associator de Anderson-Kohonen')
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
db='irisc.data';
XC=load(db);
p=length(XC(:,1));
n=length(XC(1,:))-1;

clases=max(XC(:,n+1));
format short g, X(:,1:n)=XC(:,1:n)
clase=XC(:,n+1);

Y=X;
m=length(Y(1,:));

sprintf('Clases: %d',clases)
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
Memoria = aprendizaje(p,n,m,X,Y)

input(' ');
%Fin de caso 2------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 3-------------------------------------------------------------------\
    case 3

%*************************************************************************%
%RECUPERACION DEL CONJUNTO FUNDAMENTAL
%*************************************************************************%
yw = recuperacion(p,n,m,Memoria,Y)
Distancias = distancias(p,n,yw,X)
bien=0;

for mu=1:1:p,
    minimadis(1,mu)=min(Distancias(mu,:));
end
minimadis

for mu=1:1:p,
    j=1;
    while Distancias(mu,j)~=minimadis(1,mu)
        j=j+1;
    end
    clasif=j;
    if (XC(clasif,n+1)==XC(mu,n+1))
        bien=bien+1;
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
yw = leaveoneoutsimple(XC,p,n,m,X,Y);

input(' ');
% %Fin de caso 4------------------------------------------------------------/



%Caso 5-------------------------------------------------------------------\
    case 5

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT COMPLETO
%*************************************************************************%
yw = leaveoneoutcompleto(XC,p,n,m,X,Y);

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