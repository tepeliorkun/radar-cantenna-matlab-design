function best = optimum_radius(params, cutoff)
    % TE11 modunun cutoff frekansı çalışma frekansının %20 altına inmeli
    % TM01 cutoff frekansı ise çalışma frekansından en az 100 MHz yukarıda olmalı
    
    min_diff = 100e6; % Minimum fark (Hz)
    f_te11_max = params.f / 1.2;
    f_work = params.f;

    % Uygun indeksleri bul
    best_valid = find(cutoff.te11 < f_te11_max & cutoff.tm01 > f_work + min_diff);

    % TE11 cutoff'u en düşük olanı seç
    [~, i] = min(cutoff.te11(best_valid));
    best = best_valid(i);
end
