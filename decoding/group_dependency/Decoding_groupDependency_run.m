%% Group dependency of decoding based on Vm traces
% Performs decoding based on different group sizes of conditioned neurons recorded
% intracellularly. Per group (size from 15 to 3 neurons) decoding is
% performed 29 times.

% (c) R. Broersen, Erasmus MC, 2023

%% Perform the decoding based on conditioned data
load('Allneurons_basisdata_cond.mat')
fs = 100000;
Time = 1:0.4*fs;
% perm.dec_accuracy=[];
% counter=0;

for yy=1:13 % neurons
    for jj=1:30% permutations
        if jj==1
            tic;
        end
        counter=counter+1;
        if yy==1
            X = labels(logical(sum(cellID==perm.N15(jj,:),2)));
            store = data(logical(sum(cellID==perm.N15(jj,:),2)),:);
        elseif yy==2
            X = labels(logical(sum(cellID==perm.N14(jj,:),2)));
            store = data(logical(sum(cellID==perm.N14(jj,:),2)),:);
        elseif yy==3
            X = labels(logical(sum(cellID==perm.N13(jj,:),2)));
            store = data(logical(sum(cellID==perm.N13(jj,:),2)),:);
        elseif yy==4
            X = labels(logical(sum(cellID==perm.N12(jj,:),2)));
            store = data(logical(sum(cellID==perm.N12(jj,:),2)),:);
        elseif yy==5
            X = labels(logical(sum(cellID==perm.N11(jj,:),2)));
            store = data(logical(sum(cellID==perm.N11(jj,:),2)),:);
        elseif yy==6
            X = labels(logical(sum(cellID==perm.N10(jj,:),2)));
            store = data(logical(sum(cellID==perm.N10(jj,:),2)),:);
        elseif yy==7
            X = labels(logical(sum(cellID==perm.N9(jj,:),2)));
            store = data(logical(sum(cellID==perm.N9(jj,:),2)),:);
        elseif yy==8
            X = labels(logical(sum(cellID==perm.N8(jj,:),2)));
            store = data(logical(sum(cellID==perm.N8(jj,:),2)),:);
        elseif yy==9
            X = labels(logical(sum(cellID==perm.N7(jj,:),2)));
            store = data(logical(sum(cellID==perm.N7(jj,:),2)),:);
        elseif yy==10
            X = labels(logical(sum(cellID==perm.N6(jj,:),2)));
            store = data(logical(sum(cellID==perm.N6(jj,:),2)),:);
        elseif yy==11
            X = labels(logical(sum(cellID==perm.N5(jj,:),2)));
            store = data(logical(sum(cellID==perm.N5(jj,:),2)),:);
        elseif yy==12
            X = labels(logical(sum(cellID==perm.N4(jj,:),2)));
            store = data(logical(sum(cellID==perm.N4(jj,:),2)),:);
        elseif yy==13
            X = labels(logical(sum(cellID==perm.N3(jj,:),2)));
            store = data(logical(sum(cellID==perm.N3(jj,:),2)),:);
        elseif yy==14
            X = labels(logical(sum(cellID==perm.N2(jj,:),2)));
            store = data(logical(sum(cellID==perm.N2(jj,:),2)),:);
        elseif yy==15
            X = labels(logical(sum(cellID==perm.N1(jj,:),2)));
            store = data(logical(sum(cellID==perm.N1(jj,:),2)),:);
        end
        if sum(X==1)>0 && sum(X==1)>1
            cfg=[];
            cfg.nFold=10; % 10 fold cross validation

            folds=createFolds(cfg,X); % selects an equal number of trials of each orientation
            index = 1:length(X);
            avg = mean(mean(store));
            store2 = store;
            store2(isnan(store2))=0;
            store2=filtfast(store2,2,[],'gaussian',1000); % temporally filters the data 10ms Gauss

            decode=zeros(size(store2,1),size(store2,2));
            for ii=1:length(folds)

                testTrial = folds{ii}; % selects the trials which the classifier will be tested on
                trainTrial=~ismember(index,testTrial); % selects all other trials for training set
                trainDat = squeeze(store2(trainTrial,:,:)); % selects the data
                testDat = squeeze(store2(testTrial,:,:));
                decodeTemp=zeros(length(testTrial),size(store2,2));

                parfor time =1:size(store2,2)
                    [ ii time]
                    temp =classify(squeeze(testDat(:,time,:)),squeeze(trainDat(:,time,:)),X(trainTrial),'linear'); % does the classification
                    decodeTemp(:,time) = temp; % finds out how many times the decoder was correct
                end
                decode(testTrial,:)=decodeTemp;
            end

            temp = decode==X;

            perm.dec_accuracy(counter,:) = mean(decode==X)*100;

            decod_meanAccuracy = mean(decode==X)*100;
            decod_SDAccuracy = std(decode==X)*100;
            decod_SEMAccuracy = decod_SDAccuracy./sqrt(sum(temp==1|temp==0));

            % Peak decoder accuracy and when
            [perm.max_accuracy(counter,1) perm.max_accuracy(counter,2)] = max(decod_meanAccuracy(0.5*fs:0.75*fs));
            perm.max_accuracy(counter,3)=(perm.max_accuracy(counter,2)/fs);
            perm.max_accuracy(counter,4)=decod_SEMAccuracy(perm.max_accuracy(counter,2));

            %% Clustertest
            for ii=1:size(decode,1)
                decod_Accuracy(ii,:) = decode(ii,:)==X(ii);
            end

            decode_null = repmat(0.5,[1 199996]);
            cond1 = decod_Accuracy(:,(0.35*fs):(0.75*fs));
            cond2 = decode_null(:,(0.35*fs):(0.75*fs));

            cond1 = cond1(:,1:40000);
            cond2 = cond2(:,1:40000);

            % plot(mean(cond2),'r')
            % plot(mean(cond2))
            nPerms=2000; % how many permuations do you want

            [datobs, datrnd] = cluster_test_helper([cond1-cond2]',nPerms); % does the cluster test

            [h_mem, p_mem, ~] = cluster_test(datobs,datrnd,0,0.05,0.05);
            pclustu = unique(p_mem);
            npclust = nnz(pclustu < 0.05);
            npclust = nnz(pclustu < 0.05);

            for ipclust = 1:npclust % extract time range of each significant cluster and show in figure
                currind  = p_mem == pclustu(ipclust);
                %     fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[2,2,2,2],[0 0 0],'EdgeColor','none')
                %     h1=fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[-1,2,2,-1],[0 0 0],'EdgeColor','none');
                %     set(h1,'facealpha',.2);
            end
            idx = decod_meanAccuracy(0.35*fs:0.75*fs);
            perm.clustsig_max(counter,1) = nanmax(idx(currind));
            perm.clustsig_mdn(counter,1) = nanmedian(idx(currind));
            perm.clustsig_mean(counter,1) = nanmean(idx(currind));
            perm.clustsig_signtime(counter,1) = nansum(currind);
        else

            perm.dec_accuracy(counter,:) = NaN;

            % Peak decoder accuracy and when
            perm.max_accuracy(counter,1)= NaN;
            perm.max_accuracy(counter,2)= NaN;
            perm.max_accuracy(counter,3)= NaN;
            perm.max_accuracy(counter,4)= NaN;

            perm.clustsig_max(counter,1) = NaN;
            perm.clustsig_mdn(counter,1) = NaN;
            perm.clustsig_mean(counter,1) = NaN;
            perm.clustsig_signtime(counter,1) = NaN;

        end
        if jj==1
            toc;
        end
    end
