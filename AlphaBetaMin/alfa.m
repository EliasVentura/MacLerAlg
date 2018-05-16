function z = alfa(x, y)
%  Operacion ALFA
%
%  Para definir la operacion ALFA, se deben especificar los conjuntos:
%  A={0,1},B={0,1,2}
%  La operacion binaria ALFA: A x A -> B, queda definida:
%  x | y | alfa(x,y)
%  0 | 0 |     1
%  0 | 1 |     0
%  1 | 0 |     2
%  1 | 1 |     1
%   
%   
%
%   Class support for inputs x,y: 
%      only binary inputs.
%
%   See also beta, alfamax, alfamin, betamax, betamin, sigmaalfa,
%   sigmabeta, alfagen

%   Alfa Operation Copyright: Cornelio Yanez, Ph.D
%   Written by: Antonio Alarcon

if (x > 1 || y > 1)
  error('MATLAB:alfa: A x A -> B, donde A={0,1},B={0,1,2}');
end


if (x==0 && y==0)
    z=1;
elseif (x==0 && y==1)
    z=0;
elseif (x==1 && y==0)
    z=2;
elseif (x==1 && y==1)
    z=1;
end