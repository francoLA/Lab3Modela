function[H] = funcionTransferencia(A,B,C,D)

%Aplicando la transformada de Laplace a las ecuaciones obtenidas
%anteriormente: sX = AX + BU
identidad = [1 0;0 1];
syms s

aux = s*identidad - A;
auxInv = inv(aux);
aux1 = C * auxInv;
%se obtiene la funcion de trasferencia H
H = aux1*B;


end