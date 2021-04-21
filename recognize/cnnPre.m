function cnnPre()
% pre for data
img_train = loadMNISTImages('train-images.idx3-ubyte');
label_train = loadMNISTLabels('train-labels.idx1-ubyte');
img_test = loadMNISTImages('t10k-images.idx3-ubyte');
label_test = loadMNISTLabels('t10k-labels.idx1-ubyte');
mkdir('train');
mkdir('test');
for i=0:9
    mkdir(strcat('train\train',num2str(i)));
end
for i=0:9
    mkdir(strcat('test\test',num2str(i)));
end
for i=1:60000
    img=reshape(img_train(:,i),28,28);
    imwrite(img,strcat('D:\matlab\new\train\train',num2str(label_train(i)),'\',num2str(label_train(i)),'',num2str(i),'.jpg'));
end
for i=1:10000
    img=reshape(img_test(:,i),28,28);
    imwrite(img,strcat('D:\matlab\new\test\test',num2str(label_test(i)),'\',num2str(label_test(i)),'',num2str(i),'.jpg'));
end
end

