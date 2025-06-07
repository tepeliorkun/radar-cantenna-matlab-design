function [Lpc_H, Lpc_E] = phase_radius(R)
    % Milligan tablosundaki oranlara göre phase center konumları
    Lpc_H = 0.0046 * R;  % H-plane phase center
    Lpc_E = 0.012  * R;  % E-plane phase center
end
