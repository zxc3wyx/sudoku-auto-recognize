function solveMatrix(matrix)
    %SOLVEMATRIX �˴���ʾ�йش˺�����ժҪ
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
    %   �˴���ʾ��ϸ˵��
end

