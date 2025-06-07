function params = fmcw_radar_antenna_params()
    params.c = 3e8;           % Işık hızı (m/s)
    params.f = 2.5e9;         % Çalışma frekansı (Hz)
    params.r_11 = 1.841;      % TE11 modu için Bessel kökü
    params.r_01 = 2.405;      % TM01 modu için Bessel kökü
    params.r = linspace(32e-3, 50e-3, 18);  % Yarıçap aralığı
    params.md = 16e-4;        % SMA deliği (monopole deliği) çapı
end
