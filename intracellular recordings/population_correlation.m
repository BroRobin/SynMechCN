%% Perform correlation analysis between Vm and eyelid movements (CR/NR/EO)
% Prepare the variables using the process_correlation_prep.m script
% (c) R. Broersen, Erasmus MC, 2023


%% All CS trials

% CS trials
corr_trained = [];
corr_trained.behav_amps=[];
corr_trained.behav_peaks=[];
corr_trained.cellnumber = [];
corr_trained.traces_amps=[];
corr_trained.traces_peaks=[];

% Trained
ii=1; % Define which CS-activated neuron to analyse

%load behavioural data
if ii==1
    load('Results_behavior_advanced_280116_1_.mat')
elseif ii==2
    load('Results_behavior_advanced_181016_1_.mat')
elseif ii==3
    load('Results_behavior_160317_2_Block-11.mat')
elseif ii==4
    load('Results_behavior_110417_1_Block-8.mat')
elseif ii==5
    load('Results_behavior_110517_1_Block-9.mat')
end

fs_behav=4884/2; % sampling freq behav
fs_traces=100000; % sampling freq ephys

% calculate amps and peaks CS-US window
try
    idx = [behav.ind_trials_CSonly;behav.ind_trials_paired];
catch
    try
        idx = [behav.ind_trials_CSonly];
    catch
        idx = [behav.ind_trials_paired];
    end
end

% make a vector on cellnumbers
for kk=1:size(idx,1)
    [corr_trained.behav_amps_idx(kk,1), corr_trained.behav_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_behav):round(0.75*fs_behav)));
    corr_trained.cellnumber_idx(kk,1) = ii;
end

% normalize and write to separate variable for storage
%     corr_trained.behav_amps_idx=corr_trained.behav_amps_idx-nanmin(corr_trained.behav_amps_idx);
corr_trained.behav_amps=[corr_trained.behav_amps; (corr_trained.behav_amps_idx/nanmax(corr_trained.behav_amps_idx))];
% corr_trained.behav_amps=[corr_trained.behav_amps; corr_trained.behav_amps_idx];
corr_trained.behav_peaks=[corr_trained.behav_peaks; corr_trained.behav_peaks_idx];
corr_trained.cellnumber = [corr_trained.cellnumber; corr_trained.cellnumber_idx];

%% load ephys data
if ii==1
    load('Results_ephys_CSandUS_0801162.mat')
elseif ii==2
    load('Results_ephys_CSandUS_2009163.mat')
elseif ii==3
    load('Trained_160317_2_CStraces+amplitude.mat')
elseif ii==4
    load('Trained_110417_1_CStraces+amplitude.mat')
elseif ii==5
    load('Trained_110517_1_CStraces+amplitude.mat')
end

try
    idx = [Spkresults.CS_trials_mdn_norm];
catch
    disp('error in loading ephys')
    pause;
end

% detect max
for kk=1:size(idx,1)

    [corr_trained.traces_amps_idx(kk,1), corr_trained.traces_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_traces):round(0.75*fs_traces)));
end
%normalise and write to storage variable
amps_idx = corr_trained.traces_amps_idx(isnan(corr_trained.traces_amps_idx)==0);
peaks_idx = corr_trained.traces_peaks_idx(isnan(corr_trained.traces_amps_idx)==0);
amps_idx = amps_idx/nanmax(amps_idx);

if size(amps_idx,1)==size(corr_trained.behav_amps_idx,1)
    corr_trained.traces_amps=[corr_trained.traces_amps; amps_idx];
    corr_trained.traces_peaks=[corr_trained.traces_peaks; peaks_idx];
elseif size(amps_idx,1)<size(corr_trained.behav_amps,1)
    disp('error: size of behav and traces not equal')
    corr_trained.traces_amps=[corr_trained.traces_amps; [amps_idx; NaN(size(corr_trained.behav_amps_idx,1)-size(amps_idx,1),1)]];
    corr_trained.traces_peaks=[corr_trained.traces_peaks; [peaks_idx; NaN(size(corr_trained.behav_amps_idx,1)-size(amps_idx,1),1)]];
    pause;
end

idx=[];
corr_trained.behav_amps_idx=[];
corr_trained.behav_peaks_idx=[];
corr_trained.cellnumber_idx=[];
corr_trained.traces_amps_idx=[];
corr_trained.traces_peaks_idx=[];
amps_idx =[];
peaks_idx = [];


