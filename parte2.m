
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

%mostrar por pantalla: 
disp('Modelo de estados:')
pretty(x1);
pretty(x2);
disp('Modelo de salida:')
pretty(y);

%Ejemplo 1:
disp('EJEMPLO 1:');
disp('Valores:');
disp('Flujo  = 70 m^(3)/s')
disp('Area de la superficie del segundo estanque = 10 m^{2}')
disp('Nivel de agua del segundo estanque = 35 m')
%variables de estado
ejemplo1x = subs(x2, {F1, A2, h2}, {70, 10, 35});
%salida
ejemplo1y = subs(y, h2, 35);

disp('El nivel de agua del estanque 2 varia a:');
disp(ejemplo1x);
disp('La salida obtuvo el valor de: ');
disp(ejemplo1y);

%Ejemplo 2:
disp('EJEMPLO 2:');
disp('Valores:');
disp('Flujo  = 120 m^(3)/s')
disp('Area de la superficie del segundo estanque = 15 m^{2}')
disp('Nivel de agua del segundo estanque = 20 m')
%variables de estado
ejemplo1x = subs(x2, {F1, A2, h2}, {120, 15, 20});
%salida
ejemplo1y = subs(y, h2, 20);

disp('El nivel de agua del estanque 2 varia a:');
disp(ejemplo1x);
disp('La salida obtuvo el valor de: ');
disp(ejemplo1y);

%Ejemplo 3: Ejercicio visto en la clase 17.
disp('EJEMPLO 3: clase 17');
%se debe agregar un flujo F0 inicial para el primer estanque y las valvulas
%reguladoras.

%datos:
syms F0 R1 R2 dx1 dx2 y;

auxF1 = F1 == (h1 - h2)/R1;
auxF2 = F2 == h2/R2;
auxA1 = A1 == 2;
auxA2 = A2 == 4;
auxR1 = R1 == 1/4;
auxR2 = R2 == 1/16;

%Variables de entrada: F0
%Variables de salida: F2
%Variables de estado: h1 y h2

%ecuaciones de estado:
x1 = F0/A1 - F1/A1;

x1 = subs(x1, {F1, A1}, {auxF1, auxA1}); 
x1 = dx1 == subs(x1, R1, auxR1);

x2 = F1/A2 - F2/A2;

x2 = subs(x2, {F1, F2, A2}, {auxF1, auxF2, auxA2});
x2 = dx2 == subs(x2, {R1, R2}, {auxR1, auxR2});
%ecuacion de salida:

y = F2;

y = subs(y, F2, auxF2);
y = subs(y, R2, auxR2);

disp('Modelo de estado');
disp('primera variable:');
pretty(x1);
disp('segunda variable:');
pretty(x2);
disp('Modelo de salida');
pretty(y);








