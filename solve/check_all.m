function [all_isok] = check_all(matrix, i, j, num)
    all_isok = check_i(matrix, i,  num) && check_j(matrix,  j, num) &&  check_block(matrix, i, j, num);
end