%% CR trials only
corr_trained = [];
corr_trained.behav_amps=[];
corr_trained.behav_peaks=[];
corr_trained.cellnumber = [];
corr_trained.traces_amps=[];
corr_trained.traces_peaks=[];
% Trained
for ii=1:5
    cd('/Users/u1072913/Sync/Robin/Whole-cell paper 2020/Analysis/In vivo whole cell CS/behavior')
    %load behavioural data
    if ii==1
        load('Results_behavior_181016_1_Block-13.mat')
    elseif ii==2
        load('Results_behavior_201216_1_Block-7.mat')
    elseif ii==3
        load('Results_behavior_160317_2_Block-11.mat')
    elseif ii==4
        load('Results_behavior_110417_1_Block-8.mat')
    elseif ii==5
        load('Results_behavior_110517_1_Block-9.mat')
    end

    % calculate amps and peaks CS-US window
    try
        idx = [behav.ind_trials_CSonly_CR;behav.ind_trials_paired_CR];
    catch
        try
            idx = [behav.ind_trials_CSonly_CR];
        catch
            idx = [behav.ind_trials_paired_CR];
        end
    end

    % make a vector on cellnumbers
    for kk=1:size(idx,1)
        [corr_trained.behav_amps_idx(kk,1), corr_trained.behav_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_behav):round(0.75*fs_behav)));
        corr_trained.cellnumber_idx(kk,1) = ii;
    end

    % normalize and write to separate variable for storage
    %     corr_trained.behav_amps_idx=corr_trained.behav_amps_idx-nanmin(corr_trained.behav_amps_idx);
    corr_trained.behav_amps=[corr_trained.behav_amps; (corr_trained.behav_amps_idx/nanmax(corr_trained.behav_amps_idx))];
    %corr_trained.behav_amps=[corr_trained.behav_amps; corr_trained.behav_amps_idx];
    corr_trained.behav_peaks=[corr_trained.behav_peaks; corr_trained.behav_peaks_idx];
    corr_trained.cellnumber = [corr_trained.cellnumber; corr_trained.cellnumber_idx];
    %load ephys data
    cd('/Users/u1072913/Sync/Robin/Whole-cell paper 2020/Analysis/In vivo whole cell CS/CS analysis')
    if ii==1
        load('Trained_181016_1_CStraces+amplitude.mat')
    elseif ii==2
        load('Trained_201216_1_CStraces+amplitude.mat')
    elseif ii==3
        load('Trained_160317_2_CStraces+amplitude.mat')
    elseif ii==4
        load('Trained_110417_1_CStraces+amplitude.mat')
    elseif ii==5
        load('Trained_110517_1_CStraces+amplitude.mat')
    end

    try
        idx = [traces.CS_trials_CR_mdn_norm];
    catch
        disp('error in loading ephys')
        pause;
    end

    % detect max
    for kk=1:size(idx,1)
        [corr_trained.traces_amps_idx(kk,1), corr_trained.traces_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_traces):round(0.75*fs_traces)));
    end
    %normalise and write to storage variable
    %     corr_trained.traces_amps_idx=corr_trained.traces_amps_idx-nanmin(corr_trained.traces_amps_idx);
    corr_trained.traces_amps=[corr_trained.traces_amps; (corr_trained.traces_amps_idx/nanmax(corr_trained.traces_amps_idx))];
    %   corr_trained.traces_amps=[corr_trained.traces_amps; corr_trained.traces_amps_idx];
    corr_trained.traces_peaks=[corr_trained.traces_peaks; corr_trained.traces_peaks_idx];

    if size(corr_trained.traces_amps,1)==size(corr_trained.behav_amps,1)
    else
        disp('error: size of behav and traces not equal')
        pause;
    end

    idx=[];
    corr_trained.behav_amps_idx=[];
    corr_trained.behav_peaks_idx=[];
    corr_trained.cellnumber_idx=[];
    corr_trained.traces_amps_idx=[];
    corr_trained.traces_peaks_idx=[];

end


%% Naive
% All CS trials

% CS trials
corr_naive = [];
corr_naive.behav_amps=[];
corr_naive.behav_peaks=[];
corr_naive.cellnumber = [];
corr_naive.traces_amps=[];
corr_naive.traces_peaks=[];

