function alfabetaautomin
%Memorias Autoasociativas Alfa-Beta Min!

clc
op=7;
while op~=6
clc
disp('Memorias Autoasociativas Alfa-Beta Min')
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
% % db='irisbinc2.data';
% db='SPECT.csv';
% % db='poBINall.txt';
% XC=load(db);
% p=length(XC(:,1));
% n=length(XC(1,:))-1;
% clases=max(XC(:,n+1));
% format short g, X(:,1:n)=XC(:,1:n)
% clear XC;
% 
% % Y=X
% X
% m=n;
% 
% sprintf('Clases: %d',clases)
% sprintf('Patrones: %d',p)
clc
archivo='E.bmp';
nombre=length(archivo);
formato=archivo(nombre-2:nombre);
ymu=imread(archivo,formato);
ymu=single(ymu);
ymu=ymu/255;
format short g, ymu;

[y,x]=size(ymu);
p=8;
mem=length(ymu(1,:))/4;
n=8;
m=8;

sprintf('Patrones de salida:\n')
ymu
sprintf('Patrones: %d',p)
sprintf('Memorias = %d',mem)

xmu=eye(8)
ymu1=ymu(1:8,1:8)
ymu2=ymu(1:8,9:16)
ymu3=ymu(9:16,1:8)
ymu4=ymu(9:16,9:16)

figure;imshow(ymu)

input(' ');
%Fin de caso 1------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 2-------------------------------------------------------------------\
    case 2

%*************************************************************************%
%INICIA LA FASE DE APRENDIZAJE DE LA MEMORIA
%*************************************************************************%
% Memoria = aprendemax(p,n,m,X,Y)
Memoria1 = aprendemin(p,n,m,xmu,ymu1)
Memoria2 = aprendemin(p,n,m,xmu,ymu2)
Memoria3 = aprendemin(p,n,m,xmu,ymu3)
Memoria4 = aprendemin(p,n,m,xmu,ymu4)

Memoria = [Memoria1 Memoria2;Memoria3 Memoria4]
figure;imshow(Memoria)

input(' ');
%Fin de caso 2------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 3-------------------------------------------------------------------\
    case 3

%*************************************************************************%
%RECUPERACION DEL CONJUNTO FUNDAMENTAL
%*************************************************************************%
% bien=0;
% yw = recuperamax(p,n,m,Memoria,X);
yw1 = recuperamax(p,n,m,Memoria1,xmu);
yw2 = recuperamax(p,n,m,Memoria2,xmu);
yw3 = recuperamax(p,n,m,Memoria3,xmu);
yw4 = recuperamax(p,n,m,Memoria4,xmu);

yw = [yw1 yw2;yw3 yw4]
figure;imshow(yw)

% for mu=1:1:p,
% %     if(yw(mu,:)==Y(mu,:))
%     if(yw(mu,:)==X(mu,:))
%         bien=bien+1;
%     end
% end
% 
% performance = bien*100/p;
% sprintf('El clasificador obtuvo: %d buenas',bien)
% sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
% sprintf('\n\n\t\tEl factor de olvido es de %0.4f%%',100-performance)
% clear yw;

input(' ');
%Fin de caso 3------------------------------------------------------------/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Caso 4-------------------------------------------------------------------\
    case 4

%*************************************************************************%
%MÉTODO LEAVE-ONE-OUT SIMPLE
%*************************************************************************%
bien=0;
yw=-inf(p,m);
for mu2=1:1:p,
    
    %%APRENDIZAJE
%     NMemoria = aprendemaxloo(p,n,m,mu2,X,Y);
    NMemoria = aprendeminloo(p,n,m,mu2,X,X);

   %%RECUPERACIÓN       
    yw(mu2,:) = recuperamaxloos(p,n,m,NMemoria,X(mu2,:));
%     if(yw(mu2,:)==Y(mu2,:))
    if(yw(mu2,:)==X(mu2,:))
        bien=bien+1;
    end

end

performance = bien*100/p;
sprintf('El clasificador obtuvo: %d buenas',bien)
sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
sprintf('\n\n\t\tEl error es de %0.4f%%',100-performance)
clear yw;

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

    bien=0;
    %%APRENDIZAJE
%     NMemoria = aprendemaxloo(p,n,m,mu2,X,Y);
    NMemoria = aprendeminloo(p,n,m,mu2,X,X);

    %%RECUPERACIÓN
    yw = recuperamax(p,n,m,NMemoria,X);

    for mu=1:1:p,
%         if(yw(mu,:)==Y(mu,:))
        if(yw(mu,:)==X(mu,:))
            bien=bien+1;
        end
    end

    performance = bien*100/p;
    sprintf('El clasificador obtuvo: %d buenas',bien)
    sprintf('\n\n\t\tEl performance es de %0.4f%%',performance)
    sprintf('\n\n\t\tEl error es de %0.4f%%',100-performance)
    bientotal=bientotal+bien;
end
performancetotal = bientotal*100/(p*p);
sprintf('Total de aciertos = %d',bientotal)
sprintf('\n\n\t\tEl performance total es de %0.4f%%',performancetotal)
sprintf('\n\n\t\tEl error total es de %0.4f%%',100-performancetotal)

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