%% Calculate statistics of the US responses
% Calculate the amplitude of the Vm responses after the US. Separate trials
% based on CR, NR and EO (SEO). Calculate the area under the curve (AUC) of the Vm
% responses for different periods after the US. Create a summary variable.
% (c) R. Broersen, Erasmus MC, 2023

% Amplitude and peaktime during US interval (trial by trial, 750-1250ms)
Spkresults.amp_US = [];
Spkresults.peaktime_US=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.US_trials_mdn_norm,1)
    if isnan(Spkresults.US_trials_mdn_norm(ii,1))==0
        % US period
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs)); % Amplitude calculated between 750 and 1250 ms after start of the trial (0 to 500 ms following the US)
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US(ii)=ampidx(1);
            Spkresults.peaktime_US(ii) = (amptime(1)/Spkdata.fs)+0.75;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US(ii)=ampidx(2);
            Spkresults.peaktime_US(ii) = (amptime(2)/Spkdata.fs)+0.75;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_baseline(ii)=ampidx(1);
            Spkresults.peaktime_US_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_baseline(ii)=ampidx(2);
            Spkresults.peaktime_US_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_US(ii)=NaN;
        Spkresults.peaktime_US(ii) = NaN;
        Spkresults.amp_US_baseline(ii)=NaN;
        Spkresults.peaktime_US_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_US = nanmean(Spkresults.amp_US);
Spkresults.mdn_amp_US = nanmedian(Spkresults.amp_US);
Spkresults.avg_peaktime_US= nanmean(Spkresults.peaktime_US);
Spkresults.mdn_peaktime_US = nanmedian(Spkresults.peaktime_US);

% US trials(paired) -CR
Spkresults.amp_US_CR = [];
Spkresults.peaktime_US_CR=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.US_trials_CR_mdn_norm,1)
    if isnan(Spkresults.US_trials_CR_mdn_norm(ii,1))==0
        % US period
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_CR(ii)=ampidx(1);
            Spkresults.peaktime_US_CR(ii) = (amptime(1)/Spkdata.fs)+0.75;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_CR(ii)=ampidx(2);
            Spkresults.peaktime_US_CR(ii) = (amptime(2)/Spkdata.fs)+0.75;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_CR_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_CR_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_CR_baseline(ii)=ampidx(1);
            Spkresults.peaktime_US_CR_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_CR_baseline(ii)=ampidx(2);
            Spkresults.peaktime_US_CR_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_US_CR(ii)=NaN;
        Spkresults.peaktime_US_CR(ii) = NaN;
        Spkresults.amp_US_CR_baseline(ii)=NaN;
        Spkresults.peaktime_US_CR_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_US_CR = nanmean(Spkresults.amp_US_CR);
Spkresults.mdn_amp_US_CR = nanmedian(Spkresults.amp_US_CR);
Spkresults.avg_peaktime_US_CR= nanmean(Spkresults.peaktime_US_CR);
Spkresults.mdn_peaktime_US_CR = nanmedian(Spkresults.peaktime_US_CR);

% US trials(paired) -normal
Spkresults.amp_US_normal = [];
Spkresults.peaktime_US_normal=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.US_trials_normal_mdn_norm,1)
    if isnan(Spkresults.US_trials_normal_mdn_norm(ii,1))==0
        % US period
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_normal_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_normal_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_normal(ii)=ampidx(1);
            Spkresults.peaktime_US_normal(ii) = (amptime(1)/Spkdata.fs)+0.75;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_normal(ii)=ampidx(2);
            Spkresults.peaktime_US_normal(ii) = (amptime(2)/Spkdata.fs)+0.75;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_normal_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_normal_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_normal_baseline(ii)=ampidx(1);
            Spkresults.peaktime_US_normal_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_normal_baseline(ii)=ampidx(2);
            Spkresults.peaktime_US_normal_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_US_normal(ii)=NaN;
        Spkresults.peaktime_US_normal(ii) = NaN;
        Spkresults.amp_US_normal_baseline(ii)=NaN;
        Spkresults.peaktime_US_normal_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_US_normal = nanmean(Spkresults.amp_US_normal);
