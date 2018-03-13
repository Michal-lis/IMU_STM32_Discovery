function D =INS_SimulaIMU(Tr, T)
% Simula la generaci�n de datos del IMU a partir de una trayectorio dada.
% P =INS_Posicion(D, U, i)
% Input
%    Tr : Trayectoria definida por tramos
%          Tr(i).F : Vector con la fuerza especifica (aceleraci�n)
%          Tr(i).W : Vector con la velocidad angular
%          Tr(i).T : Duraci�n de este tramo.
%    T : Periodo.
% Retorno
%    D : Valor de los sensores
%          D(i).F : Vector con la fuerza especifica (aceleraci�n)
%          D(i).W : Vector con la velocidad angular
%          D(i).T : Tiempo de la muestra

Ttotal = 0;
TamTr = length(Tr);
for i = 1:TamTr
    Ttotal = Ttotal + Tr(i).T;
end
Elementos = Ttotal/T;

j = 1;
tAnt = 0;
for i = 1:Elementos
    t = i*T;
    if j+1 <= TamTr & Tr(j).T < t - tAnt
        j = j + 1;  % Se cambia de elemento j.
        tAnt = t;
    end
    D(i).F = Tr(j).F;
    D(i).W = Tr(j).W;
    D(i).T = t;
    
end


end