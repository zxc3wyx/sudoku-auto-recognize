function[i_isok]= check_i(matrix,i,num)
i_isok = true;
A = ones(1,9);
A = A .* num;
B = matrix(i,:);
C = A-B;
v = find(C==0);
if size(v,2)~=0
    i_isok = false;
end
