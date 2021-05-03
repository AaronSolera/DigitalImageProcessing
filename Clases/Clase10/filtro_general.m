function I = filtro_general(A, text)
    % A en 8 bits
    % I en 8 bits
    if text == 'promedio'
        B = (1/9) * ones(3,3);
    elseif text == 'gaussiano'
        B = (1/16) * [1 2 1; 2 4 2; 1 2 1];
    elseif text == 'gaussiano5'
        B = (1/256) * [1 2 64 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 7];    
    elseif text  == 'l' % l de Laplace
        B = [1 1 1; 1 -8 1; 1 1 1]
    end
        A = im2double(A);
        C = conv2(A, B, 'same');
        I = im2uint8(C);
end