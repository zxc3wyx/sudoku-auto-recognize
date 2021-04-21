function solve(matrix, index)
    if index > 81       % 已经找到解
        disp(matrix);
        draw(matrix, true, 1, 2);
    else 
        % 计算此index对应i、j
       i = floor((index - 1) / 9) + 1;
        j = mod((index-1), 9) + 1;
        
        if matrix(i, j) ~= 0    %不为0，是已知数，求解下一格
            solve(matrix, index+1);
        else                    % 为0，需要求解
            for num = 1 : 9                                % 穷举
                if check_all(matrix, i, j, num) == true    % 符合要求
                    matrix(i, j) = num;                    % 赋值
                    solve(matrix, index+1);                % 求解下一格
                end  
            end
        end
    end