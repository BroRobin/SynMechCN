%% Calculate statistics of the CS responses
% Calculate the amplitude of the Vm responses after the CS. Separate trials
% based on CR, NR and EO (SEO). Calculate the area under the curve (AUC) of the Vm
% responses for different periods after the CS. Create a summary variable.
% (c) R. Broersen, Erasmus MC, 2023

% Amplitude and peaktime during CS-US interval (trial by trial, 550-750ms)
Spkresults.amp_CS = [];
Spkresults.peaktime_CS=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.CS_trials_mdn_norm,1)
    if isnan(Spkresults.CS_trials_mdn_norm(ii,1))==0
        % CS period
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs)); % Amplitude calculated between 550 and 750 ms after start of the trial (50 to 250 ms following the CS)
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS(ii)=ampidx(1);
            Spkresults.peaktime_CS(ii) = (amptime(1)/Spkdata.fs)+0.55;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS(ii)=ampidx(2);
            Spkresults.peaktime_CS(ii) = (amptime(2)/Spkdata.fs)+0.55;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_baseline(ii)=ampidx(1);
            Spkresults.peaktime_CS_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_baseline(ii)=ampidx(2);
            Spkresults.peaktime_CS_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_CS(ii)=NaN;
        Spkresults.peaktime_CS(ii) = NaN;
        Spkresults.amp_CS_baseline(ii)=NaN;
        Spkresults.peaktime_CS_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_CS = nanmean(Spkresults.amp_CS);
Spkresults.mdn_amp_CS = nanmedian(Spkresults.amp_CS);
Spkresults.avg_peaktime_CS= nanmean(Spkresults.peaktime_CS);
Spkresults.mdn_peaktime_CS = nanmedian(Spkresults.peaktime_CS);

%CR
Spkresults.amp_CS_CR = [];
Spkresults.peaktime_CS_CR=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.CS_trials_CR_mdn_norm,1)
    if isnan(Spkresults.CS_trials_CR_mdn_norm(ii,1))==0
        % CS period
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_CR_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_CR_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_CR(ii)=ampidx(1);
            Spkresults.peaktime_CS_CR(ii) = (amptime(1)/Spkdata.fs)+0.55;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_CR(ii)=ampidx(2);
            Spkresults.peaktime_CS_CR(ii) = (amptime(2)/Spkdata.fs)+0.55;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_CR_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_CR_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_CR_baseline(ii)=ampidx(1);
            Spkresults.peaktime_CS_CR_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_CR_baseline(ii)=ampidx(2);
            Spkresults.peaktime_CS_CR_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_CS_CR(ii)=NaN;
        Spkresults.peaktime_CS_CR(ii) = NaN;
        Spkresults.amp_CS_CR_baseline(ii)=NaN;
        Spkresults.peaktime_CS_CR_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_CS_CR = nanmean(Spkresults.amp_CS_CR);
Spkresults.mdn_amp_CS_CR = nanmedian(Spkresults.amp_CS_CR);
Spkresults.avg_peaktime_CS_CR= nanmean(Spkresults.peaktime_CS_CR);
Spkresults.mdn_peaktime_CS_CR = nanmedian(Spkresults.peaktime_CS_CR);

%normal
Spkresults.amp_CS_normal = [];
Spkresults.peaktime_CS_normal=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.CS_trials_normal_mdn_norm,1)
    if isnan(Spkresults.CS_trials_normal_mdn_norm(ii,1))==0
        % CS period
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_normal_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_normal_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_normal(ii)=ampidx(1);
            Spkresults.peaktime_CS_normal(ii) = (amptime(1)/Spkdata.fs)+0.55;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_normal(ii)=ampidx(2);
            Spkresults.peaktime_CS_normal(ii) = (amptime(2)/Spkdata.fs)+0.55;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_normal_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_normal_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_normal_baseline(ii)=ampidx(1);
            Spkresults.peaktime_CS_normal_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_normal_baseline(ii)=ampidx(2);
            Spkresults.peaktime_CS_normal_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_CS_normal(ii)=NaN;
        Spkresults.peaktime_CS_normal(ii) = NaN;
        Spkresults.amp_CS_normal_baseline(ii)=NaN;
        Spkresults.peaktime_CS_normal_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_CS_normal = nanmean(Spkresults.amp_CS_normal);
