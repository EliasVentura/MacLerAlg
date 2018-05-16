function perceptron
%Perceptron de Frank Rosenblatt!

clc
op=6;
while op~=5
clc
disp('P E R C E P T R O N')
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
db='irisc1-3.data';
XC=load(db);
p=length(XC(:,1));
n=length(XC(1,:))-1;
clase=XC(:,n+1);
X=zeros(p,n+1);
W=zeros(n+1,1);
for mu=1:1:p,
    X(mu,1)=-1;
    for j=1:1:n,
        X(mu,j+1)=XC(mu,j);
    end
end
X
W
maxepoca=p*p

sprintf('Clases: 2')
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
bien=0;
error=0;
epoca=0;
eta=1;

while bien~=p
epoca=epoca+1;
sprintf('----------------Época: %d----------------',epoca)

    if (epoca <= maxepoca)
        bien=0;
        for mu=1:1:p,
            error=clase(mu)-heaviside(X(mu,:)*W);
            if (error ~= 0)
                for i=1:1:n+1,
                    W(i) = W(i) + (eta * error * X(mu,i));
                end
                W
            else
                bien=bien+1;
            end
        end
    else
        sprintf('El Perceptron no ha llegado a convergencia después de %d Épocas',epoca-1)
        break;
    end
end

performance = bien*100/p;
sprintf('----------------Convergencia en %d Épocas----------------',epoca)
sprintf('El perceptron obtuvo: %d buenas',bien)
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
leaveoneoutsimple(maxepoca,clase,p,n,X)

input(' ');
% %Fin de caso 3------------------------------------------------------------/



%Caso 4-------------------------------------------------------------------\
    case 4

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT COMPLETO
%*************************************************************************%
leaveoneoutcompleto(maxepoca,clase,p,n,X)

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