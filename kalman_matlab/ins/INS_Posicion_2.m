function [xk1, pk1, vk1,  Ck1] =INS_Posicion_2(W, fb, Ck, xk, pk, V, dt, i)
% Calcula la posici�n a partir de los datos del IMU utilizando
% matriz de cosenos.
% Versi�n 1: Usando las funciones:
%  Matriz de cosenos, orden 4, Normalizado y correcci�n de rotaci�n
%  e integraci�n trapezoidal y correcci�n de coriolis
%  [xk1, vk1, Ck1] =INS_Posicion_1(W, fb, Ck, xk, vk, dt)
% Input
%    W : Vector con la velocidad angular
%    fb : Vector con la fuerza especifica
%    Ck : actitud anterior (matriz de cosenos)
%    xk : vector con la posici�n anterior
%    pk : vector con la posici�n geogr�fica  (Longitud (grados), latitud
%           (grados), altura)
%    V  : matriz con los vectores de velocidad anterior
%    dt : Periodo
%    i  : iteraci�n actual
% Retorno
%    xk1 : Vector Posici�n X,Y,Z (en metros) relativa a la posici�n inicial
%    pk1 : vector posici�n geogr�fica (Longitud (grados), latitud (grados),
%           altura)
%    vk1 : Vector velocidad
%    Ck1 : Matriz de cosenos actualizada
gl = INS_Gravedad_Local(pk(1), pk(3));

Ck1= INS_Actitud_DCM_3(W, Ck, pk, V(i,:), dt, 4);
un = INS_Resolucionf(Ck1, fb, W, dt, gl);
[vk1, xk1, pk1] = INS_Navegacion_2(un', V, xk, pk, dt, i, 2, gl);

end