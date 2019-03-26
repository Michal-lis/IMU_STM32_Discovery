function [xk1, vk1, Ck1] =INS_Posicion_0(W, fb, Ck, xk, vk, dt)
% Calcula la posici�n a partir de los datos del IMU utilizando
% matriz de cosenos.
% Versi�n 0: La m�s simple y todo en la funci�n
% [xk1, vk1, Ck1] =INS_Posicion(W, fb, Ck, xk, vk, dt)
% Input
%    W : Vector con la velocidad angular
%    fb : Vector con la fuerza especifica
%    Ck : actitud anterior (matriz de cosenos)
%    xk : vector con la posici�n anterior
%    vk : vector con la velocidad anterior
%    dt : Periodo
% Retorno
%    xk1 : Vector Posici�n X,Y,Z (en metros) relativa a la posici�n inicial
%    vk1 : Vector velocidad
%    Ck1 : Matriz de cosenos actualizada

g = 9.81;
G = [0, 0, g];

% Se actualiza la matriz de cosenos
sigma = W*dt;
Ck1 = Ck*(eye(3)+skewmatrix(sigma));

% Integramos fb para obtener velocidad y resolvemos en marco navegaci�n 
un = Ck1*fb'*dt*g;

% Primero se obtiene la velocidad
vk1 = vk + un' + G*dt;

% Integramos para obtener posici�n (trapezoidal)
xk1 = xk + (vk+vk1)/2*dt;


end