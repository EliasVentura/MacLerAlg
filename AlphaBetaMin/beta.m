function z = beta(x, y)
%  Operacion BETA
%
%  Para definir la operacion BETA, se deben especificar los conjuntos:
%  A={0,1},B={0,1,2}
%  La operacion  BETA: B x A -> A, queda definida:
%  x | y | beta(x,y)
%  0 | 0 |     0
%  0 | 1 |     0
%  1 | 0 |     0
%  1 | 1 |     1
%  2 | 0 |     1
%  2 | 1 |     1
%   
%   
%
%   Class support for inputs x,y: 
%       x element of B={0,1,2}
%       y element of A={0,1}
%
%   See also alfa, alfamax, alfamin, betamax, betamin, sigmaalfa,
%   sigmabeta, alfagen

%   Alfa Operation Copyright: Cornelio Yanez, Ph.D
%   Written by: Antonio Alarcon

if x > 2 || y > 1
  error('MATLAB:beta: B x A -> A, donde A={0,1},B={0,1,2}');
end


if (x==0 && y==0)
    z=0;
elseif (x==0 && y==1)
    z=0;
elseif (x==1 && y==0)
    z=0;
elseif (x==1 && y==1)
    z=1;
elseif (x==2 && y==0)
    z=1;
elseif (x==2 && y==1)
    z=1;
end