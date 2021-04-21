function cnnTrain()
% cnn
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(4,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(3,'Stride',3)
    
    convolution2dLayer(4,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(3,'Stride',3)
    
    convolution2dLayer(4,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

imdsTrain = imageDatastore('train', ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
	
imdsValidation = imageDatastore('test', ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.05, ...
    'MaxEpochs',6, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

% train
net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);

% save the net
save net
end

