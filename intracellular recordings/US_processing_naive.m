%% Analyze and calculate statistics of the US responses
% Analyze US responses. Requires preprocessed output from the main CS electrophysiology
% scripts.
% (c) R. Broersen, Erasmus MC, 2023

% Manually load the ephys .mat output file for each naive neuron

Spkdata.fs  = 100000;
traces=[];

%% Gather the trial data
try
    Spkresults.US_trials = [Spkresults.ind_data_USonly; Spkresults.ind_data_paired];
catch
    Spkresults.US_trials = [Spkresults.ind_data_paired];
end
Spkresults.US_trials_noEO = [Spkresults.ind_data_paired_normal];
Spkresults.US_trials_EO = [Spkresults.ind_data_paired_EO];
try
    Spkresults.USonly_trials = [Spkresults.ind_data_USonly];
end

%% Filter the US trialdata using a median filter
for ii=1:size(Spkresults.US_trials,1)
    Spkresults.US_trials_mdn(ii,:) = movmedian(Spkresults.US_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_noEO,1)
    Spkresults.US_trials_noEO_mdn(ii,:) = movmedian(Spkresults.US_trials_noEO(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_EO,1)
    Spkresults.US_trials_EO_mdn(ii,:) = movmedian(Spkresults.US_trials_EO(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
try
    for ii=1:size(Spkresults.USonly_trials,1)
        Spkresults.USonly_trials_mdn(ii,:) = movmedian(Spkresults.USonly_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
    end
end

%% Exclude trials if they have insufficient quality (enable based on which neuron is analyzed)
%020516_1
% Spkresults.US_exclude_trials = [1 34];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end

%120516_2
% No traces excluded

%130716_1
% No traces excluded

% % 070917_1
% Spkresults.US_exclude_trials = [7 12];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end

% %070917_2
% Spkresults.US_exclude_trials = [3 5 12];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end

%060417_3
% Spkresults.US_exclude_trials = [8 10 16 29 30 31 34];
% for ii = 1:length(Spkresults.US_exclude_trials)
% Spkresults.US_trials_mdn(Spkresults.US_exclude_trials(ii),:)=NaN;
% end


%% Normalize traces to 250ms before onset CS
for ii=1:size(Spkresults.US_trials_mdn,1)
    Spkresults.US_trials_mdn_norm(ii,:) = Spkresults.US_trials_mdn(ii,:)-nanmean(Spkresults.US_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

for ii=1:size(Spkresults.US_trials_noEO_mdn,1)
    Spkresults.US_trials_noEO_mdn_norm(ii,:) = Spkresults.US_trials_noEO_mdn(ii,:)-nanmean(Spkresults.US_trials_noEO_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

for ii=1:size(Spkresults.US_trials_EO_mdn,1)
    Spkresults.US_trials_EO_mdn_norm(ii,:) = Spkresults.US_trials_EO_mdn(ii,:)-nanmean(Spkresults.US_trials_EO_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
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

%noEO
Spkresults.amp_US_noEO = [];
Spkresults.peaktime_US_noEO=[];
ampidx=[];
for ii=1:size(Spkresults.US_trials_noEO_mdn,1)
    if isnan(Spkresults.US_trials_noEO_mdn_norm(ii,1))==0
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        if abs(ampidx(1))>abs(ampidx(2))
            Spkresults.amp_US_noEO(ii)=ampidx(1);
            Spkresults.peaktime_US_noEO(ii) = amptime(1);
        elseif abs(ampidx(2))>abs(ampidx(1))
            Spkresults.amp_US_noEO(ii)=ampidx(2);
            Spkresults.peaktime_US_noEO(ii) = amptime(2);
        end
    else
        Spkresults.amp_US_noEO(ii)=NaN;
        Spkresults.peaktime_US_noEO(ii) = NaN;
    end
end

Spkresults.avg_amp_US_noEO = nanmean(Spkresults.amp_US_noEO);
Spkresults.mdn_amp_US_noEO = nanmedian(Spkresults.amp_US_noEO);
Spkresults.avg_peaktime_US_noEO= round(nanmean(Spkresults.peaktime_US_noEO))/Spkdata.fs;
Spkresults.mdn_peaktime_US_noEO = round(nanmedian(Spkresults.peaktime_US_noEO))/Spkdata.fs;

%EO
Spkresults.amp_US_EO = [];
Spkresults.peaktime_US_EO=[];
ampidx=[];
for ii=1:size(Spkresults.US_trials_EO_mdn,1)
    if isnan(Spkresults.US_trials_EO_mdn_norm(ii,1))==0
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_EO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_EO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        if abs(ampidx(1))>abs(ampidx(2))
            Spkresults.amp_US_EO(ii)=ampidx(1);
            Spkresults.peaktime_US_EO(ii) = amptime(1);
        elseif abs(ampidx(2))>abs(ampidx(1))
            Spkresults.amp_US_EO(ii)=ampidx(2);
            Spkresults.peaktime_US_EO(ii) = amptime(2);
        end
    else
        Spkresults.amp_US_EO(ii)=NaN;
        Spkresults.peaktime_US_EO(ii) = NaN;
    end
end

Spkresults.avg_amp_US_EO = nanmean(Spkresults.amp_US_EO);
Spkresults.mdn_amp_US_EO = nanmedian(Spkresults.amp_US_EO);
Spkresults.avg_peaktime_US_EO= round(nanmean(Spkresults.peaktime_US_EO))/Spkdata.fs;
Spkresults.mdn_peaktime_US_EO = round(nanmedian(Spkresults.peaktime_US_EO))/Spkdata.fs;

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
    %US only + paired EO- trials
    Spkresults.amp_USonly_noEO = [];
    Spkresults.peaktime_USonly_noEO=[];
    ampidx=[];
    try
        Spkresults.US_trials_USonly_noEO_mdn_norm = [Spkresults.USonly_trials_mdn_norm; Spkresults.US_trials_noEO_mdn_norm];
    catch
        try
            Spkresults.US_trials_USonly_noEO_mdn_norm = [Spkresults.US_trials_noEO_mdn_norm];
        catch
            Spkresults.US_trials_USonly_noEO_mdn_norm = [Spkresults.USonly_trials_mdn_norm];
        end
    end
    for ii=1:size(Spkresults.US_trials_USonly_noEO_mdn_norm,1)
        if isnan(Spkresults.US_trials_USonly_noEO_mdn_norm(ii,1))==0
            [ampidx(1) amptime(1)]=max(Spkresults.US_trials_USonly_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            [ampidx(2) amptime(2)]=min(Spkresults.US_trials_USonly_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
            if abs(ampidx(1))>abs(ampidx(2))
                Spkresults.amp_USonly_noEO(ii)=ampidx(1);
                Spkresults.peaktime_USonly_noEO(ii) = amptime(1);
            elseif abs(ampidx(2))>abs(ampidx(1))
                Spkresults.amp_USonly_noEO(ii)=ampidx(2);
                Spkresults.peaktime_USonly_noEO(ii) = amptime(2);
            end
        else
            Spkresults.amp_USonly_noEO(ii)=NaN;
            Spkresults.peaktime_USonly_noEO(ii) = NaN;
        end
    end

    Spkresults.avg_amp_USonly_noEO = nanmean(Spkresults.amp_USonly_noEO);
    Spkresults.mdn_amp_USonly_noEO = nanmedian(Spkresults.amp_USonly_noEO);
    Spkresults.avg_peaktime_USonly_noEO= round(nanmean(Spkresults.peaktime_USonly_noEO))/Spkdata.fs;
    Spkresults.mdn_peaktime_USonly_noEO = round(nanmedian(Spkresults.peaktime_USonly_noEO))/Spkdata.fs;
catch
    disp('US only trials+EO- error amp calculation')
    Spkresults.avg_amp_USonly_noEO = NaN;
    Spkresults.mdn_amp_USonly_noEO = NaN;
    Spkresults.avg_peaktime_USonly_noEO= NaN;
    Spkresults.mdn_peaktime_USonly_noEO = NaN;
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


% No EO _noEO
Spkresults.AUC_US_noEO=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_noEO_mdn_norm,1)
    if isnan(Spkresults.US_trials_noEO_mdn_norm(ii,1))==0
        Spkresults.AUC_US_noEO(ii)=nansum(Spkresults.US_trials_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    end
end

Spkresults.avg_AUC_US_noEO = nanmean(Spkresults.AUC_US_noEO);
Spkresults.mdn_AUC_US_noEO = nanmedian(Spkresults.AUC_US_noEO);

% EO
Spkresults.AUC_US_EO=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_EO_mdn_norm,1)
    if isnan(Spkresults.US_trials_EO_mdn_norm(ii,1))==0
        Spkresults.AUC_US_EO(ii)=nansum(Spkresults.US_trials_EO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    end
end

Spkresults.avg_AUC_US_EO = nanmean(Spkresults.AUC_US_EO);
Spkresults.mdn_AUC_US_EO = nanmedian(Spkresults.AUC_US_EO);

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
    % US only + EO- trials
    Spkresults.AUC_USonly_noEO=[];
    AUCidx=[];
    for ii=1:size(Spkresults.US_trials_USonly_noEO_mdn_norm,1)
        if isnan(Spkresults.US_trials_USonly_noEO_mdn_norm(ii,1))==0
            Spkresults.AUC_USonly_noEO(ii)=nansum(Spkresults.US_trials_USonly_noEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        end
    end

    Spkresults.avg_AUC_USonly_noEO = nanmean(Spkresults.AUC_USonly_noEO);
    Spkresults.mdn_AUC_USonly_noEO = nanmedian(Spkresults.AUC_USonly_noEO);
catch
    disp('Error AUC US only_noEO trials')

    Spkresults.avg_AUC_USonly_noEO = NaN;
    Spkresults.mdn_AUC_USonly_noEO= NaN;
end

%% Generate average trace
Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
Spkresults.avgtrace_US_noEO = nanmean(Spkresults.US_trials_noEO_mdn_norm,1);
Spkresults.avgtrace_US_EO = nanmean(Spkresults.US_trials_EO_mdn_norm,1);
try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
Spkresults.avgtrace_USonly_noEO = nanmean(Spkresults.US_trials_USonly_noEO_mdn_norm,1);

figure; hold on; plot(Spkresults.avgtrace_US,'k');
plot(Spkresults.avgtrace_US_noEO,'b'); plot(Spkresults.avgtrace_US_EO,'g');
try; plot(Spkresults.avgtrace_USonly,'m'); end; plot(Spkresults.avgtrace_USonly_noEO,'c')
xlim([0.75*Spkdata.fs 1.25*Spkdata.fs]); legend('US trials','Paired noEO','Paired EO','USonly','USonly + paired noEO')

%% Save figures (enable based on which neuron is analyzed)
% figname = sprintf('Naive_020516_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_020516_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
%
%
% figname = sprintf('Naive_120516_2_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_120516_2_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
%
%
% figname = sprintf('Naive_130716_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_130716_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
%
% figname = sprintf('Naive_070917_1_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_070917_1_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
%
% figname = sprintf('Naive_070917_2_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_070917_2_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);
%
% figname = sprintf('Naive_060417_3_USSpkresults.fig')
% saveas(gcf,figname,'fig');
% figname = sprintf('Naive_060417_3_USSpkresults.pdf');
% print('-dpdf','-painters','-loose',figname);


%% Excel stats

% naive
excelvars=[Spkresults.avg_amp_US Spkresults.avg_amp_USonly Spkresults.avg_amp_US_EO Spkresults.avg_amp_US_noEO Spkresults.avg_amp_USonly_noEO...
    Spkresults.avg_peaktime_US*1000 Spkresults.avg_peaktime_USonly*1000 Spkresults.avg_peaktime_US_EO*1000 Spkresults.avg_peaktime_US_noEO*1000 Spkresults.avg_peaktime_USonly_noEO*1000 ...
    Spkresults.avg_AUC_US Spkresults.avg_AUC_USonly Spkresults.avg_AUC_US_EO Spkresults.avg_AUC_US_noEO Spkresults.avg_AUC_USonly_noEO];

% excelvars=[Spkresults.avg_amp_US Spkresults.avg_amp_USonly Spkresults.avg_amp_US_EO NaN Spkresults.avg_amp_USonly_noEO...
%     Spkresults.avg_peaktime_US*1000 Spkresults.avg_peaktime_USonly*1000 Spkresults.avg_peaktime_US_EO*1000 NaN Spkresults.avg_peaktime_USonly_noEO*1000 ...
%     Spkresults.avg_AUC_US Spkresults.avg_AUC_USonly Spkresults.avg_AUC_US_EO NaN Spkresults.avg_AUC_USonly_noEO]


%% Load all traces files in order of excel sheet and copy the averages in one mat variable

allSpkresults.US = NaN(15,200000);
allSpkresults.US_noEO = NaN(15,200000);
allSpkresults.US_EO = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noEO = NaN(15,200000);

cd('[path]')
% add each cell
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

    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noEO = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_EO = nanmean(Spkresults.US_trials_SEO_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noEO = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noEO(ii,1:length(Spkresults.avgtrace_US_noEO)) = Spkresults.avgtrace_US_noEO; end
    try allSpkresults.US_EO(ii,1:length(Spkresults.avgtrace_US_EO)) = Spkresults.avgtrace_US_EO; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noEO(ii,1:length(Spkresults.avgtrace_USonly_noEO)) = Spkresults.avgtrace_USonly_noEO; end

end

allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noEO = nanmean(allSpkresults.US_noEO,1);
allSpkresults.avg_US_EO = nanmean(allSpkresults.US_EO,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noEO = nanmean(allSpkresults.USonly_noEO,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noEO = nanstd(allSpkresults.US_noEO,1)/sqrt(sum(isnan(allSpkresults.US_noEO(:,1))==0));
allSpkresults.sem_US_EO = nanstd(allSpkresults.US_EO,1)/sqrt(sum(isnan(allSpkresults.US_EO(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noEO = nanstd(allSpkresults.USonly_noEO,1)/sqrt(sum(isnan(allSpkresults.USonly_noEO(:,1))==0));

cd('[path]')
timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Naive_allUSonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Naive_allSpkresults.mat','alltraces');

%% EO+ vs EO-

timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO+allSpkresults.sem_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO-allSpkresults.sem_US_noEO,'b');

plot(timeX,allSpkresults.avg_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO+allSpkresults.sem_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO-allSpkresults.sem_US_EO,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Naive_allUS_EOvsnoEO.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_allUS_EOvsnoEO.pdf');
print('-dpdf','-painters','-loose',figname);

%% Only US-activated cells

allSpkresults.US = NaN(15,200000);
allSpkresults.US_noEO = NaN(15,200000);
allSpkresults.US_EO = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noEO = NaN(15,200000);

cd('[path]')
% add each cell
for ii=1:12
    ii

    if ii==1
        load('Results_ephys_CSandUS_2104161.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_2104161 (2).mat')
    elseif ii==3
        load('Results_ephys_CSandUS_2804162.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_0505161.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_0407163.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_0807162.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_1403172.mat')
    elseif ii==8
        load('Results_ephys_CSandUS_2108172.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2108172 (2).mat')
    elseif ii==10
        load('Results_ephys_CSandUS_2003171 (2).mat')
    elseif ii==11
        load('Results_ephys_CSandUS_0807162 (2).mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2003174.mat')

    end

    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noEO = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_EO = nanmean(Spkresults.US_trials_SEO_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noEO = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noEO(ii,1:length(Spkresults.avgtrace_US_noEO)) = Spkresults.avgtrace_US_noEO; end
    try allSpkresults.US_EO(ii,1:length(Spkresults.avgtrace_US_EO)) = Spkresults.avgtrace_US_EO; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noEO(ii,1:length(Spkresults.avgtrace_USonly_noEO)) = Spkresults.avgtrace_USonly_noEO; end

end

cd('[path]')
allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noEO = nanmean(allSpkresults.US_noEO,1);
allSpkresults.avg_US_EO = nanmean(allSpkresults.US_EO,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noEO = nanmean(allSpkresults.USonly_noEO,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noEO = nanstd(allSpkresults.US_noEO,1)/sqrt(sum(isnan(allSpkresults.US_noEO(:,1))==0));
allSpkresults.sem_US_EO = nanstd(allSpkresults.US_EO,1)/sqrt(sum(isnan(allSpkresults.US_EO(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noEO = nanstd(allSpkresults.USonly_noEO,1)/sqrt(sum(isnan(allSpkresults.USonly_noEO(:,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 8])

figname = sprintf('Naive_US-activated_USonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_US-activated_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Naive_allSpkresults.mat','alltraces');

%% EO+ vs EO-

US_activated_naive = [1;0;0;0;0;1;0;1;1;0;0;1;0;1;0];
US_activated_naive = logical(US_activated_naive);

allSpkresults.avg_US = nanmean(allSpkresults.US(US_activated_naive,:),1);
allSpkresults.avg_US_noEO = nanmean(allSpkresults.US_noEO(US_activated_naive,:),1);
allSpkresults.avg_US_EO = nanmean(allSpkresults.US_EO(US_activated_naive,:),1);
allSpkresults.avg_USonly_noEO = nanmean(allSpkresults.USonly_noEO(US_activated_naive,:),1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(US_activated_naive,1))==0));
allSpkresults.sem_US_noEO = nanstd(allSpkresults.US_noEO,1)/sqrt(sum(isnan(allSpkresults.US_noEO(US_activated_naive,1))==0));
allSpkresults.sem_US_EO = nanstd(allSpkresults.US_EO,1)/sqrt(sum(isnan(allSpkresults.US_EO(US_activated_naive,1))==0));
allSpkresults.sem_USonly_noEO = nanstd(allSpkresults.USonly_noEO,1)/sqrt(sum(isnan(allSpkresults.USonly_noEO(US_activated_naive,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO+allSpkresults.sem_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO-allSpkresults.sem_US_noEO,'b');

plot(timeX,allSpkresults.avg_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO+allSpkresults.sem_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO-allSpkresults.sem_US_EO,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-2 10])

figname = sprintf('Naive_US-activated_EOvsnoEO_statspairs.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_US-activated_EOvsnoEO_statspairs.pdf');
print('-dpdf','-painters','-loose',figname);


%% Only US-suppressed

allSpkresults.US = NaN(15,200000);
allSpkresults.US_noEO = NaN(15,200000);
allSpkresults.US_EO = NaN(15,200000);
allSpkresults.USonly = NaN(15,200000);
allSpkresults.USonly_noEO = NaN(15,200000);

cd('[path]')
% add each cell
for ii=1
    ii

    if ii==1
        load('Results_ephys_CSandUS_2804163.mat')
    end
    Spkresults.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
    Spkresults.avgtrace_US_noEO = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
    Spkresults.avgtrace_US_EO = nanmean(Spkresults.US_trials_SEO_mdn_norm,1);
    try; Spkresults.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1); end;
    Spkresults.avgtrace_USonly_noEO = nanmean([Spkresults.USonly_trials_mdn_norm;Spkresults.US_trials_normal_mdn_norm],1);

    try allSpkresults.US(ii,1:length(Spkresults.avgtrace_US)) = Spkresults.avgtrace_US; end
    try allSpkresults.US_noEO(ii,1:length(Spkresults.avgtrace_US_noEO)) = Spkresults.avgtrace_US_noEO; end
    try allSpkresults.US_EO(ii,1:length(Spkresults.avgtrace_US_EO)) = Spkresults.avgtrace_US_EO; end
    try allSpkresults.USonly(ii,1:length(Spkresults.avgtrace_USonly)) = Spkresults.avgtrace_USonly; end
    try allSpkresults.USonly_noEO(ii,1:length(Spkresults.avgtrace_USonly_noEO)) = Spkresults.avgtrace_USonly_noEO; end

end

cd('[path]')
allSpkresults.avg_US = nanmean(allSpkresults.US,1);
allSpkresults.avg_US_noEO = nanmean(allSpkresults.US_noEO,1);
allSpkresults.avg_US_EO = nanmean(allSpkresults.US_EO,1);
allSpkresults.avg_USonly = nanmean(allSpkresults.USonly,1);
allSpkresults.avg_USonly_noEO = nanmean(allSpkresults.USonly_noEO,1);

allSpkresults.sem_US = nanstd(allSpkresults.US,1)/sqrt(sum(isnan(allSpkresults.US(:,1))==0));
allSpkresults.sem_US_noEO = nanstd(allSpkresults.US_noEO,1)/sqrt(sum(isnan(allSpkresults.US_noEO(:,1))==0));
allSpkresults.sem_US_EO = nanstd(allSpkresults.US_EO,1)/sqrt(sum(isnan(allSpkresults.US_EO(:,1))==0));
allSpkresults.sem_USonly = nanstd(allSpkresults.USonly,1)/sqrt(sum(isnan(allSpkresults.USonly(:,1))==0));
allSpkresults.sem_USonly_noEO = nanstd(allSpkresults.USonly_noEO,1)/sqrt(sum(isnan(allSpkresults.USonly_noEO(:,1))==0));


timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_USonly,'k');
plot(timeX,allSpkresults.avg_USonly+allSpkresults.sem_USonly,'k');
plot(timeX,allSpkresults.avg_USonly-allSpkresults.sem_USonly,'k');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-10 2])

figname = sprintf('Naive_US-supp_USonly.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_US-supp_allUSonly.pdf');
print('-dpdf','-painters','-loose',figname);

% save('Naive_allSpkresults.mat','alltraces');

%% EO+ vs EO-

timeX= linspace(0,2,200000);

figure; hold on; plot(timeX,allSpkresults.avg_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO+allSpkresults.sem_US_noEO,'b');
plot(timeX,allSpkresults.avg_US_noEO-allSpkresults.sem_US_noEO,'b');

plot(timeX,allSpkresults.avg_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO+allSpkresults.sem_US_EO,'g');
plot(timeX,allSpkresults.avg_US_EO-allSpkresults.sem_US_EO,'g');

xlim([0.7 1.25]);

line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.76 0.76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

ylim([-10 2])

figname = sprintf('Naive_US-supp_EOvsnoEO.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_US-supp_EOvsnoEO.pdf');
print('-dpdf','-painters','-loose',figname);
