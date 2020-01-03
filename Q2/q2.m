s = '';
C = mat2cell(z, size(z,1)/96.*ones(96,1), 1);

for k=1:length(C)
    % Filtering the signal
    filteredS = SSBerouti79(C{k},500,0.12);
    
    zero_zero = corrcoef(filteredS,signal00);
    zero_one = corrcoef(filteredS,signal01);
    one_zero = corrcoef(filteredS,signal10);
    one_one = corrcoef(filteredS,signal11);

    coeZZ = zero_zero(1,2); coeZO = zero_one(1,2);
    coeOZ = one_zero(1,2); coeOO = one_one(1,2);

    [M,I] = max([coeZZ,coeZO,coeOZ,coeOO]);

    switch I
        case 1
            s = strcat(s,'00');
        case 2
            s = strcat(s,'01');
        case 3
            s = strcat(s,'10');
        otherwise
            s = strcat(s,'11');
    end
end

char(bin2dec(reshape(s,8,[]).').')