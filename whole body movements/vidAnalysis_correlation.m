%% Analysis of whole-body movements
% This script is used to analyze camera recordings from mice conditioned or
% pseudo-conditioned to quantify whole-body movements. Specifically, it
% analyses videos acquired at day 1 and day 10 of (pseudo-)conditioning.

% (c) R. Broersen, Erasmus MC, 2023

% Detect CS onsets
CS_LED_idx = find(R.rawCS>(4.36*10^5));
idx_CS_sum_diff = diff(CS_LED_idx);
CS_LED_idx_diff = find(idx_CS_sum_diff>200);

figure; ax(1)=subplot(2,1,1);hold on;  plot(R.rawCS,'r'); ax(2)=subplot(2,1,2); hold on; plot(R.rawCS_diff,'b'); linkaxes(ax,'x');
plot(P.trial_timestamps_paired,repmat(0.6*10^4,[1 length(P.trial_timestamps_paired)]),'k*')
plot(P.trial_timestamps_CSonly,repmat(15000,[1 length(P.trial_timestamps_CSonly)]),'r*')

% Automatically detect the timings
P.trial_timestamps = [];
for ii=1:length(CS_LED_idx_diff)+1
    if ii==1
        P.trial_timestamps = CS_LED_idx(1);
    elseif ii>1
        P.trial_timestamps(ii) = CS_LED_idx(CS_LED_idx_diff(ii-1)+1);
    end
end
P.trial_timestamps = [P.startFrame P.trial_timestamps];

% Conditioned
P.trial_timestamps_USonly = P.trial_timestamps(1);
idx = [1:220]; idx([1 12:11:220])=[];
P.trial_timestamps_paired = P.trial_timestamps(idx)';
idx = [12:11:length(P.trial_timestamps)];
P.trial_timestamps_CSonly = P.trial_timestamps(idx)';

P.trial_timestamps_USonly = P.startFrame-round(0.75*P.framerate);
% P.trial_timestamps_USonly = [];
P.trial_timestamps_paired = P.trial_timestamps_paired-round(0.5*P.framerate);
P.trial_timestamps_CSonly = P.trial_timestamps_CSonly-round(0.5*P.framerate);

%% Normalize the movement trace to the median and maximum
R.normMov = R.rawMovement-nanmedian(1:(2000*P.framerate));
R.normMov = R.normMov/nanmax(R.normMov(1:(2000*P.framerate)));

%% Cut the movement trace into epochs

R.pairedtrial_mov = [];
figure; hold on;
%CS trials (paired)
for ii = 1:size(P.trial_timestamps_paired,1)
    try
        R.pairedtrial_mov(ii,:)= R.normMov(P.trial_timestamps_paired(ii):P.trial_timestamps_paired(ii)+round(2*P.framerate));
        R.pairedtrial_mov(ii,:)= R.pairedtrial_mov(ii,:)-nanmean(R.pairedtrial_mov(ii,1:(0.5*P.framerate)));
        plot(R.pairedtrial_mov(ii,:))
    catch
        R.pairedtrial_mov(ii,:)=NaN;
    end
    % pause;
end

plot(nanmean(R.pairedtrial_mov),'k','LineWidth',2);
plot(nanmedian(R.pairedtrial_mov),'g','LineWidth',2);
line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
title('Paired trials')

R.CSonlytrial_mov = [];
figure; hold on;
%CS trials (CSonly)
%     for ii = 1:size(P.trial_timestamps_CSonly,2)
for ii = 1:size(P.trial_timestamps_CSonly,1)
    try
        R.CSonlytrial_mov(ii,:)= R.normMov(P.trial_timestamps_CSonly(ii):P.trial_timestamps_CSonly(ii)+round(2*P.framerate));
        R.CSonlytrial_mov(ii,:)= R.CSonlytrial_mov(ii,:)-nanmean(R.CSonlytrial_mov(ii,1:(0.5*P.framerate)));
        plot(R.CSonlytrial_mov(ii,:))
    catch
        R.CSonlytrial_mov(ii,:)=NaN;
    end

    % pause;
end

plot(nanmean(R.CSonlytrial_mov),'k','LineWidth',2);
plot(nanmedian(R.CSonlytrial_mov),'g','LineWidth',2);
line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
title('CSonly trials')

R.USonlytrial_mov = [];
figure; hold on;
%US trials (USonly)

for ii = 1:size(P.trial_timestamps_USonly,1)
    try
        R.USonlytrial_mov(ii,:)= R.normMov(P.trial_timestamps_USonly(ii):P.trial_timestamps_USonly(ii)+round(2*P.framerate));
        R.USonlytrial_mov(ii,:)= R.USonlytrial_mov(ii,:)-nanmean(R.USonlytrial_mov(ii,1:(0.5*P.framerate)));
        plot(R.USonlytrial_mov(ii,:))
        % pause;
    catch
        R.USonlytrial_mov(ii,:)=NaN;
    end
