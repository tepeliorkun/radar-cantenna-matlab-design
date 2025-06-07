function [BW_e, BW_h] = compute_beamwidths(lambda0, a)
    % Milligan kitabındaki katsayılara göre 3 dB ışınım açıları
    k_e = 1.6175;  % E-plane katsayısı
    k_h = 2.038;   % H-plane katsayısı

    % Açıları hesapla (derece cinsinden)
    BW_e = rad2deg(asin((k_e * lambda0) / (2 * pi * a)));
    BW_h = rad2deg(asin((k_h * lambda0) / (2 * pi * a)));
end
