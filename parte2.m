
%%%%%%varables del modelo fenomenologico%%%%%%%%

%F1: Flujo de entrada y salida para el primer estanque 
%F2: Flujo de salida del segundo estanque 
%h1: Nivel de agua del primer estanque 
%h2: Nivel de agua del segundo estanque
%A1: Diametro del primer estanque
%A2: Diametro del segundo estanque

%como se tienen tantas variables de estado como acumuladores, se tienen dos
%variables de estado, por los dos estanques.

%variables de estado: h1 y h2 (x1, x2)
%variables de entrada: F1 (u)
%variables de salida: F2 (y)

%%%%%%ecuaciones del modelo%%%%%%%%%%%%%%

%volumen:
%V1 = A1 * h1
%V2 = A2 * h2

%conservacion de materia:

%dV1/dt = F1 - F1 = 0 %El estanque 1 no varia su nivel de agua
%reemplazando V1:
%d(A1*h1)/dt = F1 - F1 %A1 es constante
%dh1/dt = F1/A1 - F1/A1 = 0

%dV2/dt = F1 - F2
%reemplazando V2:
%d(A2*h2)/dt = F1 - F2 %A1 es constante
%dh2/dt = F1/A2 - F2/A2 

syms F1 F2 A1 A2 h1 h2 dh1 dh2;

%Ecuaciones de estado:
x1 = dh1 == F1/A1-F1/A1;
x2 = dh2 == F1/A2-F2/A2;

%ademas se tiene que la salida y del sistema corresponde a F2, pero como F2
%es igual al nivel de agua del estanque 2 se tiene:

y = F2 == h2;
% si se reemplaza esto en la ecuacion de estado:
x2 = subs(x2, F2, h2);

%ahora en forma de matriz:

%modelo de estado:
mEstado = [dh1;dh2] == [0 0; 0 -1/A2]*[h1;h2] + [0;1/A2]*F1;
%modelo de salida:
mSalida = [F2] == [0 1]*[h1;h2];

%mostrar por pantalla: 
disp('Modelo de estados:')
disp(mEstado)
disp('Modelo de salida:')
disp(mSalida)





