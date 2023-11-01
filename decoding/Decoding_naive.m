%% Script to perform decoding based on Vm traces from naive neurons
% Modified by R. Broersen from code provided by M. Tang, ANU, 2021.
% R. Broersen, Erasmus MC, 2023

clear all; close all
data=[];
labels=[];
fs=100000;
cd('[path]'); % Path to the ephys output files

% Load the data
for ii=1:15
    ii
 if ii==1
        load('Results_ephys_CSandUS_2104161.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_2104161 (2).mat')
    elseif ii==3
        load('Results_ephys_CSandUS_2804162.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_2804163.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_0505161.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_0407163.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_0807162.mat')
    elseif ii==8
        load('Results_ephys_CSandUS_1403172.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2108172.mat')
    elseif ii==10
        load('Results_ephys_CSandUS_2108172 (2).mat')
    elseif ii==11
        load('Results_ephys_CSandUS_2003171.mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2003171 (2).mat')
    elseif ii==13
        load('Results_ephys_CSandUS_0807162 (2).mat')
    elseif ii==14
        load('Results_ephys_CSandUS_2003174.mat')
    elseif ii==15
        load('Results_ephys_CSandUS_0201173.mat')
    end

    % Gather the CR and NR trials and create a label variable (1 = CR/0 =
    % NR)
    data = [data; Spkresults.CS_trials_CR_mdn_norm(:,1:200000)];
    labels = [labels; ones(size(Spkresults.CS_trials_CR_mdn_norm,1),1)];

    data = [data; Spkresults.CS_trials_normal_mdn_norm(:,1:200000)];
    labels = [labels; zeros(size(Spkresults.CS_trials_normal_mdn_norm,1),1)];

end

% Remove the NaN trials
idx = isnan(data(:,1));
data=data(idx==0,:);
labels=labels(idx==0,:);

%% Decoding script

X = labels;
store = data;
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

%% Plot All neurons, all 3 stimuli with SEM
figure; hold on;
temp = decode==X;

decod_meanAccuracy = mean(decode==X)*100;
decod_SDAccuracy = std(decode==X)*100;
decod_SEMAccuracy = decod_SDAccuracy./sqrt(sum(temp==1|temp==0));

% %only CS period
% binCenters=[-0.15:1/fs:0.25];
% plot(binCenters,decod_meanAccuracy((0.35*fs):(0.75*fs)),'k')
% plot(binCenters,decod_meanAccuracy((0.35*fs):(0.75*fs))+decod_SEMAccuracy((0.35*fs):(0.75*fs)),'r')
% plot(binCenters,decod_meanAccuracy((0.35*fs):(0.75*fs))-decod_SEMAccuracy((0.35*fs):(0.75*fs)),'r')

%CS+US period
binCenters=[-0.15:1/fs:0.5];
plot(binCenters,decod_meanAccuracy((0.35*fs):(1*fs)),'k')
plot(binCenters,decod_meanAccuracy((0.35*fs):(1*fs))+decod_SEMAccuracy((0.35*fs):(1*fs)),'r')
plot(binCenters,decod_meanAccuracy((0.35*fs):(1*fs))-decod_SEMAccuracy((0.35*fs):(1*fs)),'r')

plot(binCenters, repmat(50,[length(binCenters) 1]),'k-');

set(gca,'FontSize',14)
ylabel('Decoding accuracy (%)','fontSize',16); xlabel('Time (s)','fontSize',16);
xlim([-0.15 0.25]); ylim([20 80]);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.25 0.25],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.26 0.26],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);

% line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
% line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
%
cd('[path]')
orient('portrait')
figname = 'Allneurons_naive_pooled_linear_10msGauss_baselinenorm_xlim0.25.fig';
saveas(gcf,figname,'fig');
figname = 'Allneurons_naive_pooled_linear_10msGauss_baselinenorm_xlim0.25.pdf';
print('-dpdf','-painters','-loose',figname);

% Peak decoder accuracy and when
[AccMax(1) AccMax(2)] = max(decod_meanAccuracy(0.5*fs:0.75*fs));
AccMax(3)=(AccMax(2)/fs);
AccMax(4)=decod_SEMAccuracy(AccMax(2));

save('Allneurons_naive_pooled_linear_10msGauss_baselinenorm')