Spkresults.mdn_amp_US_normal = nanmedian(Spkresults.amp_US_normal);
Spkresults.avg_peaktime_US_normal= nanmean(Spkresults.peaktime_US_normal);
Spkresults.mdn_peaktime_US_normal = nanmedian(Spkresults.peaktime_US_normal);

% US trials(paired) -SEO
Spkresults.amp_US_SEO = [];
Spkresults.peaktime_US_SEO=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.US_trials_SEO_mdn_norm,1)
    if isnan(Spkresults.US_trials_SEO_mdn_norm(ii,1))==0
        % US period
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_SEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_SEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_SEO(ii)=ampidx(1);
            Spkresults.peaktime_US_SEO(ii) = (amptime(1)/Spkdata.fs)+0.75;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_SEO(ii)=ampidx(2);
            Spkresults.peaktime_US_SEO(ii) = (amptime(2)/Spkdata.fs)+0.75;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.US_trials_SEO_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.US_trials_SEO_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_US_SEO_baseline(ii)=ampidx(1);
            Spkresults.peaktime_US_SEO_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_US_SEO_baseline(ii)=ampidx(2);
            Spkresults.peaktime_US_SEO_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_US_SEO(ii)=NaN;
        Spkresults.peaktime_US_SEO(ii) = NaN;
        Spkresults.amp_US_SEO_baseline(ii)=NaN;
        Spkresults.peaktime_US_SEO_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_US_SEO = nanmean(Spkresults.amp_US_SEO);
Spkresults.mdn_amp_US_SEO = nanmedian(Spkresults.amp_US_SEO);
Spkresults.avg_peaktime_US_SEO= nanmean(Spkresults.peaktime_US_SEO);
Spkresults.mdn_peaktime_US_SEO = nanmedian(Spkresults.peaktime_US_SEO);

