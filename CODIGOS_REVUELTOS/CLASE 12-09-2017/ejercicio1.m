A=[2,5,-7,4;8,9,10,9;0,-3,1,25];
B=[3,2;5,9;-1,8;0,7];
whos A B
A(2,2);
B(3,1);
A(1,1);
B(1,1);
A(7,2)=8;
a=A(3,:);%MANDA A LLAMAR A TODO EL RENGLON A DE LA MATRIZ A
b=B(:,2);%MANDA A LLAMAR TODA LA COLUMNA DE LA MATRIZ
%UN PEDAZO DE LA MATRIZ DE LA COLUMNA 2 A LA COLUMNA 3
A(:,2:3);
%RENGLONES QUE QUIERO
A=A(1:3,:);
A
size(A);
whos A
%--------------------------------------------------------------------------
format rat %notacion de numero racional
A(2,:)=A(2,:)/A(2,1);
%cambio de renglon
aux=A(1,:);
A(1,:)=A(2,:);
A(2,:)=aux;

%--------------------------------------------------------------------------

A(2,:)=A(2,:)-A(1,:)*A(2,1);
A;
%MULTIPLICACION ELEMENTO A ELEMENTO
% * -->MULTIPLICION MATRICIAL
% C(M.R)=A(M,N)*B(N,R)
A=[2,5,-7,4;8,9,10,9;0,-3,1,25];
B=[3,2;5,9;-1,8;0,7];
C=[5,-1;-6,0;4,8]
whos A, B
D=[A C];
D