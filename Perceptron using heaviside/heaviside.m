function H=heaviside(x)
%  C�lculo de la funci�n de Heaviside!
%
%  H=heaviside(x)
%

if(x >= 0)
    H=1;
else
    H=0;
end