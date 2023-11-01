%% does a basic decoding  (add decoding toolbox in functions folder
X =X%variable to decode
store = data % data to decode (trials x time x neurons).

cfg=[];
cfg.nFold=10; % 10 fold cross validation
folds=createFolds(cfg,X); % selects an equal number of trials of each orientation
index = 1:length(X);
avg = collapse(store,1:2);
store2=squeeze(store(:,: ,avg>.01)); % selects only neurons with lots of spikes

store2=filtfast(store2,2,[],'gaussian',5); % temporally filters the data
decode=zeros(size(store2,1),size(store2,2));
for ii=1:length(folds)
    
    testTrial = folds{ii}; % selects the trials which the classifier will be tested on
    trainTrial=~ismember(index,testTrial); % selects all other trials for training set
    trainDat = squeeze(store2(trainTrial,:,:)); % selects the data
    testDat = squeeze(store2(testTrial,:,:));
    decodeTemp=zeros(length(testTrial),size(store2,2));
    
    parfor time =1:size(store2,2)
        
        [ ii time]
        
        temp =classify(squeeze(testDat(:,time,:)),squeeze(trainDat(:,time,:)),X(trainTrial)); % does the classification
        decodeTemp(:,time) = temp; % finds out how many times the decoder was correct
    end
    decode(testTrial,:)=decodeTemp;
end
plot(binCenters,mean(decode==X))
%% does cross temporal decoding
X =X%variable to decode
store = data % data to decode (trials x time x neurons).

cfg=[];
cfg.nFold=10; % 10 fold cross validation
folds=createFolds(cfg,X); % selects an equal number of trials of each orientation
index = 1:length(X);
avg = collapse(store,1:2);
store2=squeeze(store(:,: ,avg>.01)); % selects only neurons with lots of spikes

store2=filtfast(store2,2,[],'gaussian',5); % temporally filters the data
decode=zeros(size(store2,1),size(store2,2));
for ii=1:length(folds)
    
    testTrial = folds{ii}; % selects the trials which the classifier will be tested on
    trainTrial=~ismember(index,testTrial); % selects all other trials for training set
    trainDat = squeeze(store2(trainTrial,:,:)); % selects the data
    testDat = squeeze(store2(testTrial,:,:));
    decodeTemp=zeros(length(testTrial),size(store2,2),size(store2,2));
    
    parfor trainTime =1:size(store2,2)
        decoder = fitcdiscr(squeeze(trainDat(:,trainTime,:)),X(trainTrial));
        [ ii time]
        for testTime = 1:size(store2,2)
            decodeTemp(:,trainTime,testTime) = predict(decoder,squeeze(trainDat(:,testTime,:)); % finds out how many times the decoder was correct
        end
    end
    decode(testTrial,:)=decodeTemp;
end
imagesc(binCenters,binCenters,squeeze(mean(decode==X)))