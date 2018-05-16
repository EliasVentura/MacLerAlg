function z = dmij(x,y)
%  Operacion de aprendizaje de Lernmatrix
%
%  La operacion se define como:
%  x | y | dmij(x,y)
%  0 | 0 |     0
%  0 | 1 |     -e, -1
%  1 | 0 |     0
%  1 | 1 |     +e, +1
%
%

if x > 1 || y > 1
  error('MATLAB: La operación sólo está definida para valores binarios');
end


if (x==0 && y==0)
    z=0;
elseif (x==0 && y==1)
    z=-1;
elseif (x==1 && y==0)
    z=0;
elseif (x==1 && y==1)
    z=1;
end