for ii=1:2
    %load behavioural data
    if ii==1
        load('Results_behavior_020516_1_Block-4.mat')
    elseif ii==2
        load('Results_behavior_070917_1_Block-1.mat')
    end

    % calculate amps and peaks CS-US window
    try
        idx = [behav.ind_trials_CSonly;behav.ind_trials_paired];
    catch
        try
            idx = [behav.ind_trials_CSonly];
        catch
            idx = [behav.ind_trials_paired];
        end
    end

    % make a vector on cellnumbers
    for kk=1:size(idx,1)
        [corr_naive.behav_amps_idx(kk,1), corr_naive.behav_peaks_idx(kk,1)] = nanmin(idx(kk,round(0.55*fs_behav):round(0.75*fs_behav)));
        corr_naive.cellnumber_idx(kk,1) = ii;
    end

    % normalize and write to separate variable for storage
    %     corr_naive.behav_amps_idx=corr_naive.behav_amps_idx-nanmin(corr_naive.behav_amps_idx);
    corr_naive.behav_amps=[corr_naive.behav_amps; (corr_naive.behav_amps_idx/nanmin(corr_naive.behav_amps_idx))];
    % corr_naive.behav_amps=[corr_naive.behav_amps; corr_naive.behav_amps_idx];
    corr_naive.behav_peaks=[corr_naive.behav_peaks; corr_naive.behav_peaks_idx];
    corr_naive.cellnumber = [corr_naive.cellnumber; corr_naive.cellnumber_idx];
    %load ephys data
    if ii==1
        load('Naive_020516_1_CStraces+amplitude+EO.mat')
    elseif ii==2
        load('Naive_070917_1_CStraces+amplitude+EO:normal.mat')
    end

    try
        idx = [traces.CS_trials_mdn_norm];
    catch
        disp('error in loading ephys')
        pause;
    end

    % detect min
    for kk=1:size(idx,1)
        [corr_naive.traces_amps_idx(kk,1), corr_naive.traces_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_traces):round(0.75*fs_traces)));
    end
    %normalise and write to storage variable
    %     corr_naive.traces_amps_idx=corr_naive.traces_amps_idx-nanmin(corr_naive.traces_amps_idx);
    corr_naive.traces_amps=[corr_naive.traces_amps; (corr_naive.traces_amps_idx/nanmax(corr_naive.traces_amps_idx))];
    %          corr_naive.traces_amps=[corr_naive.traces_amps; corr_naive.traces_amps_idx];
    corr_naive.traces_peaks=[corr_naive.traces_peaks; corr_naive.traces_peaks_idx];

    if size(corr_naive.traces_amps,1)==size(corr_naive.behav_amps,1)
    else
        disp('error: size of behav and traces not equal')
        pause;
    end

    idx=[];
    corr_naive.behav_amps_idx=[];
    corr_naive.behav_peaks_idx=[];
    corr_naive.cellnumber_idx=[];
    corr_naive.traces_amps_idx=[];
    corr_naive.traces_peaks_idx=[];

end

%% EO trials only

% CS trials
corr_naive = [];
corr_naive.behav_amps=[];
corr_naive.behav_peaks=[];
corr_naive.cellnumber = [];
corr_naive.traces_amps=[];
corr_naive.traces_peaks=[];

for ii=1:2
    %load behavioural data
    if ii==1
        load('Results_behavior_020516_1_Block-4.mat')
    elseif ii==2
        load('Results_behavior_070917_1_Block-1.mat')
    end

    % calculate amps and peaks CS-US window
    try
        idx = [behav.ind_trials_CSonly_SEO;behav.ind_trials_paired_SEO];
    catch
        try
            idx = [behav.ind_trials_CSonly_SEO];
        catch
            idx = [behav.ind_trials_paired_SEO];
        end
    end

    % make a vector on cellnumbers
    for kk=1:size(idx,1)
        [corr_naive.behav_amps_idx(kk,1), corr_naive.behav_peaks_idx(kk,1)] = nanmin(idx(kk,round(0.55*fs_behav):round(0.75*fs_behav)));
        corr_naive.cellnumber_idx(kk,1) = ii;
    end

    % normalize and write to separate variable for storage
    %     corr_naive.behav_amps_idx=corr_naive.behav_amps_idx-nanmin(corr_naive.behav_amps_idx);
    corr_naive.behav_amps=[corr_naive.behav_amps; (corr_naive.behav_amps_idx/nanmin(corr_naive.behav_amps_idx))];
    % corr_naive.behav_amps=[corr_naive.behav_amps; corr_naive.behav_amps_idx];
    corr_naive.behav_peaks=[corr_naive.behav_peaks; corr_naive.behav_peaks_idx];
    corr_naive.cellnumber = [corr_naive.cellnumber; corr_naive.cellnumber_idx];
    %load ephys data
    if ii==1
        load('Naive_020516_1_CStraces+amplitude+EO.mat')
    elseif ii==2
        load('Naive_070917_1_CStraces+amplitude+EO:normal.mat')
    end

    try
        idx = [traces.CS_trials_EO_mdn_norm];
    catch
        disp('error in loading ephys')
        pause;
    end

    % detect min
    for kk=1:size(idx,1)
        [corr_naive.traces_amps_idx(kk,1), corr_naive.traces_peaks_idx(kk,1)] = nanmax(idx(kk,round(0.55*fs_traces):round(0.75*fs_traces)));
    end
    %normalise and write to storage variable
    %     corr_naive.traces_amps_idx=corr_naive.traces_amps_idx-nanmin(corr_naive.traces_amps_idx);
    corr_naive.traces_amps=[corr_naive.traces_amps; (corr_naive.traces_amps_idx/nanmax(corr_naive.traces_amps_idx))];
    %          corr_naive.traces_amps=[corr_naive.traces_amps; corr_naive.traces_amps_idx];
    corr_naive.traces_peaks=[corr_naive.traces_peaks; corr_naive.traces_peaks_idx];

    if size(corr_naive.traces_amps,1)==size(corr_naive.behav_amps,1)
    else
        disp('error: size of behav and traces not equal')
        pause;
    end

    idx=[];
    corr_naive.behav_amps_idx=[];
    corr_naive.behav_peaks_idx=[];
    corr_naive.cellnumber_idx=[];
    corr_naive.traces_amps_idx=[];
    corr_naive.traces_peaks_idx=[];

end
