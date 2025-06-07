function G = compute_gain(a, lambda0)
    % Açıklık verimi (ATL/PEL): yaklaşık 0.8 dB kayıp(Milligan)
    ATL_PEL_dB = 0.8;  

    D = 2 * a;  % Açıklık çapı
    G = 20 * log10(pi * D / lambda0) - ATL_PEL_dB;
end
