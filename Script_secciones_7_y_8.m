%Se limpian las variables y la pantalla para evitar problemas
clear;
clc;
%--------------------------------------------------------------------------
%---------------------------------Sección 7--------------------------------
%--------------------------------------------------------------------------

s=tf('s');%Se declara s como una función de transferencia
g0=20;%Se declara g0 (ganancia del sistema) como 20
g1=(0.1)/(s); %Se declara la función de transferencia del motor
g2=(0.1)/(s+1); %Se declara la función de transferencia de la planta
h=(2)/(s+1); %Se declara la función de transferencia de realimentación

%Se imprime la gráfica de la respuesta a un escalón para la fución de
%transferencia directa
figure('Name', 'Respuesta a un escalón de la función de transferencia directa','NumberTitle', 'off'); %Figure para cambiar el nombre de la ventana
step(g0*g1*g2,10); %Se utiliza el step para imprimir la respuesta a un escalón
title('Respuesta a un escalón de la función de transferencia directa'); %Se utiliza title title para cambiar el titulo del gráfico


%Se imprime la gráfica de la respuesta a un escalón para la fución de
%transferencia de lazo cerrado
figure('Name', 'Respuesta a un escalón de la función de transferencia a lazo cerrado','NumberTitle', 'off');
step(((g0*g1*g2)/(1+g0*g1*g2*h)));
title('Respuesta a un escalón de la función de transferencia a lazo cerrado');


%Se imprime la gráfica de la respuesta a un impulso para la fución de
%transferencia directa
figure('Name', 'Respuesta a un impulso de la función de transferencia directa','NumberTitle', 'off');
impulse((g0*g1*g2)); %Se utiliza el comando impulse para gráficar la respuesta del sistema a un impulso unitario
title('Respuesta a un impulso de la función de transferencia directa');


%Se imprime la gráfica de la respuesta a un impulso para la fución de
%transferencia a lazo cerrado
figure('Name', 'Respuesta a un impulso de la función de transferencia a lazo cerrado','NumberTitle', 'off');
impulse(((g0*g1*g2)/(1+g0*g1*g2*h)));
title('Respuesta a un impulso de la función de transferencia a lazo cerrado');


%Se imprime la gráfica del lugar de las raices
figure('Name', 'Lugar de las raices','NumberTitle', 'off');
rlocus(g1*g2*h); %Se utiliza el comando rlocus para graficar el lugar de las raices del sistema
title('Lugar de las raices');


%--------------------------------------------------------------------------
%---------------------------------Sección 8--------------------------------
%--------------------------------------------------------------------------


%Sección de variables de estado
k = 20; %Se define la ganancia de 20
A = [0 0 -0.1*k; 0.1 -1 0; 0 2 -1]; %Se define la matriz A
B = [0.1*k; 0; 0]; %Se define la matriz B
C = [0 1 0]; %Se define la matriz C
D = 0; %Se define la matriz D
sistema = ss(A,B,C,D, 'Statename', {'x1','x2','x3'}); %Se define el espacio de estados con las matrices A B C D y las variables x1, x2, x3
[y, t, x] = step(sistema,25); %Se le carga un escalón al sistema planteado

%Se inicia un for para la impresión de las gráficas de las 3 variables
for i=1:3
  subplot(3,1,i); %Se realiza un subplot para cada gráfico
  plot(t, x(:,i));  %Se realiza introducen al plot general
  title(['Respuesta de la variable',' x',num2str(i), ' a un escalon unitario']); %Se le añade un titulo a cada subgráfico
end 



%Se sabe que para una ganancia de 100 el sistema se comporta de manera
%marginalmente estable por lo que se imprime la gráfica de la respuesta del
%sistema a un escalon unitario para una ganancia de 100
g0=100;
figure('Name', 'Respuesta del sistema a un escalon con una ganancia de 100','NumberTitle', 'off');
step(((g0*g1*g2)/(1+g0*g1*g2*h)),100);
title('Respuesta del sistema a un escalon con una ganancia de 100');


%Se sabe que para una ganancia de 20 el sistema se comporta de manera
%subamortiguada por lo que se imprime la gráfica de la respuesta del
%sistema a un escalon unitario para una ganancia de 20
g0=20;
figure('Name', 'Respuesta del sistema a un escalon con una ganancia de 20','NumberTitle', 'off');
step(((g0*g1*g2)/(1+g0*g1*g2*h)));
title('Respuesta del sistema a un escalon con una ganancia de 20');


%Se sabe que para una ganancia de 5 el sistema se comporta de manera
%sobreamortiguada por lo que se imprime la gráfica de la respuesta del
%sistema a un escalon unitario para una ganancia de 5
g0=5;
figure('Name', 'Respuesta del sistema a un escalon con una ganancia de 5','NumberTitle', 'off');
step(((g0*g1*g2)/(1+g0*g1*g2*h)));
title('Respuesta a un escalón de la función de transferencia a lazo cerrado');

%Se sabe que para una ganancia de mas de 100 el sistema se comporta de manera
%inestable por lo que se imprime la gráfica de la respuesta del
%sistema a un escalon unitario para una ganancia de 101
g0=101;
figure('Name', 'Respuesta del sistema a un escalon con una ganancia de 101','NumberTitle', 'off');
step(((g0*g1*g2)/(1+g0*g1*g2*h)),1000);
title('Respuesta del sistema a un escalon con una ganancia de 101');

%Se sabe que para una ganancia de aproximadamente 7.41 el sistema se comporta de manera
%criticamente amortiguada por lo que se imprime la gráfica de la respuesta del
%sistema a un escalon unitario para una ganancia de 7.41
g0=7.41;
figure('Name', 'Respuesta del sistema a un escalon con una ganancia de 7.41','NumberTitle', 'off');
step((g0*g1*g2)/(1+g0*g1*g2*h));
title('Respuesta del sistema a un escalon con una ganancia de 7.41');



