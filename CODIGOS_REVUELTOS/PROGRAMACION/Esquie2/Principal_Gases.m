close all;
clear all;
clc

menu1();
opcion=input('Por Favor Seleccione una Opción: ');
r=0.08314;

switch opcion
    case 1
        close all;
        clear all;
        clc
        
        Crear_Gases();
        Principal_Gases();
    case 2
        close all;
        clear all;
        clc
        
        disp('Obtener Volumen Molar');
        [existe, datos,donde]=Leer_Gases();
        if existe==1
            %continua
            info=datos(donde);
            A = textscan( info, '%s', 'Delimiter',',' );
            ng=A{1}{1};
            fg=A{1}{2};
            tt=A{1}{3};
            pp=A{1}{4};
            t=str2num(A{1}{3});
            p=str2num(A{1}{4});
            w=str2num(A{1}{5});
            clc
            disp('Entrada de Datos Solicitada');
            nombre=input('Ingrese la Temperatura del Gas en °K: ' ,'s');
            formula=input('La Presión en Bar: ', 's');
            x=str2num(nombre);
            y=str2num(formula);
            Tr=t/x;
            Pr=p/y;
            
            clc;
            disp('RESULTADOS');
            fprintf('Tr= T/Tc = %f', Tr);
            fprintf('\nPr= P/Pc =  %f', Pr);
            disp(' ');
            
            clc;
            disp('Ubicación de Tr y Pr en la Carta Generalizada');
            disp('1-. Primera Correlación (desv. >2%)');
            disp('2-. Segunda Correlación (desv. <2%)');
            disp('3-. Regresar al Menu Principal');
            opcion2=input('Por Favor Seleccione una Opción: ');
            switch opcion2
                case 1
                    clc;
                    disp('Entrada de Datos Solicitada');
                    x2=input('Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: ' ,'s');
                    x2=str2num(x2);
                    r=0.08314;
                    V=(x2*r*Tr)/Pr;
                    V2=num2str(V);
                    
                    clc;
                    disp('RESULTADOS FINALES');
                    fprintf('Nombre del Gas = %s', ng);
                    fprintf('\nFórmula del Gas = %s', fg);
                    fprintf('\nTemperatura = %s', tt);
                    fprintf('\nPresión = %s', pp);
                    fprintf('\nVolumén Molar = %s', V2);
                    disp(' ');
                    input('Por favor, par Continuar de un click' ,'s');
                    Principal_Gases();
                case 2
                    clc;
                    %disp('Entrada de Datos Solicitada');
                    B0=0.083-(0.422/(Tr^1.6));
                    Z0=1+(B0*Pr/(Tr^1.6));
                    B1=0.139-(0.172/(Tr^4.2));
                    Z1=((B1*Pr)/Tr);
                    ZZ=Z0+w*Z1;
                    
                    disp('RESULTADOS');
                    fprintf('BO=0.083-(0.422/(Tr^1.6)) = %f', B0);
                    fprintf('\nZ0=1+(B0*Pr/(Tr^1.6)) = %f', Z0);
                    fprintf('\nB1=0.139-(0.172/(Tr^4.2)) %f', B1);
                    fprintf('\nZ1=((B1*Pr)/Tr) %f', Z1);
                    fprintf('\nZZ=Z0+w*Z1 = %f', ZZ);
                    disp(' ');
                    input('Por favor, par Continuar de un click' ,'s');
                    r=0.08314;
                    V3=(ZZ*r*Tr)/Pr;
                    V4=num2str(V3);
                    
                    clc;
                    disp('RESULTADOS FINALES');
                    fprintf('Nombre del Gas = %s', ng);
                    fprintf('\nFórmula del Gas = %s', fg);
                    fprintf('\nTemperatura = %s', tt);
                    fprintf('\nPresión = %s', pp);
                    fprintf('\nVolumén Molar = %s', V4);
                    disp(' ');
                    input('Por favor, par Continuar de un click' ,'s');
                    Principal_Gases();
                case 3
                    clc;
                                       
                    Principal_Gases();
                otherwise
                    disp('other value')
            end
        else
            %crea gas
            disp('El gas que solicito no existe, porfavor cree uno nuevo');
            Crear_Gases();
        end
    case 3
        close all;
        clear all;
        clc
        
        disp('Obtener Volumen Molar');
        [existe, datos ,donde]=Leer_Gases();
        if existe==1
            %continua
            info=datos(donde);
            A = textscan( info, '%s', 'Delimiter',',' );
            ng=A{1}{1};
            fg=A{1}{2};
            tt=A{1}{3};
            pp=A{1}{4};
            t=str2num(A{1}{3});
            p=str2num(A{1}{4});
            w=str2num(A{1}{5});
            clc;
            disp('Entrada de Datos Solicitada');
            nombre3=input('Ingrese la Temperatura del Gas en °K: ' ,'s');
            formula3=input('Volumen Molar en m^3/kmol: ', 's');
            kk=str2num(nombre3);
            vv=str2num(formula3);
            r=0.08314;
            VPr=vv/r*t/p;
            Tr=t/kk;

            Vpr2=num2str(VPr);
            Tr2=num2str(Tr);

            clc;
            disp('RESULTADOS');
            fprintf('Nombre del Gas = %s', ng);
            fprintf('\nFórmula del Gas = %s', fg);
            fprintf('\nVolumén Molar Pseudoreducido = %s', Vpr2);
            fprintf('\nTr = %f', Tr2);
            disp(' ');
            input('Por favor, par Continuar de un click' ,'s');

            clc;
            disp('Entrada de Datos Solicitada');
            x4=input('Por favor, Introduzca el Valor del Factor de Compresibilidad Z Ubicada en la Carta Generalizada: ' ,'s');
            x4=str2num(x4);
            r=0.08314;
            Ppo=x4*r*kk/vv;
            Ppo2=num2str(Ppo);

            clc;
            disp('RESULTADOS FINALES');
            fprintf('Presión = %s', Ppo2);
            disp(' ');
            input('Por favor, par Continuar de un click' ,'s');
            Principal_Gases();
                    
        else
            %crea gas
            disp('El gas que solicito no existe, porfavor cree uno nuevo');
            Crear_Gases();
        end
    case 4
        disp('Salir');
        close();
    otherwise
        disp('Valor Invalido')
        close all;
        clear all;
        clc
        Principal_Gases();
end

%funciones
function menu1()
disp('Obtención del Volumen Molar y Presión');
disp('1-. Crear Nuevo Archivo de Gases');
disp('2-. Obtener Volumen Molar');
disp('3-. Obtener Presión');
disp('4-. Salir');
end
