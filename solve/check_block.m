function[block_isok]= check_block(matrix,i,j,num)
 block_isok = true;
 block_i = floor( (i-1) / 3 ) + 1;%计算所在小九宫格的位置
 block_j = floor( (j-1) / 3 ) + 1;
    
 block_i_from = (block_i * 3) - 2;% 小九宫格的数字范围
 block_i_to = block_i * 3;
 block_j_from = (block_j * 3) - 2;
 block_j_to = block_j * 3;

 
 A = ones(3,3);
 A = A.*num;
 B = matrix(block_i_from:block_i_to,block_j_from:block_j_to);
 
 C = A-B;
 v = find(C==0);
 if size(v)~=0
    block_isok = false;
 end
 
 
end