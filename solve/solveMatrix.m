function solveMatrix(matrix)
    %SOLVEMATRIX 此处显示有关此函数的摘要
    fid = fopen('origin.txt', 'w');
    for i = 1 : 9
        for j = 1 : 9
            fprintf(fid, '%d ', matrix(i, j));
        end  
        fprintf(fid,'\n');
    end
    drawdata(matrix,true, 1, 2);
    error=0;
    solve(matrix, 1);
    %   此处显示详细说明
end