end

%% Save the data
save('Allneurons_cond_groupDependency')

%% Decoding script - naive
load('Allneurons_basisdata_naive.mat')
fs = 100000;
Time = 1:0.4*fs;
perm.dec_accuracy=[];
counter=0;

for yy=1:13 % neurons
    for jj=1:30 % permutations
        counter=counter+1;
        if yy==1
            X = labels(logical(sum(cellID==perm.N15(jj,:),2)));
            store = data(logical(sum(cellID==perm.N15(jj,:),2)),:);
        elseif yy==2
            X = labels(logical(sum(cellID==perm.N14(jj,:),2)));
            store = data(logical(sum(cellID==perm.N14(jj,:),2)),:);
        elseif yy==3
            X = labels(logical(sum(cellID==perm.N13(jj,:),2)));
            store = data(logical(sum(cellID==perm.N13(jj,:),2)),:);
        elseif yy==4
            X = labels(logical(sum(cellID==perm.N12(jj,:),2)));
            store = data(logical(sum(cellID==perm.N12(jj,:),2)),:);
        elseif yy==5
            X = labels(logical(sum(cellID==perm.N11(jj,:),2)));
            store = data(logical(sum(cellID==perm.N11(jj,:),2)),:);
        elseif yy==6
            X = labels(logical(sum(cellID==perm.N10(jj,:),2)));
            store = data(logical(sum(cellID==perm.N10(jj,:),2)),:);
        elseif yy==7
            X = labels(logical(sum(cellID==perm.N9(jj,:),2)));
            store = data(logical(sum(cellID==perm.N9(jj,:),2)),:);
        elseif yy==8
            X = labels(logical(sum(cellID==perm.N8(jj,:),2)));
            store = data(logical(sum(cellID==perm.N8(jj,:),2)),:);
        elseif yy==9
            X = labels(logical(sum(cellID==perm.N7(jj,:),2)));
            store = data(logical(sum(cellID==perm.N7(jj,:),2)),:);
        elseif yy==10
            X = labels(logical(sum(cellID==perm.N6(jj,:),2)));
            store = data(logical(sum(cellID==perm.N6(jj,:),2)),:);
        elseif yy==11
            X = labels(logical(sum(cellID==perm.N5(jj,:),2)));
            store = data(logical(sum(cellID==perm.N5(jj,:),2)),:);
        elseif yy==12
            X = labels(logical(sum(cellID==perm.N4(jj,:),2)));
            store = data(logical(sum(cellID==perm.N4(jj,:),2)),:);
        elseif yy==13
            X = labels(logical(sum(cellID==perm.N3(jj,:),2)));
            store = data(logical(sum(cellID==perm.N3(jj,:),2)),:);
        elseif yy==14
            X = labels(logical(sum(cellID==perm.N2(jj,:),2)));
            store = data(logical(sum(cellID==perm.N2(jj,:),2)),:);
        elseif yy==15
            X = labels(logical(sum(cellID==perm.N1(jj,:),2)));
            store = data(logical(sum(cellID==perm.N1(jj,:),2)),:);
        end
        if sum(X==1)>0 && sum(X==1)>1
            cfg=[];
            cfg.nFold=10; % 10 fold cross validation

            folds=createFolds(cfg,X); % selects an equal number of trials of each orientation
            index = 1:length(X);
            avg = mean(mean(store));
            store2 = store;
            store2(isnan(store2))=0;

            store2=filtfast(store2,2,[],'gaussian',1000); % temporally filters the data 10ms Gauss

            decode=zeros(size(store2,1),size(store2,2));
            for ii=1:length(folds)

                testTrial = folds{ii}; % selects the trials which the classifier will be tested on
                trainTrial=~ismember(index,testTrial); % selects all other trials for training set
                trainDat = squeeze(store2(trainTrial,:,:)); % selects the data
                testDat = squeeze(store2(testTrial,:,:));
                decodeTemp=zeros(length(testTrial),size(store2,2));

                parfor time =1:size(store2,2)
                    [ ii time]
                    temp =classify(squeeze(testDat(:,time,:)),squeeze(trainDat(:,time,:)),X(trainTrial),'linear'); % does the classification
                    decodeTemp(:,time) = temp; % finds out how many times the decoder was correct
                end
                decode(testTrial,:)=decodeTemp;
            end

            temp = decode==X;

            perm.dec_accuracy(counter,:) = mean(decode==X)*100;

            decod_meanAccuracy = mean(decode==X)*100;
            decod_SDAccuracy = std(decode==X)*100;
            decod_SEMAccuracy = decod_SDAccuracy./sqrt(sum(temp==1|temp==0));

            % Peak decoder accuracy and when
            [perm.max_accuracy(counter,1) perm.max_accuracy(counter,2)] = max(decod_meanAccuracy(0.5*fs:0.75*fs));
            perm.max_accuracy(counter,3)=(perm.max_accuracy(counter,2)/fs);
            perm.max_accuracy(counter,4)=decod_SEMAccuracy(perm.max_accuracy(counter,2));

            %% Clustertest
            for ii=1:size(decode,1)
                decod_Accuracy(ii,:) = decode(ii,:)==X(ii);
            end


            decode_null = repmat(0.5,[1 199996]);

            cond1 = decod_Accuracy(:,(0.35*fs):(0.75*fs));
            cond2 = decode_null(:,(0.35*fs):(0.75*fs));

            cond1 = cond1(:,1:40000);
            cond2 = cond2(:,1:40000);

            % plot(mean(cond2),'r')
            % plot(mean(cond2))
            nPerms=2000; % how many permuations do you want

            [datobs, datrnd] = cluster_test_helper([cond1-cond2]',nPerms); % does the cluster test

            [h_mem, p_mem, ~] = cluster_test(datobs,datrnd,0,0.05,0.05);
            pclustu = unique(p_mem);
            npclust = nnz(pclustu < 0.05);
            npclust = nnz(pclustu < 0.05);

            for ipclust = 1:npclust % extract time range of each significant cluster and show in figure
                currind  = p_mem == pclustu(ipclust);
                %     fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[2,2,2,2],[0 0 0],'EdgeColor','none')
                %     h1=fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[-1,2,2,-1],[0 0 0],'EdgeColor','none');
                %     set(h1,'facealpha',.2);
            end
            idx = decod_meanAccuracy(0.35*fs:0.75*fs);
            perm.clustsig_max(counter,1) = nanmax(idx(currind));
            perm.clustsig_mdn(counter,1) = nanmedian(idx(currind));
            perm.clustsig_mean(counter,1) = nanmean(idx(currind));
            perm.clustsig_signtime(counter,1) = nansum(currind);
        else

            perm.dec_accuracy(counter,:) = NaN;

            % Peak decoder accuracy and when
            perm.max_accuracy(counter,1)= NaN;
            perm.max_accuracy(counter,2)= NaN;
            perm.max_accuracy(counter,3)= NaN;
            perm.max_accuracy(counter,4)= NaN;

            perm.clustsig_max(counter,1) = NaN;
            perm.clustsig_mdn(counter,1) = NaN;
            perm.clustsig_mean(counter,1) = NaN;
            perm.clustsig_signtime(counter,1) = NaN;

        end
    end
end

%% Save the data
save('Allneurons_naive_groupDependency')
