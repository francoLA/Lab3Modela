%%%%%%%PARTE 1%%%%%%%%%%%%

%primero se definen las funciones de transferencias, las cuales
%siguen siempre el formato: a/(bs + c), siendo el vector [a b c].
%ejemplo del informe: funcion 1 = [4 1 5]
%                     funcion 2 = [2 1 1]

funcionT1 = input("ingrese la funcion de transferencia 1: ");
funcionT2 = input("ingrese la funcion de transferencia 2: ");

[A, B, C, D] = transferenciaModelo(funcionT1, funcionT2);

H = funcionTransferencia(A, B, C, D);

disp('Resultado A:');
disp(A);
disp('Resultado B:');
disp(B);
disp('Resultado C:');
disp(C);
disp('Resultado D:');
disp(D);
disp('Funcion de transferencia total:');
pretty(H);