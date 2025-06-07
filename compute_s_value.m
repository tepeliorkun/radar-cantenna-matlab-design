function S = compute_s_value(a, lambda0, R)
    % S parametresi: açıklık çapı, serbest uzay dalga boyu ve slant radius ile hesaplanır
    S = (a^2) / (2 * lambda0 * R);
end
