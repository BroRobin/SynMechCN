%% Analyze and calculate statistics of the US responses
% Analyze US responses. Requires preprocessed output from the main CS electrophysiology
% scripts.
% (c) R. Broersen, Erasmus MC, 2023

% Manually load the ephys .mat output file for each conditioned neuron

Spkdata.fs  = 100000;
traces=[];

%% Gather the trial data
try
    Spkresults.US_trials = [Spkresults.ind_data_USonly; Spkresults.ind_data_paired];
catch
    Spkresults.US_trials = [Spkresults.ind_data_paired];
end
Spkresults.US_trials_noCR = [Spkresults.ind_data_paired_normal];
Spkresults.US_trials_CR = [Spkresults.ind_data_paired_CR];
try
    Spkresults.USonly_trials = [Spkresults.ind_data_USonly];
end

%% Filter the US trialdata using a median filter
for ii=1:size(Spkresults.US_trials,1)
    Spkresults.US_trials_mdn(ii,:) = movmedian(Spkresults.US_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_noCR,1)
    Spkresults.US_trials_noCR_mdn(ii,:) = movmedian(Spkresults.US_trials_noCR(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_CR,1)
    Spkresults.US_trials_CR_mdn(ii,:) = movmedian(Spkresults.US_trials_CR(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
try
    for ii=1:size(Spkresults.USonly_trials,1)
        Spkresults.USonly_trials_mdn(ii,:) = movmedian(Spkresults.USonly_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
    end
end

%% Exclude trials if they have insufficient quality (enable based on which neuron is analyzed)

%181016_1
%
% Spkresults.USonly_exclude_trials = [4 7];
% for ii = 1:length(Spkresults.USonly_exclude_trials)
%     Spkresults.USonly_exclude_trials_mdn(Spkresults.USonly_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials = [5 7 8 10 11 13 18 29 30 31 32 33 34 37];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_noCR = [4 5];
% for ii = 1:length(Spkresults.US_exclude_trials_noCR)
% Spkresults.US_trials_noCR_mdn(Spkresults.US_exclude_trials_noCR(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_CR = [5 10 11 17 26 27 28 29 32];
% for ii = 1:length(Spkresults.US_exclude_trials_CR)
% Spkresults.US_trials_CR_mdn(Spkresults.US_exclude_trials_CR(ii),:)=NaN;
% end


% %121115_1
% Spkresults.US_exclude_trials = [20 29 31 51];
% for ii = 1:length(Spkresults.US_exclude_trials)
%     Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_noCR = [2 9];
% for ii = 1:length(Spkresults.US_exclude_trials_noCR)
%     Spkresults.US_trials_noCR_mdn(Spkresults.US_exclude_trials_noCR(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_CR = [2 9 13];
% for ii = 1:length(Spkresults.US_exclude_trials_CR)
%     Spkresults.US_trials_CR_mdn(Spkresults.US_exclude_trials_CR(ii),:)=NaN;
% end


%201216_1
% Spkresults.US_exclude_trials = [1 4 8];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_noCR = [1];
% for ii = 1:length(Spkresults.US_exclude_trials_noCR)
% Spkresults.US_trials_noCR_mdn(Spkresults.US_exclude_trials_noCR(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_CR = [3 6];
% for ii = 1:length(Spkresults.US_exclude_trials_CR)
% Spkresults.US_trials_CR_mdn(Spkresults.US_exclude_trials_CR(ii),:)=NaN;
% end

%160317_2
%no excluded traces

%170317_1
%no excluded traces

% %110417_1
%no excluded traces

%110517_2
% Spkresults.US_exclude_trials = [2 3 11 13 15 30 32 33 35 36 38 42 46 60 63 69 74 75 81 89 90];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_noCR = [1 2 4 23 27 43 48];
% for ii = 1:length(Spkresults.US_exclude_trials_noCR)
% Spkresults.US_trials_noCR_mdn(Spkresults.US_exclude_trials_noCR(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_CR = [2 9 14 15 16 18 19 23 24];
% for ii = 1:length(Spkresults.US_exclude_trials_CR)
% Spkresults.US_trials_CR_mdn(Spkresults.US_exclude_trials_CR(ii),:)=NaN;
% end

% %170517_1
%no excluded traces

% %110517_1
% Spkresults.US_exclude_trials = [1 12 13 19 21 22];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_noCR = [4 10];
% for ii = 1:length(Spkresults.US_exclude_trials_noCR)
% Spkresults.US_trials_noCR_mdn(Spkresults.US_exclude_trials_noCR(ii),:)=NaN;
% end
%
% Spkresults.US_exclude_trials_CR = [1 6];
% for ii = 1:length(Spkresults.US_exclude_trials_CR)
% Spkresults.US_trials_CR_mdn(Spkresults.US_exclude_trials_CR(ii),:)=NaN;
% end

%% Normalize traces to 250ms before onset CS
for ii=1:size(Spkresults.US_trials_mdn,1)
    Spkresults.US_trials_mdn_norm(ii,:) = Spkresults.US_trials_mdn(ii,:)-nanmean(Spkresults.US_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

for ii=1:size(Spkresults.US_trials_noCR_mdn,1)
    Spkresults.US_trials_noCR_mdn_norm(ii,:) = Spkresults.US_trials_noCR_mdn(ii,:)-nanmean(Spkresults.US_trials_noCR_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

for ii=1:size(Spkresults.US_trials_CR_mdn,1)
    Spkresults.US_trials_CR_mdn_norm(ii,:) = Spkresults.US_trials_CR_mdn(ii,:)-nanmean(Spkresults.US_trials_CR_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

try
    for ii=1:size(Spkresults.USonly_trials_mdn,1)
        Spkresults.USonly_trials_mdn_norm(ii,:) = Spkresults.USonly_trials_mdn(ii,:)-nanmean(Spkresults.USonly_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
    end
end

%% Determine amplitude and peaktime parameters between 0.75 and 1.25s 
Spkresults.amp_US = [];
Spkresults.peaktime_US=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.US_trials_mdn,1)
    if isnan(Spkresults.US_trials_mdn_norm(ii,1))==0
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        if abs(ampidx(1))>abs(ampidx(2))
            Spkresults.amp_US(ii)=ampidx(1);
            Spkresults.peaktime_US(ii) = amptime(1);
        elseif abs(ampidx(2))>abs(ampidx(1))
            Spkresults.amp_US(ii)=ampidx(2);
            Spkresults.peaktime_US(ii) = amptime(2);
        end
    else
        Spkresults.amp_US(ii)=NaN;
        Spkresults.peaktime_US(ii) = NaN;
    end
end

Spkresults.avg_amp_US = nanmean(Spkresults.amp_US);
Spkresults.mdn_amp_US = nanmedian(Spkresults.amp_US);
Spkresults.avg_peaktime_US= round(nanmean(Spkresults.peaktime_US))/Spkdata.fs;
Spkresults.mdn_peaktime_US = round(nanmedian(Spkresults.peaktime_US))/Spkdata.fs;

%noCR
Spkresults.amp_US_noCR = [];
Spkresults.peaktime_US_noCR=[];
ampidx=[];
for ii=1:size(Spkresults.US_trials_noCR_mdn,1)
    if isnan(Spkresults.US_trials_noCR_mdn_norm(ii,1))==0
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        if abs(ampidx(1))>abs(ampidx(2))
            Spkresults.amp_US_noCR(ii)=ampidx(1);
            Spkresults.peaktime_US_noCR(ii) = amptime(1);
        elseif abs(ampidx(2))>abs(ampidx(1))
            Spkresults.amp_US_noCR(ii)=ampidx(2);
            Spkresults.peaktime_US_noCR(ii) = amptime(2);
        end
    else
        Spkresults.amp_US_noCR(ii)=NaN;
        Spkresults.peaktime_US_noCR(ii) = NaN;
    end
end

Spkresults.avg_amp_US_noCR = nanmean(Spkresults.amp_US_noCR);
Spkresults.mdn_amp_US_noCR = nanmedian(Spkresults.amp_US_noCR);
Spkresults.avg_peaktime_US_noCR= round(nanmean(Spkresults.peaktime_US_noCR))/Spkdata.fs;
Spkresults.mdn_peaktime_US_noCR = round(nanmedian(Spkresults.peaktime_US_noCR))/Spkdata.fs;

%CR
Spkresults.amp_US_CR = [];
Spkresults.peaktime_US_CR=[];
ampidx=[];
for ii=1:size(Spkresults.US_trials_CR_mdn,1)
    if isnan(Spkresults.US_trials_CR_mdn_norm(ii,1))==0
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        if abs(ampidx(1))>abs(ampidx(2))
            Spkresults.amp_US_CR(ii)=ampidx(1);
            Spkresults.peaktime_US_CR(ii) = amptime(1);
        elseif abs(ampidx(2))>abs(ampidx(1))
            Spkresults.amp_US_CR(ii)=ampidx(2);
            Spkresults.peaktime_US_CR(ii) = amptime(2);
        end
    else
        Spkresults.amp_US_CR(ii)=NaN;
        Spkresults.peaktime_US_CR(ii) = NaN;
    end
end

Spkresults.avg_amp_US_CR = nanmean(Spkresults.amp_US_CR);
Spkresults.mdn_amp_US_CR = nanmedian(Spkresults.amp_US_CR);
Spkresults.avg_peaktime_US_CR= round(nanmean(Spkresults.peaktime_US_CR))/Spkdata.fs;
Spkresults.mdn_peaktime_US_CR = round(nanmedian(Spkresults.peaktime_US_CR))/Spkdata.fs;

try
    %US only trials
    Spkresults.amp_USonly = [];
    Spkresults.peaktime_USonly=[];
    ampidx=[];
    for ii=1:size(Spkresults.USonly_trials_mdn,1)
        if isnan(Spkresults.USonly_trials_mdn_norm(ii,1))==0
            [ampidx(1) amptime(1)]=max(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            [ampidx(2) amptime(2)]=min(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            if abs(ampidx(1))>abs(ampidx(2))
                Spkresults.amp_USonly(ii)=ampidx(1);
                Spkresults.peaktime_USonly(ii) = amptime(1);
            elseif abs(ampidx(2))>abs(ampidx(1))
                Spkresults.amp_USonly(ii)=ampidx(2);
                Spkresults.peaktime_USonly(ii) = amptime(2);
            end
        else
            Spkresults.amp_USonly(ii)=NaN;
            Spkresults.peaktime_USonly(ii) = NaN;
        end
    end

    Spkresults.avg_amp_USonly = nanmean(Spkresults.amp_USonly);
    Spkresults.mdn_amp_USonly = nanmedian(Spkresults.amp_USonly);
    Spkresults.avg_peaktime_USonly= round(nanmean(Spkresults.peaktime_USonly))/Spkdata.fs;
    Spkresults.mdn_peaktime_USonly = round(nanmedian(Spkresults.peaktime_USonly))/Spkdata.fs;
catch
    disp('US only trials error amp calculation')
    Spkresults.avg_amp_USonly = NaN;
    Spkresults.mdn_amp_USonly = NaN;
    Spkresults.avg_peaktime_USonly= NaN;
    Spkresults.mdn_peaktime_USonly = NaN;
end


try
    %US only + paired CR- trials
    Spkresults.amp_USonly_noCR = [];
    Spkresults.peaktime_USonly_noCR=[];
    ampidx=[];
    try
        Spkresults.US_trials_USonly_noCR_mdn_norm = [Spkresults.USonly_trials_mdn_norm; Spkresults.US_trials_noCR_mdn_norm];
    catch
        try
            Spkresults.US_trials_USonly_noCR_mdn_norm = [Spkresults.US_trials_noCR_mdn_norm];
        catch
            Spkresults.US_trials_USonly_noCR_mdn_norm = [Spkresults.USonly_trials_mdn_norm];
        end
    end
    for ii=1:size(Spkresults.US_trials_USonly_noCR_mdn_norm,1)
        if isnan(Spkresults.US_trials_USonly_noCR_mdn_norm(ii,1))==0
            [ampidx(1) amptime(1)]=max(Spkresults.US_trials_USonly_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            [ampidx(2) amptime(2)]=min(Spkresults.US_trials_USonly_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            if abs(ampidx(1))>abs(ampidx(2))
                Spkresults.amp_USonly_noCR(ii)=ampidx(1);
                Spkresults.peaktime_USonly_noCR(ii) = amptime(1);
            elseif abs(ampidx(2))>abs(ampidx(1))
                Spkresults.amp_USonly_noCR(ii)=ampidx(2);
                Spkresults.peaktime_USonly_noCR(ii) = amptime(2);
            end
        else
            Spkresults.amp_USonly_noCR(ii)=NaN;
            Spkresults.peaktime_USonly_noCR(ii) = NaN;
        end
    end

    Spkresults.avg_amp_USonly_noCR = nanmean(Spkresults.amp_USonly_noCR);
    Spkresults.mdn_amp_USonly_noCR = nanmedian(Spkresults.amp_USonly_noCR);
    Spkresults.avg_peaktime_USonly_noCR= round(nanmean(Spkresults.peaktime_USonly_noCR))/Spkdata.fs;
    Spkresults.mdn_peaktime_USonly_noCR = round(nanmedian(Spkresults.peaktime_USonly_noCR))/Spkdata.fs;
catch
    disp('US only trials+CR- error amp calculation')
    Spkresults.avg_amp_USonly_noCR = NaN;
    Spkresults.mdn_amp_USonly_noCR = NaN;
    Spkresults.avg_peaktime_USonly_noCR= NaN;
    Spkresults.mdn_peaktime_USonly_noCR = NaN;
end


%% Determine AUC parameters between 0.75 and 1.25s 
Spkresults.AUC_US=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_mdn,1)
    if isnan(Spkresults.US_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_US(ii)=nansum(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    end
end

Spkresults.avg_AUC_US = nanmean(Spkresults.AUC_US);
Spkresults.mdn_AUC_US = nanmedian(Spkresults.AUC_US);


% No CR _noCR
Spkresults.AUC_US_noCR=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_noCR_mdn_norm,1)
    if isnan(Spkresults.US_trials_noCR_mdn_norm(ii,1))==0
        Spkresults.AUC_US_noCR(ii)=nansum(Spkresults.US_trials_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    end
end

Spkresults.avg_AUC_US_noCR = nanmean(Spkresults.AUC_US_noCR);
Spkresults.mdn_AUC_US_noCR = nanmedian(Spkresults.AUC_US_noCR);

% CR
Spkresults.AUC_US_CR=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_CR_mdn_norm,1)
    if isnan(Spkresults.US_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_US_CR(ii)=nansum(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    end
end

Spkresults.avg_AUC_US_CR = nanmean(Spkresults.AUC_US_CR);
Spkresults.mdn_AUC_US_CR = nanmedian(Spkresults.AUC_US_CR);

try
    % US only
    Spkresults.AUC_USonly=[];
    AUCidx=[];
    for ii=1:size(Spkresults.USonly_trials_mdn_norm,1)
        if isnan(Spkresults.USonly_trials_mdn_norm(ii,1))==0
            Spkresults.AUC_USonly(ii)=nansum(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        end
    end

    Spkresults.avg_AUC_USonly = nanmean(Spkresults.AUC_USonly);
    Spkresults.mdn_AUC_USonly= nanmedian(Spkresults.AUC_USonly);
catch
    disp('Error AUC US only trials')

    Spkresults.avg_AUC_USonly = NaN;
    Spkresults.mdn_AUC_USonly= NaN;
end


try
    % US only + CR- trials
    Spkresults.AUC_USonly_noCR=[];
    AUCidx=[];
    for ii=1:size(Spkresults.US_trials_USonly_noCR_mdn_norm,1)
        if isnan(Spkresults.US_trials_USonly_noCR_mdn_norm(ii,1))==0
            Spkresults.AUC_USonly_noCR(ii)=nansum(Spkresults.US_trials_USonly_noCR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        end
    end

    Spkresults.avg_AUC_USonly_noCR = nanmean(Spkresults.AUC_USonly_noCR);
    Spkresults.mdn_AUC_USonly_noCR = nanmedian(Spkresults.AUC_USonly_noCR);
catch
    disp('Error AUC US only_noCR trials')

    Spkresults.avg_AUC_USonly_noCR = NaN;
    Spkresults.mdn_AUC_USonly_noCR= NaN;
end

%% Generate average trace
Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
Spkresults.avgtrace_US_noCR = nanmean(Spkresults.US_trials_noCR_mdn_norm,1);
Spkresults.avgtrace_US_CR = nanmean(Spkresults.US_trials_CR_mdn_norm,1);
try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
Spkresults.avgtrace_USonly_noCR = nanmean(Spkresults.US_trials_USonly_noCR_mdn_norm,1);

figure; hold on; plot(Spkresults.avgtrace_US,'k');
plot(Spkresults.avgtrace_US_noCR,'b'); plot(Spkresults.avgtrace_US_CR,'g');
try; plot(Spkresults.avgtrace_USonly,'m'); end; plot(Spkresults.avgtrace_USonly_noCR,'c')
xlim([0.75*Spkdata.fs 1.25*Spkdata.fs]); legend('US trials','Paired noCR','Paired CR','USonly','USonly + paired noCR')

%% Save figures (enable based on which neuron is analyzed)
% figname = sprintf('Trained_121115_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_121115_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% 
% figname = sprintf('Trained_181016_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_181016_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% 
% figname = sprintf('Trained_201216_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_201216_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% figname = sprintf('Trained_160317_2_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_160317_2_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% figname = sprintf('Trained_110417_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_110417_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% figname = sprintf('Trained_110517_2_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_110517_2_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% figname = sprintf('Trained_170517_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_170517_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
% 
% figname = sprintf('Trained_110517_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Trained_110517_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);

%% Excel stats

% conditioned
excelvars=[Spkresults.avg_amp_US Spkresults.avg_amp_USonly Spkresults.avg_amp_US_CR Spkresults.avg_amp_US_noCR Spkresults.avg_amp_USonly_noCR...
    Spkresults.avg_peaktime_US*1000 Spkresults.avg_peaktime_USonly*1000 Spkresults.avg_peaktime_US_CR*1000 Spkresults.avg_peaktime_US_noCR*1000 Spkresults.avg_peaktime_USonly_noCR*1000 ...
    Spkresults.avg_AUC_US Spkresults.avg_AUC_USonly Spkresults.avg_AUC_US_CR Spkresults.avg_AUC_US_noCR Spkresults.avg_AUC_USonly_noCR];

% excelvars=[Spkresults.avg_amp_US Spkresults.avg_amp_USonly Spkresults.avg_amp_US_CR NaN Spkresults.avg_amp_USonly_noCR...
%     Spkresults.avg_peaktime_US*1000 Spkresults.avg_peaktime_USonly*1000 Spkresults.avg_peaktime_US_CR*1000 NaN Spkresults.avg_peaktime_USonly_noCR*1000 ...
%     Spkresults.avg_AUC_US Spkresults.avg_AUC_USonly Spkresults.avg_AUC_US_CR NaN Spkresults.avg_AUC_USonly_noCR]


%% Load all traces files in order of excel sheet and copy the averages in one mat variable
allSpkresults.US = NaN(15,200000);
allSpkresults.US_noCR = NaN(15,200000);
allSpkresults.US_CR = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noCR = NaN(15,200000);

cd('[path]')
% add each cell
for ii=1:15
    ii
    if ii==1
        load('Results_ephys_CSandUS_16987.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_0801162.mat')
    elseif ii==3
        load('Results_ephys_CSandUS_2009163.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_2211163.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_1302173.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_2103171.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_2103172.mat')
    elseif ii==8
        load('Results_ephys_CSandUS_2404172.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2404171.mat')
    elseif ii==10
        load('Results_ephys_CSandUS_2404172 (2).mat')
    elseif ii==11
        load('Results_ephys_CSandUS_2211164.mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2211164 (2).mat')
    elseif ii==13
        load('Results_ephys_CSandUS_1701171.mat')
    elseif ii==14
        load('Results_ephys_CSandUS_1701173.mat')
    elseif ii==15
        load('Results_ephys_CSandUS_2103171 (2).mat')
    end

    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noCR = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_CR = nanmean(Spkresults.US_trials_CR_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noCR = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noCR(ii,1:length(Spkresults.avgtrace_US_noCR)) = Spkresults.avgtrace_US_noCR; end
    try allSpkresults.US_CR(ii,1:length(Spkresults.avgtrace_US_CR)) = Spkresults.avgtrace_US_CR; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noCR(ii,1:length(Spkresults.avgtrace_USonly_noCR)) = Spkresults.avgtrace_USonly_noCR; end

end

allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noCR = nanmean(allSpkresults.US_noCR,1);
allSpkresults.avg_US_CR = nanmean(allSpkresults.US_CR,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noCR = nanmean(allSpkresults.USonly_noCR,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noCR = nanstd(allSpkresults.US_noCR,1)/sqrt(sum(isnan(allSpkresults.US_noCR(:,1))==0));
allSpkresults.sem_US_CR = nanstd(allSpkresults.US_CR,1)/sqrt(sum(isnan(allSpkresults.US_CR(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noCR = nanstd(allSpkresults.USonly_noCR,1)/sqrt(sum(isnan(allSpkresults.USonly_noCR(:,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Trained_allUSonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Trained_allSpkresults.mat','alltraces');

%% CR+ vs CR-

timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR+allSpkresults.sem_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR-allSpkresults.sem_US_noCR,'b');

plot(timeX,allSpkresults.avg_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR+allSpkresults.sem_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR-allSpkresults.sem_US_CR,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Trained_allUS_CRvsnoCR.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_allUS_CRvsnoCR.pdf');
print('-dpdf','-painters','-loose',figname);

%% Only US-activated cells

allSpkresults.US = NaN(15,200000);
allSpkresults.US_noCR = NaN(15,200000);
allSpkresults.US_CR = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noCR = NaN(15,200000);

cd('[path]')
% add each cell
for ii=1:12
    ii

    if ii==1
        load('Results_ephys_CSandUS_2009163.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_2211163.mat')
    elseif ii==3
        load('Results_ephys_CSandUS_1302173.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_2103171.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_2404172.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_2404171.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_2404172 (2).mat')
    elseif ii==8
        load('Results_ephys_CSandUS_2211164.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2211164 (2).mat')
    elseif ii==10
        load('Results_ephys_CSandUS_1701171.mat')
    elseif ii==11
        load('Results_ephys_CSandUS_1701173.mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2103171 (2).mat')
    end

    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noCR = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_CR = nanmean(Spkresults.US_trials_CR_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noCR = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noCR(ii,1:length(Spkresults.avgtrace_US_noCR)) = Spkresults.avgtrace_US_noCR; end
    try allSpkresults.US_CR(ii,1:length(Spkresults.avgtrace_US_CR)) = Spkresults.avgtrace_US_CR; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noCR(ii,1:length(Spkresults.avgtrace_USonly_noCR)) = Spkresults.avgtrace_USonly_noCR; end

end

cd('[path]')
allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noCR = nanmean(allSpkresults.US_noCR,1);
allSpkresults.avg_US_CR = nanmean(allSpkresults.US_CR,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noCR = nanmean(allSpkresults.USonly_noCR,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noCR = nanstd(allSpkresults.US_noCR,1)/sqrt(sum(isnan(allSpkresults.US_noCR(:,1))==0));
allSpkresults.sem_US_CR = nanstd(allSpkresults.US_CR,1)/sqrt(sum(isnan(allSpkresults.US_CR(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noCR = nanstd(allSpkresults.USonly_noCR,1)/sqrt(sum(isnan(allSpkresults.USonly_noCR(:,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Trained_US-activated_USonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_US-activated_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Trained_allSpkresults.mat','alltraces');

%% CR+ vs CR-
US_activated_cond = [0;0;1;1;1;1;0;1;0;1;1;1;1;1;1];
US_activated_cond=logical(US_activated_cond);

allSpkresults.avg_US = nanmean(allSpkresults.US(US_activated_cond,:),1);
allSpkresults.avg_US_noCR = nanmean(allSpkresults.US_noCR(US_activated_cond,:),1);
allSpkresults.avg_US_CR = nanmean(allSpkresults.US_CR(US_activated_cond,:),1);
allSpkresults.avg_USonly_noCR = nanmean(allSpkresults.USonly_noCR(US_activated_cond,:),1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(US_activated_cond,1))==0));
allSpkresults.sem_US_noCR = nanstd(allSpkresults.US_noCR,1)/sqrt(sum(isnan(allSpkresults.US_noCR(US_activated_cond,1))==0));
allSpkresults.sem_US_CR = nanstd(allSpkresults.US_CR,1)/sqrt(sum(isnan(allSpkresults.US_CR(US_activated_cond,1))==0));
allSpkresults.sem_USonly_noCR = nanstd(allSpkresults.USonly_noCR,1)/sqrt(sum(isnan(allSpkresults.USonly_noCR(US_activated_cond,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR+allSpkresults.sem_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR-allSpkresults.sem_US_noCR,'b');

plot(timeX,allSpkresults.avg_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR+allSpkresults.sem_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR-allSpkresults.sem_US_CR,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Trained_US-activated_CRvsnoCR_statspairs.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_US-activated_CRvsnoCR_statspairs.pdf');
print('-dpdf','-painters','-loose',figname);


%% Only US-suppressed

allSpkresults.US = NaN(15,200000);
allSpkresults.US_noCR = NaN(15,200000);
allSpkresults.US_CR = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noCR = NaN(15,200000);

cd('[path]')
% add each cell
for ii=1:2
    ii
    if ii==1
        load('Results_ephys_CSandUS_16987.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_2103172.mat')

    end

    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noCR = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_CR = nanmean(Spkresults.US_trials_CR_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noCR = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noCR(ii,1:length(Spkresults.avgtrace_US_noCR)) = Spkresults.avgtrace_US_noCR; end
    try allSpkresults.US_CR(ii,1:length(Spkresults.avgtrace_US_CR)) = Spkresults.avgtrace_US_CR; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noCR(ii,1:length(Spkresults.avgtrace_USonly_noCR)) = Spkresults.avgtrace_USonly_noCR; end

end

cd('T:\Whole cell EBC project\Revision2023\US')
allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noCR = nanmean(allSpkresults.US_noCR,1);
allSpkresults.avg_US_CR = nanmean(allSpkresults.US_CR,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noCR = nanmean(allSpkresults.USonly_noCR,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noCR = nanstd(allSpkresults.US_noCR,1)/sqrt(sum(isnan(allSpkresults.US_noCR(:,1))==0));
allSpkresults.sem_US_CR = nanstd(allSpkresults.US_CR,1)/sqrt(sum(isnan(allSpkresults.US_CR(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noCR = nanstd(allSpkresults.USonly_noCR,1)/sqrt(sum(isnan(allSpkresults.USonly_noCR(:,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-10 2])

figname = sprintf('Trained_US-supp_USonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_US-supp_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Trained_allSpkresults.mat','alltraces');

%% CR+ vs CR-

timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR+allSpkresults.sem_US_noCR,'b');
plot(timeX,allSpkresults.avg_US_noCR-allSpkresults.sem_US_noCR,'b');

plot(timeX,allSpkresults.avg_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR+allSpkresults.sem_US_CR,'g');
plot(timeX,allSpkresults.avg_US_CR-allSpkresults.sem_US_CR,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-10 2])

figname = sprintf('Trained_US-supp_CRvsnoCR.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Trained_US-supp_CRvsnoCR.pdf');
print('-dpdf','-painters','-loose',figname);