Spkresults.mdn_amp_CS_normal = nanmedian(Spkresults.amp_CS_normal);
Spkresults.avg_peaktime_CS_normal= nanmean(Spkresults.peaktime_CS_normal);
Spkresults.mdn_peaktime_CS_normal = nanmedian(Spkresults.peaktime_CS_normal);

%SEO
Spkresults.amp_CS_SEO = [];
Spkresults.peaktime_CS_SEO=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.CS_trials_SEO_mdn_norm,1)
    if isnan(Spkresults.CS_trials_SEO_mdn_norm(ii,1))==0
        % CS period
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_SEO_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_SEO_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_SEO(ii)=ampidx(1);
            Spkresults.peaktime_CS_SEO(ii) = (amptime(1)/Spkdata.fs)+0.55;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_SEO(ii)=ampidx(2);
            Spkresults.peaktime_CS_SEO(ii) = (amptime(2)/Spkdata.fs)+0.55;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.CS_trials_SEO_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.CS_trials_SEO_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_CS_SEO_baseline(ii)=ampidx(1);
            Spkresults.peaktime_CS_SEO_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_CS_SEO_baseline(ii)=ampidx(2);
            Spkresults.peaktime_CS_SEO_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_CS_SEO(ii)=NaN;
        Spkresults.peaktime_CS_SEO(ii) = NaN;
        Spkresults.amp_CS_SEO_baseline(ii)=NaN;
        Spkresults.peaktime_CS_SEO_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_CS_SEO = nanmean(Spkresults.amp_CS_SEO);
Spkresults.mdn_amp_CS_SEO = nanmedian(Spkresults.amp_CS_SEO);
Spkresults.avg_peaktime_CS_SEO= nanmean(Spkresults.peaktime_CS_SEO);
Spkresults.mdn_peaktime_CS_SEO = nanmedian(Spkresults.peaktime_CS_SEO);