end

plot(nanmean(R.USonlytrial_mov),'k','LineWidth',2);
line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
title('USonly trials')

R.CStrial_mov = [R.pairedtrial_mov; R.CSonlytrial_mov];
try
    R.UStrial_mov = [R.pairedtrial_mov; R.USonlytrial_mov];
catch
    R.UStrial_mov = [R.pairedtrial_mov];
end

%% Calculate the averages

S.CStrial_avg = nanmean(R.CStrial_mov);
S.CSonlytrial_avg = nanmean(R.CSonlytrial_mov);
S.UStrial_avg = nanmean(R.UStrial_mov);
S.pairedtrial_avg = nanmean(R.pairedtrial_mov);
S.USonly_avg = R.USonlytrial_mov;

S.CStrial_sd = nanstd(R.CStrial_mov);
S.UStrial_sd = nanstd(R.UStrial_mov);
S.CSonlytrial_sd = nanstd(R.CSonlytrial_mov);
S.pairedtrial_sd = nanstd(R.pairedtrial_mov);


S.CStrial_sem = nanstd(R.CStrial_mov)/sqrt(size(R.CStrial_mov,1));
S.UStrial_sem = nanstd(R.UStrial_mov)/sqrt(size(R.UStrial_mov,1));
S.pairedtrial_sem = nanstd(R.pairedtrial_mov)/sqrt(size(R.pairedtrial_mov,1));
S.CSonlytrial_sem = nanstd(R.CSonlytrial_mov)/sqrt(size(R.CSonlytrial_mov,1));

