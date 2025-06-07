function cutoff = mode_cutoff(c, r, r_11, r_01)
    % TE11 ve TM01 modlarının cutoff frekanslarını hesaplar
    cutoff.te11 = (r_11 * c) ./ (2 * pi * r);
    cutoff.tm01 = (r_01 * c) ./ (2 * pi * r);
end
