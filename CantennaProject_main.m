% Ana Cantenna Analiz Dosyası
clc; clear; close all;

% Parametreleri al
params = fmcw_radar_antenna_params();

% TE11 / TM01 cutoff frekansları
cutoff = mode_cutoff(params.c, params.r, params.r_11, params.r_01);

% Optimum yarıçapı bul
best = optimum_radius(params, cutoff);
a = params.r(best);  % En iyi yarıçap

% Dalga kılavuzu parametrelerini hesapla
wave = waveguide_params(params.f, params.c, a, params.r_11);

% Slant radius ve S parametresi
R = compute_slant_radius(wave.lambda_g, a);
S = compute_s_value(a, wave.lambda0, R);

% Beamwidth hesapla
[BW_e, BW_h] = compute_beamwidths(wave.lambda0, a);

% Gain hesapla
G = compute_gain(a, wave.lambda0);

% Phase center konumları
[Lpc_H, Lpc_E] = phase_radius(R);

%% Grafikler ve çıktılar

% TE11 ve TM01 cutoff frekansları grafiği
figure;
plot(params.r * 1e3, cutoff.te11 / 1e9, 'b-', 'LineWidth', 2); hold on;
plot(params.r * 1e3, cutoff.tm01 / 1e9, 'r-', 'LineWidth', 2);
yline(params.f / 1e9, 'k--', 'LineWidth', 2);
xlabel('Yarıçap (mm)');
ylabel('Kesim Frekansı (GHz)');
legend('TE_{11}', 'TM_{01}', 'Çalışma Frekansı');
title('Modlara Göre Kesim Frekansı');
grid on;
xlim([32 50]);
ylim([1.5 3]);

% Sayısal sonuçlar
fprintf('\n--- Optimum Anten Parametreleri ---\n');
fprintf('Optimum yarıçap: %.2f mm\n', a * 1e3);
fprintf('TE11 cutoff: %.2f MHz\n', cutoff.te11(best)/1e6);
fprintf('TM01 cutoff: %.2f MHz\n', cutoff.tm01(best)/1e6);
fprintf('lambda_0: %.2f mm\n', wave.lambda0 * 1e3);
fprintf('lambda_g: %.2f mm\n', wave.lambda_g * 1e3);
fprintf('Prob mesafesi: %.2f mm\n', wave.probe_pos * 1e3);
fprintf('Monopole uzunluğu: %.2f mm\n', wave.monopole_length * 1e3);
fprintf('Slant radius: %.2f mm\n', R * 1e3);
fprintf('S parametresi: %.3f\n', S);
fprintf('E-plane beamwidth: %.2f derece\n', BW_e);
fprintf('H-plane beamwidth: %.2f derece\n', BW_h);
fprintf('Anten kazancı: %.2f dB\n', G);
fprintf('H-plane phase center: %.2f mm\n', Lpc_H * 1e3);
fprintf('E-plane phase center: %.2f mm\n', Lpc_E * 1e3);
% Toolbox ile fiziksel anten modeli oluştur
antenna = waveguideCircular( ...
    'Radius', a * 1.134, ...
    'Height', wave.lambda_g *0.98, ...
    'FeedOffset', (wave.probe_pos - Lpc_E) *0.93, ...
    'FeedHeight', wave.monopole_length * 0.95);

figure;
show(antenna);
title('Waveguide Circular Antenna');

% S11 (Return Loss) grafiği
freq_range = linspace(2.03e9, 2.63e9, 200);
s = sparameters(antenna, freq_range);
figure;
rfplot(s, 1, 1);
title('|S_{11}| (Return Loss)');
grid on;

% Empedans grafiği
figure;
impedance(antenna, freq_range);
title('Antenna Impedance (Ohms)');

% Işınım paternleri
figure;
pattern(antenna, params.f);
title('3D Radiation Pattern');

figure;
patternElevation(antenna, params.f, 0);
title('E-plane Elevation Pattern');

figure;
patternAzimuth(antenna, params.f, 0);
title('H-plane Azimuth Pattern');