% USonly
Spkresults.amp_USonly = [];
Spkresults.peaktime_USonly=[];
ampidx=[];
amptime = [];
for ii=1:size(Spkresults.USonly_trials_mdn_norm,1)
    if isnan(Spkresults.USonly_trials_mdn_norm(ii,1))==0
        % USonly period
        [ampidx(1) amptime(1)]=max(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_USonly(ii)=ampidx(1);
            Spkresults.peaktime_USonly(ii) = (amptime(1)/Spkdata.fs)+0.75;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_USonly(ii)=ampidx(2);
            Spkresults.peaktime_USonly(ii) = (amptime(2)/Spkdata.fs)+0.75;
        end
        % baseline
        [ampidx(1) amptime(1)]=max(Spkresults.USonly_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        [ampidx(2) amptime(2)]=min(Spkresults.USonly_trials_mdn_norm(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        % Select the amplitude that is largest (min or max)
        if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
            Spkresults.amp_USonly_baseline(ii)=ampidx(1);
            Spkresults.peaktime_USonly_baseline(ii) = (amptime(1)/Spkdata.fs)+0.25;
        elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
            Spkresults.amp_USonly_baseline(ii)=ampidx(2);
            Spkresults.peaktime_USonly_baseline(ii) = (amptime(2)/Spkdata.fs)+0.25;
        end
    else
        Spkresults.amp_USonly(ii)=NaN;
        Spkresults.peaktime_USonly(ii) = NaN;
        Spkresults.amp_USonly_baseline(ii)=NaN;
        Spkresults.peaktime_USonly_baseline(ii) = NaN;
    end
end

Spkresults.avg_amp_USonly = nanmean(Spkresults.amp_USonly);
Spkresults.mdn_amp_USonly = nanmedian(Spkresults.amp_USonly);
Spkresults.avg_peaktime_USonly= nanmean(Spkresults.peaktime_USonly);
Spkresults.mdn_peaktime_USonly = nanmedian(Spkresults.peaktime_USonly);


%% AUC US period
Spkresults.AUC_US=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_mdn,1)
    if isnan(Spkresults.US_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_US(ii)=nansum(Spkresults.US_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    else
        Spkresults.AUC_US(ii)=NaN;
    end
end

Spkresults.avg_AUC_US = nanmean(Spkresults.AUC_US);
Spkresults.mdn_AUC_US = nanmedian(Spkresults.AUC_US);

% No CR _normal
Spkresults.AUC_US_normal=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_normal_mdn_norm,1)
    if isnan(Spkresults.US_trials_normal_mdn_norm(ii,1))==0
        Spkresults.AUC_US_normal(ii)=nansum(Spkresults.US_trials_normal_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    else
        Spkresults.AUC_US_normal(ii)=NaN;
    end
end

Spkresults.avg_AUC_US_normal = nanmean(Spkresults.AUC_US_normal);
Spkresults.mdn_AUC_US_normal = nanmedian(Spkresults.AUC_US_normal);

% CR
Spkresults.AUC_US_CR=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_CR_mdn_norm,1)
    if isnan(Spkresults.US_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_US_CR(ii)=nansum(Spkresults.US_trials_CR_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    else
        Spkresults.AUC_US_CR(ii)=NaN;
    end
end

Spkresults.avg_AUC_US_CR = nanmean(Spkresults.AUC_US_CR);
Spkresults.mdn_AUC_US_CR = nanmedian(Spkresults.AUC_US_CR);

% SEO
Spkresults.AUC_US_SEO=[];

AUCidx=[];
for ii=1:size(Spkresults.US_trials_SEO_mdn_norm,1)
    if isnan(Spkresults.US_trials_SEO_mdn_norm(ii,1))==0
        Spkresults.AUC_US_SEO(ii)=nansum(Spkresults.US_trials_SEO_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    else
        Spkresults.AUC_US_SEO(ii)=NaN;
    end
end

Spkresults.avg_AUC_US_SEO = nanmean(Spkresults.AUC_US_SEO);
Spkresults.mdn_AUC_US_SEO = nanmedian(Spkresults.AUC_US_SEO);


% US only
Spkresults.AUC_USonly=[];
AUCidx=[];
for ii=1:size(Spkresults.USonly_trials_mdn_norm,1)
    if isnan(Spkresults.USonly_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_USonly(ii)=nansum(Spkresults.USonly_trials_mdn_norm(ii,0.75*Spkdata.fs:1.25*Spkdata.fs));
    else
        Spkresults.AUC_USonly(ii)=NaN;
    end
end

Spkresults.avg_AUC_USonly = nanmean(Spkresults.AUC_USonly);
Spkresults.mdn_AUC_USonly= nanmedian(Spkresults.AUC_USonly);


%% Generate average traces
% Ephys
Spkavgs.avgtrace_US = nanmean(Spkresults.US_trials_mdn_norm,1);
Spkavgs.avgtrace_US_normal = nanmean(Spkresults.US_trials_normal_mdn_norm,1);
Spkavgs.avgtrace_US_CR = nanmean(Spkresults.US_trials_CR_mdn_norm,1);
Spkavgs.avgtrace_US_SEO = nanmean(Spkresults.US_trials_SEO_mdn_norm,1);
Spkavgs.avgtrace_USonly = nanmean(Spkresults.USonly_trials_mdn_norm,1);

Spkavgs.timeX= linspace(-0.5,1.5,200000);
figure; hold on; plot(Spkavgs.timeX,Spkavgs.avgtrace_US,'k');
plot(Spkavgs.timeX,Spkavgs.avgtrace_US_normal,'b'); plot(Spkavgs.timeX,Spkavgs.avgtrace_US_CR,'g');plot(Spkavgs.timeX,Spkavgs.avgtrace_US_SEO,'m'); plot(Spkavgs.timeX,Spkavgs.avgtrace_USonly,'c');
line([0.25 0.25],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k','LineWidth',1);
line([0.26 0.26],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k','LineWidth',1);
xlim([0.2 0.75]);
legend('US trials','Paired normal','Paired CR','Paired SEO','USonly')

if Param.savefig==1
    figname = sprintf('%s_UStrials.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_UStrials.pdf',Param.cellID);
    print('-dpdf','-vector','-loose',figname);
end


%% Calculate amplitude/peaktime from the average trace
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_US(1,1))==0
    % US period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_US(0.75*Spkdata.fs:1.25*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_US(0.75*Spkdata.fs:1.25*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_US=ampidx(1);
        Spkavgs.peaktime_US = (amptime(1)/Spkdata.fs)+0.75;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_US=ampidx(2);
        Spkavgs.peaktime_US = (amptime(2)/Spkdata.fs)+0.75;
    end
else
    Spkavgs.amp_US=NaN;
    Spkavgs.peaktime_US = NaN;
end

%CR
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_US_CR(1,1))==0
    % US period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_US_CR(0.75*Spkdata.fs:1.25*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_US_CR(0.75*Spkdata.fs:1.25*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_US_CR=ampidx(1);
        Spkavgs.peaktime_US_CR = (amptime(1)/Spkdata.fs)+0.75;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_US_CR=ampidx(2);
        Spkavgs.peaktime_US_CR = (amptime(2)/Spkdata.fs)+0.75;
    end
else
    Spkavgs.amp_US_CR=NaN;
    Spkavgs.peaktime_US_CR = NaN;
end

%normal
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_US_normal(1,1))==0
    % US period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_US_normal(0.75*Spkdata.fs:1.25*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_US_normal(0.75*Spkdata.fs:1.25*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_US_normal=ampidx(1);
        Spkavgs.peaktime_US_normal = (amptime(1)/Spkdata.fs)+0.75;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_US_normal=ampidx(2);
        Spkavgs.peaktime_US_normal = (amptime(2)/Spkdata.fs)+0.75;
    end
else
    Spkavgs.amp_US_normal=NaN;
    Spkavgs.peaktime_US_normal = NaN;
end

%SEO
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_US_SEO(1,1))==0
    % US period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_US_SEO(0.75*Spkdata.fs:1.25*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_US_SEO(0.75*Spkdata.fs:1.25*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_US_SEO=ampidx(1);
        Spkavgs.peaktime_US_SEO = (amptime(1)/Spkdata.fs)+0.75;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_US_SEO=ampidx(2);
        Spkavgs.peaktime_US_SEO = (amptime(2)/Spkdata.fs)+0.75;
    end
else
    Spkavgs.amp_US_SEO=NaN;
    Spkavgs.peaktime_US_SEO = NaN;
end

%USonly
ampidx=[];
amptime = [];
if isnan(Spkavgs.avgtrace_USonly(1,1))==0
    % US period
    [ampidx(1) amptime(1)]=max(Spkavgs.avgtrace_USonly(0.75*Spkdata.fs:1.25*Spkdata.fs));
    [ampidx(2) amptime(2)]=min(Spkavgs.avgtrace_USonly(0.75*Spkdata.fs:1.25*Spkdata.fs));
    % Select the amplitude that is largest (min or max)
    if abs(ampidx(1))>abs(ampidx(2)) % if depolarizing amps are largest
        Spkavgs.amp_USonly=ampidx(1);
        Spkavgs.peaktime_USonly = (amptime(1)/Spkdata.fs)+0.75;
    elseif abs(ampidx(2))>abs(ampidx(1))% if hyperpolarizing amps are largest
        Spkavgs.amp_USonly=ampidx(2);
        Spkavgs.peaktime_USonly = (amptime(2)/Spkdata.fs)+0.75;
    end
else
    Spkavgs.amp_USonly=NaN;
    Spkavgs.peaktime_USonly = NaN;
end


%% Compile a variable for excel
Spkresults.excelvar_USstats=[Spkresults.avg_amp_US Spkresults.avg_amp_US_CR Spkresults.avg_amp_US_normal Spkresults.avg_amp_US_SEO Spkresults.avg_amp_USonly...
    Spkresults.avg_peaktime_US Spkresults.avg_peaktime_US_CR Spkresults.avg_peaktime_US_normal Spkresults.avg_peaktime_US_SEO Spkresults.avg_peaktime_USonly...
    Spkresults.avg_AUC_US  Spkresults.avg_AUC_US_CR Spkresults.avg_AUC_US_normal Spkresults.avg_AUC_US_SEO Spkresults.avg_AUC_USonly...
    Spkavgs.amp_US Spkavgs.amp_US_CR Spkavgs.amp_US_normal Spkavgs.amp_US_SEO Spkavgs.amp_USonly...
    Spkavgs.peaktime_US Spkavgs.peaktime_US_CR Spkavgs.peaktime_US_normal Spkavgs.peaktime_US_SEO Spkavgs.peaktime_USonly];

%% Save file
% if Param.savefile==1
Spkdata.data=[];
savename = sprintf('Results_ephys_CSandUS_%s',Param.mouseID);
save(savename,'Param','Spkdata', 'Spkresults','Spkavgs','-v7.3');
% end
