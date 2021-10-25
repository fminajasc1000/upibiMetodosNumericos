clc
clear all;
%ingreso de datos
sueldo_Bruto=input('Ingrese el sueldo Bruto: ');
limite_Inferior=0.0;
cuota_Fija=0.0;
porcentaje_excedente=0.0;
%Insiso a
if sueldo_Bruto>=0.01 & sueldo_Bruto<=2583.00
    fprintf('Categoria A\n');
    limite_Inferior=0.01;
    cuota_Fija=12.38;
    porcentaje_excedente=1.92;
    
elseif sueldo_Bruto>=2583.01 & sueldo_Bruto<=9614.66
    fprintf('Categoria B\n');
    limite_Inferior=2583.01;
    cuota_Fija=772.10;
    porcentaje_excedente=6.40;
    
elseif sueldo_Bruto>=9614.66 & sueldo_Bruto<=26988.50
    fprintf('Categoria C\n');
    limite_Inferior=9614.66;
    cuota_Fija=3323.58;
    porcentaje_excedente=10.88;
    
elseif sueldo_Bruto>=26988.50
    fprintf('Categoria D\n');
    limite_Inferior=26988.50;
    cuota_Fija=7980.73;
    porcentaje_excedente=16.00;
    
end
%Insiso B calculo del ISR
Isr = ((limite_Inferior - sueldo_Bruto)*(porcentaje_excedente))+cuota_Fija
%Insiso C percepcion efectiva
percepcion_efectiva=sueldo_Bruto-Isr