function matrix = recognition()

load net
%figure;
matrix = zeros(9);
for i=1:1:9
    for j=1:1:9
        pic = imresize(imread(strcat(num2str(i), '-', num2str(j), '.jpg')), [28 28]);
        pic1 = 255 - im2gray(pic);
        pic2 = ~im2bw(pic);
        if sum(sum(pic2)) <= 40
            continue;
        end
        matrix(i,j) = str2num(string(classify(net,pic1)));
        %subplot(9,9,(i-1)*9+j)
        %imshow(pic1);title(string(matrix(i,j)));
    end
end
end

