%%%%%%%PARTE 1%%%%%%%%%%%%

%primero se definen las funciones de transferencias, las cuales
%siguen siempre el formato: a/(bs + c), siendo el vector [a b c].

funcionT1 = [4 1 5];
funcionT2 = [2 1 1];

[A, B, C, D] = transferenciaModelo(funcionT1, funcionT2);