S.CStrial_CSamp =[];
S.CStrial_CSAUC =[];
for ii=1:size(R.CStrial_mov,1)
    S.CStrial_CSamp(ii) = nanmax(R.CStrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    S.CStrial_CSAUC(ii) = nansum(R.CStrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
end
S.CStrial_CSamp_avg = nanmean(S.CStrial_CSamp);
S.CStrial_CSAUC_avg = nanmean(S.CStrial_CSAUC);

S.CSonlytrial_CSamp =[];
S.CSonlytrial_CSAUC =[];
for ii=1:size(R.CSonlytrial_mov,1)
    S.CSonlytrial_CSamp(ii) = nanmax(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    S.CSonlytrial_CSAUC(ii) = nansum(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
end
S.CSonlytrial_CSamp_avg = nanmean(S.CSonlytrial_CSamp);
S.CSonlytrial_CSAUC_avg = nanmean(S.CSonlytrial_CSAUC);

S.CSonlytrial_CSamp_longwindow =[];
S.CSonlytrial_CSAUC_longwindow =[];
for ii=1:size(R.CSonlytrial_mov,1)
    S.CSonlytrial_CSamp_longwindow(ii) = nanmax(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(1*P.framerate)));
    S.CSonlytrial_CSAUC_longwindow(ii) = nansum(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(1*P.framerate)));
end
S.CSonlytrial_CSamp_longwindow_avg = nanmean(S.CSonlytrial_CSamp_longwindow);
S.CSonlytrial_CSAUC_longwindow_avg = nanmean(S.CSonlytrial_CSAUC_longwindow);

S.UStrial_USamp =[];
S.UStrial_USAUC =[];
for ii=1:size(R.UStrial_mov,1)
    S.UStrial_USamp(ii) = nanmax(R.UStrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
    S.UStrial_USAUC(ii) = nansum(R.UStrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
end
S.UStrial_USamp_avg = nanmean(S.UStrial_USamp);
S.UStrial_USAUC_avg = nanmean(S.UStrial_USAUC);
%         S.UStrial_USamp_avg = NaN;
%     S.UStrial_USAUC_avg = NaN;

S.pairedtrial_CSamp =[];
S.pairedtrial_CSAUC =[];
for ii=1:size(R.pairedtrial_mov,1)
    S.pairedtrial_CSamp(ii) = nanmax(R.pairedtrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    S.pairedtrial_CSAUC(ii) = nansum(R.pairedtrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
end
S.pairedtrial_CSamp_avg = nanmean(S.pairedtrial_CSamp);
S.pairedtrial_CSAUC_avg = nanmean(S.pairedtrial_CSAUC);

S.pairedtrial_USamp =[];
S.pairedtrial_USAUC =[];
for ii=1:size(R.pairedtrial_mov,1)
    S.pairedtrial_USamp(ii) = nanmax(R.pairedtrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
    S.pairedtrial_USAUC(ii) = nansum(R.pairedtrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
end
S.pairedtrial_USamp_avg = nanmean(S.pairedtrial_USamp);
S.pairedtrial_USAUC_avg = nanmean(S.pairedtrial_USAUC);


S.USonly_USamp =[];
S.USonly_USAUC =[];
try
    for ii=1:size(R.USonlytrial_mov,1)
        S.USonly_USamp(ii) = nanmax(R.USonlytrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
        S.USonly_USAUC(ii) = nansum(R.USonlytrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
    end
    S.USonly_USamp_avg = nanmean(S.USonly_USamp);
    S.USonly_USAUC_avg = nanmean(S.USonly_USAUC);
end


%% Detect and measure CRs
EBC.traces=[];
% !!! Manually copy and paste the individual trial data from the eyeblink
% acquisition program output

%Gather paired data
EBC.traces_paired=EBC.traces;

EBC.traces_paired([1:12:240],:)=NaN;
EBC.traces_paired([12:12:240],:)=NaN;
EBC.traces_paired(isnan(EBC.traces_paired(:,1))==1,:)=[];


figure; hold on;
for ii=1:size(EBC.traces_paired,1)
    % normalize
    EBC.traces_paired(ii,:)=EBC.traces_paired(ii,:)-nanmean(EBC.traces_paired(ii,1:500));
    plot(EBC.traces_paired(ii,:));

    EBC.URamp(ii) = nanmax(EBC.traces_paired(ii,750:1000));
end

EBC.URamp_avg = nanmean(EBC.URamp);
line([500 500],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([750 750],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

% normalize
EBC.traces_paired=EBC.traces_paired./EBC.URamp_avg;

%detect CRs and calc amps
EBC.CRamp_paired = [];
for ii=1:size(EBC.traces_paired,1)
    if nanmax(EBC.traces_paired(ii,500:750))>0.1
        EBC.CRamp_paired(ii)=nanmax(EBC.traces_paired(ii,500:750));
    else
        EBC.CRamp_paired(ii)= NaN;
    end

end
EBC.CRamp_paired_avg = nanmean(EBC.CRamp_paired);

% normalize to max
EBC.CRamp_paired_norm = EBC.CRamp_paired./nanmax(EBC.CRamp_paired);
EBC.CRamp_paired_norm = EBC.CRamp_paired_norm';

%% CS only
%Gather CSonly data
EBC.traces_CSonly=EBC.traces;
EBC.traces_CSonly = EBC.traces_CSonly([12:12:240],:);

figure; hold on;
for ii=1:size(EBC.traces_CSonly,1)
    % normalize
    EBC.traces_CSonly(ii,:)=EBC.traces_CSonly(ii,:)-nanmean(EBC.traces_CSonly(ii,1:500));
    plot(EBC.traces_CSonly(ii,:));
end
line([500 500],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([750 750],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

% normalize
EBC.traces_CSonly=EBC.traces_CSonly./EBC.URamp_avg;

%detect CRs and calc amps
EBC.CRamp_CSonly = [];
for ii=1:size(EBC.traces_CSonly,1)
    if nanmax(EBC.traces_CSonly(ii,500:1000))>0.1
        EBC.CRamp_CSonly(ii)=nanmax(EBC.traces_CSonly(ii,500:750));
    else
        EBC.CRamp_CSonly(ii)= NaN;
    end

end
EBC.CRamp_CSonly_avg = nanmean(EBC.CRamp_CSonly);

% normalize to max
EBC.CRamp_CSonly_norm = EBC.CRamp_CSonly./nanmax(EBC.CRamp_CSonly);
EBC.CRamp_CSonly_norm=EBC.CRamp_CSonly_norm';

%% Correlate eyelid movements with CS only AUC
S.pairedtrial_CSAUC_norm = S.pairedtrial_CSAUC./nanmax(S.pairedtrial_CSAUC);
S.pairedtrial_CSAUC_norm =     S.pairedtrial_CSAUC_norm';
S.CSonlytrial_CSAUC_norm = S.CSonlytrial_CSAUC./nanmax(S.CSonlytrial_CSAUC);
S.CSonlytrial_CSAUC_norm = S.CSonlytrial_CSAUC_norm';

figure; hold on; title('paired trials')
plot(S.pairedtrial_CSAUC_norm,EBC.CRamp_paired_norm,'bo'); xlabel('Movement index AUC'); ylabel('CR amplitude')
% [R,P] = corrcoef(S.pairedtrial_CSAUC_norm,EBC.CRamp_paired_norm);

figure; hold on; title('CSonly trials')
plot(S.CSonlytrial_CSAUC_norm,EBC.CRamp_CSonly_norm,'bo'); xlabel('Movement index AUC'); ylabel('CR amplitude')

EBC.corrCRtrials=[];
EBC.corrCRtrials(:,1) =[EBC.CRamp_paired_norm; EBC.CRamp_CSonly_norm];
EBC.corrCRtrials(:,2) =[S.pairedtrial_CSAUC_norm; S.CSonlytrial_CSAUC_norm];

P.savename = sprintf('%s_dataCorr.mat',P.mouseID);
save(P.savename,'P','S','R','EBC',"-v7.3");
