clear all;
clc

syms x;
f=input('Digite la función a integrar= ');
F=inline(char(f));
a=input('Desde=');
b=input('Hasta=');
F=int(f,a,b)