function H=heaviside(x)
%  Cálculo de la función de Heaviside!
%
%  H=heaviside(x)
%

if(x >= 0)
    H=1;
else
    H=0;
end