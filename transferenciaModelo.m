function[A, B, C, D] = transferenciaModelo(funcionT1, funcionT2)

%inicializar matrices
A = zeros(2,2);
B = zeros(2,1);
C = zeros(1,2);
D = zeros(1,1);

%se deben despejar las variables de estado de las funciones de
%transferencia y dejarlas de la forma (s*x), para que al aplicar la
%transformada de laplace inversa queden solo las variables.

%funcion 1
A(1,1) = (-1)*(funcionT1(3)/funcionT1(2));
A(1,2) = (-1)*(funcionT1(1)/funcionT1(2));
B(1,1) = funcionT1(1)/funcionT1(2);

%funcion 2
A(2,1)=funcionT2(1)/funcionT2(2);
A(2,2)=(-1)*(funcionT2(3)/funcionT2(2));
B(2,1)=0; %este valor siempre es igual por la forma de la funcion.

%la salida siempre es la misma para este diagrama Y = x1.
C=[1 0];
D=0;

end