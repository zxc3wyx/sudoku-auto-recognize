function[j_isok]= check_j(matrix,j,num)
j_isok = true;
A = ones(9,1);
A = A .* num;
B = matrix(:,j);
C = A - B;
v = find(C==0);
if size(v,1)~=0
    j_isok = false;
end
