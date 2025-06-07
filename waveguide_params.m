function wave = waveguide_params(f, c, a, r_11)
    % Dalga kılavuzu parametrelerini hesaplar (TE11 modu için)
    wave.lambda0 = c / f;                         % Serbest uzay dalga boyu
    wave.k0 = 2 * pi / wave.lambda0;              % Serbest uzay dalga sayısı
    wave.kc = r_11 / a;                           % Kesim dalga sayısı
    wave.beta = sqrt(wave.k0^2 - wave.kc^2);      % Faz sabiti
    wave.lambda_g = 2 * pi / wave.beta;           % Dalga kılavuzundaki dalga boyu
    wave.probe_pos = wave.lambda_g / 4;           % Prob yerleşim mesafesi 
    wave.monopole_length = wave.lambda0 / 4;      % Monopole uzunluğu 
end