%% AUC 200ms before US onset
Spkresults.AUC_CS_last200=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_mdn,1)
    if isnan(Spkresults.CS_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_last200(ii)=nansum(Spkresults.CS_trials_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_last200(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_last200 = nanmean(Spkresults.AUC_CS_last200);
Spkresults.mdn_AUC_CS_last200 = nanmedian(Spkresults.AUC_CS_last200);

% normal
Spkresults.AUC_CS_normal_last200=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_normal_mdn,1)
    if isnan(Spkresults.CS_trials_normal_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_normal_last200(ii)=nansum(Spkresults.CS_trials_normal_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_normal_last200(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_normal_last200 = nanmean(Spkresults.AUC_CS_normal_last200);
Spkresults.mdn_AUC_CS_normal_last200 = nanmedian(Spkresults.AUC_CS_normal_last200);

% CR
Spkresults.AUC_CS_CR_last200=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_CR_mdn,1)
    if isnan(Spkresults.CS_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_CR_last200(ii)=nansum(Spkresults.CS_trials_CR_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_CR_last200(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_CR_last200 = nanmean(Spkresults.AUC_CS_CR_last200);
Spkresults.mdn_AUC_CS_CR_last200 = nanmedian(Spkresults.AUC_CS_CR_last200);

% SEO
Spkresults.AUC_CS_SEO_last200=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_SEO_mdn,1)
    if isnan(Spkresults.CS_trials_SEO_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_SEO_last200(ii)=nansum(Spkresults.CS_trials_SEO_mdn_norm(ii,0.55*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_SEO_last200(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_SEO_last200 = nanmean(Spkresults.AUC_CS_SEO_last200);
Spkresults.mdn_AUC_CS_SEO_last200 = nanmedian(Spkresults.AUC_CS_SEO_last200);

%% AUC 100ms before US onset
Spkresults.AUC_CS_last100=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_mdn,1)
    if isnan(Spkresults.CS_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_last100(ii)=nansum(Spkresults.CS_trials_mdn_norm(ii,0.65*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_last100(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_last100 = nanmean(Spkresults.AUC_CS_last100);
Spkresults.mdn_AUC_CS_last100 = nanmedian(Spkresults.AUC_CS_last100);

% normal
Spkresults.AUC_CS_normal_last100=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_normal_mdn,1)
    if isnan(Spkresults.CS_trials_normal_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_normal_last100(ii)=nansum(Spkresults.CS_trials_normal_mdn_norm(ii,0.65*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_normal_last100(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_normal_last100 = nanmean(Spkresults.AUC_CS_normal_last100);
Spkresults.mdn_AUC_CS_normal_last100 = nanmedian(Spkresults.AUC_CS_normal_last100);

% CR
Spkresults.AUC_CS_CR_last100=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_CR_mdn,1)
    if isnan(Spkresults.CS_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_CR_last100(ii)=nansum(Spkresults.CS_trials_CR_mdn_norm(ii,0.65*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_CR_last100(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_CR_last100 = nanmean(Spkresults.AUC_CS_CR_last100);
Spkresults.mdn_AUC_CS_CR_last100 = nanmedian(Spkresults.AUC_CS_CR_last100);

% SEO
Spkresults.AUC_CS_SEO_last100=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_SEO_mdn,1)
    if isnan(Spkresults.CS_trials_SEO_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_SEO_last100(ii)=nansum(Spkresults.CS_trials_SEO_mdn_norm(ii,0.65*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_SEO_last100(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_SEO_last100 = nanmean(Spkresults.AUC_CS_SEO_last100);
Spkresults.mdn_AUC_CS_SEO_last100 = nanmedian(Spkresults.AUC_CS_SEO_last100);

%% AUC 50ms before US onset
Spkresults.AUC_CS_last50=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_mdn,1)
    if isnan(Spkresults.CS_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_last50(ii)=nansum(Spkresults.CS_trials_mdn_norm(ii,0.7*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_last50(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_last50 = nanmean(Spkresults.AUC_CS_last50);
Spkresults.mdn_AUC_CS_last50 = nanmedian(Spkresults.AUC_CS_last50);

% normal
Spkresults.AUC_CS_normal_last50=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_normal_mdn,1)
    if isnan(Spkresults.CS_trials_normal_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_normal_last50(ii)=nansum(Spkresults.CS_trials_normal_mdn_norm(ii,0.7*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_normal_last50(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_normal_last50 = nanmean(Spkresults.AUC_CS_normal_last50);
Spkresults.mdn_AUC_CS_normal_last50 = nanmedian(Spkresults.AUC_CS_normal_last50);

% CR
Spkresults.AUC_CS_CR_last50=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_CR_mdn,1)
    if isnan(Spkresults.CS_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_CR_last50(ii)=nansum(Spkresults.CS_trials_CR_mdn_norm(ii,0.7*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_CR_last50(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_CR_last50 = nanmean(Spkresults.AUC_CS_CR_last50);
Spkresults.mdn_AUC_CS_CR_last50 = nanmedian(Spkresults.AUC_CS_CR_last50);

% SEO
Spkresults.AUC_CS_SEO_last50=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_SEO_mdn,1)
    if isnan(Spkresults.CS_trials_SEO_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_SEO_last50(ii)=nansum(Spkresults.CS_trials_SEO_mdn_norm(ii,0.7*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_SEO_last50(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_SEO_last50 = nanmean(Spkresults.AUC_CS_SEO_last50);
Spkresults.mdn_AUC_CS_SEO_last50 = nanmedian(Spkresults.AUC_CS_SEO_last50);

%% Generate average traces
% Ephys
Spkavgs.avgtrace_CS = nanmean(Spkresults.CS_trials_mdn_norm,1);
Spkavgs.avgtrace_CS_normal = nanmean(Spkresults.CS_trials_normal_mdn_norm,1);
Spkavgs.avgtrace_CS_CR = nanmean(Spkresults.CS_trials_CR_mdn_norm,1);
Spkavgs.avgtrace_CS_SEO = nanmean(Spkresults.CS_trials_SEO_mdn_norm,1);

Spkavgs.timeX= linspace(-0.5,1.5,200000);
figure; hold on; plot(Spkavgs.timeX,Spkavgs.avgtrace_CS,'k');
plot(Spkavgs.timeX,Spkavgs.avgtrace_CS_normal,'b'); plot(Spkavgs.timeX,Spkavgs.avgtrace_CS_CR,'g');plot(Spkavgs.timeX,Spkavgs.avgtrace_CS_SEO,'m');
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k','LineWidth',1);xlim([-0.25 0.25]);
if Param.savefig ==1
    figname = sprintf('%s_CStrials.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_CStrials.pdf',Param.cellID);
    print('-dpdf','-vector','-loose',figname);
end

%% Calculate amplitude/AUC/peaktime from the average trace
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_CS(1,1))==0
    % CS period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_CS(0.55*Spkdata.fs:0.75*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_CS(0.55*Spkdata.fs:0.75*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_CS=ampidx(1);
        Spkavgs.peaktime_CS = (amptime(1)/Spkdata.fs)+0.55;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_CS=ampidx(2);
        Spkavgs.peaktime_CS = (amptime(2)/Spkdata.fs)+0.55;
    end
else
    Spkavgs.amp_CS=NaN;
    Spkavgs.peaktime_CS = NaN;
end

%CR
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_CS_CR(1,1))==0
    % CS period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_CS_CR(0.55*Spkdata.fs:0.75*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_CS_CR(0.55*Spkdata.fs:0.75*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_CS_CR=ampidx(1);
        Spkavgs.peaktime_CS_CR = (amptime(1)/Spkdata.fs)+0.55;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_CS_CR=ampidx(2);
        Spkavgs.peaktime_CS_CR = (amptime(2)/Spkdata.fs)+0.55;
    end
else
    Spkavgs.amp_CS_CR=NaN;
    Spkavgs.peaktime_CS_CR = NaN;
end

%normal
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_CS_normal(1,1))==0
    % CS period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_CS_normal(0.55*Spkdata.fs:0.75*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_CS_normal(0.55*Spkdata.fs:0.75*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_CS_normal=ampidx(1);
        Spkavgs.peaktime_CS_normal = (amptime(1)/Spkdata.fs)+0.55;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_CS_normal=ampidx(2);
        Spkavgs.peaktime_CS_normal = (amptime(2)/Spkdata.fs)+0.55;
    end
else
    Spkavgs.amp_CS_normal=NaN;
    Spkavgs.peaktime_CS_normal = NaN;
end

%SEO
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_CS_SEO(1,1))==0
    % CS period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_CS_SEO(0.55*Spkdata.fs:0.75*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_CS_SEO(0.55*Spkdata.fs:0.75*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_CS_SEO=ampidx(1);
        Spkavgs.peaktime_CS_SEO = (amptime(1)/Spkdata.fs)+0.55;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_CS_SEO=ampidx(2);
        Spkavgs.peaktime_CS_SEO = (amptime(2)/Spkdata.fs)+0.55;
    end
else
    Spkavgs.amp_CS_SEO=NaN;
    Spkavgs.peaktime_CS_SEO = NaN;
end


%% Compile a variable for excel
Spkresults.excelvar_CSstats=[Spkresults.avg_amp_CS Spkresults.avg_amp_CS_CR Spkresults.avg_amp_CS_normal Spkresults.avg_amp_CS_SEO...
    Spkresults.avg_peaktime_CS Spkresults.avg_peaktime_CS_CR Spkresults.avg_peaktime_CS_normal Spkresults.avg_peaktime_CS_SEO...
    Spkresults.avg_AUC_CS_last200  Spkresults.avg_AUC_CS_CR_last200 Spkresults.avg_AUC_CS_normal_last200 Spkresults.avg_AUC_CS_SEO_last200...
    Spkresults.avg_AUC_CS_last100  Spkresults.avg_AUC_CS_CR_last100 Spkresults.avg_AUC_CS_normal_last100 Spkresults.avg_AUC_CS_SEO_last100...
    Spkresults.avg_AUC_CS_last50  Spkresults.avg_AUC_CS_CR_last50 Spkresults.avg_AUC_CS_normal_last50 Spkresults.avg_AUC_CS_SEO_last50...
    Spkavgs.amp_CS Spkavgs.amp_CS_CR Spkavgs.amp_CS_normal Spkavgs.amp_CS_SEO...
    Spkavgs.peaktime_CS Spkavgs.peaktime_CS_CR Spkavgs.peaktime_CS_normal Spkavgs.peaktime_CS_SEO];


%% Save file
if Param.savefile ==1
    Spkdata.data=[];
    savename = sprintf('Results_ephys_%s',Param.mouseID);
    save(savename,'Param','Spkdata', 'Spkresults','Spkavgs','-v7.3');
end
