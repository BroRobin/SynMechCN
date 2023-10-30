%% Process behavioral data
% Detect CRs/EOs based on values that exceed Param.CR_SDthreshold x SD of the baseline. Calculate parameters of CR and UR eyelid movements.
% (c) R. Broersen, Erasmus MC, 2023

%Preallocate the general variables
R.trial_baseline_vals = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_baseline_SDvals = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_min_vals      = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_max_vals      = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_max_x      = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_success_flags = zeros(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.trial_CRs = NaN(size(Eyeblink_signal.GoTr_TimeStamps, 2),3);
R.plotaxishandle = [];
R.onsetlineaxishandle = NaN(1,length(Eyeblink_signal.GoTr_TimeStamps));
R.HP_x_paired = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.AUC_paired = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.ampTimeX_paired = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.HP_x_CSonly = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.AUC_CSonly = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
R.ampTimeX_CSonly = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));

%Paired trials
Eyeblink_signal.outlierindx_paired = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
Eyeblink_signal.outlierfree_paired = NaN(size(Eyeblink_signal.GoTr_TimeStamps, 2),(round(Param.fs*2)+1));
Eyeblink_signal.ind_trials=[];
if sum(Eyeblink_signal.GoTr_IDstim==3)>0 % figure if there are paired trials
    R.trial_paired_range = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
    R.trial_paired_rawCRAmp = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
    H(1) = figure; hold on; title('Paired trials') % for paired trials
    xlabel('Time(ms)'); ylabel('Eyeblink closure (V)'); ylim([-5 10]);
    figureFullScreen(H(1));
end

% US only trials
Eyeblink_signal.outlierindx_USonly = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
Eyeblink_signal.outlierfree_USonly = NaN(size(Eyeblink_signal.GoTr_TimeStamps, 2),(round(Param.fs*2)+1));
if sum(Eyeblink_signal.GoTr_IDstim==2)>0 % figure if there are US only trials
    R.trial_USonly_range = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
    H(2) = figure; hold on; title('US only trials')
    xlabel('Time(ms)'); ylabel('Eyeblink closure (V)');ylim([-5 10]);
    figureFullScreen(H(2));
end

% CS only trials
Eyeblink_signal.outlierindx_CSonly = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
Eyeblink_signal.outlierfree_CSonly = NaN(size(Eyeblink_signal.GoTr_TimeStamps, 2),(round(Param.fs*2)+1));
if sum(Eyeblink_signal.GoTr_IDstim==1)>0 % figure if there are CS only trials
    R.trial_CSonly_range = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
    R.trial_CSonly_rawCRAmp = NaN(1, size(Eyeblink_signal.GoTr_TimeStamps, 2));
    H(3) = figure; hold on; title('CS only trials')
    xlabel('Time(ms)'); ylabel('Eyeblink closure (V)');ylim([-5 10]);
    figureFullScreen(H(3));
end

H(10) = figure; figureFullScreen(H(10)); % Create a temporary figure for saving traces

%% Cut the filtered signal into epochs based on the GoTr TimeStamps
Param.Ts = 1/Param.fs;
Eyeblink_signal.t = linspace(0,(size(Eyeblink_signal.adc,2)*Param.Ts),size(Eyeblink_signal.adc,2));

for curr_trial = 1: size(Eyeblink_signal.GoTr_TimeStamps, 2)
    % Determine the TimeStamps of individual trials. Cut into 2 sec
    % pieces
    index=find(Eyeblink_signal.t >= Eyeblink_signal.GoTr_TimeStamps(curr_trial), 1, 'first')+round(Param.fs*0):find(Eyeblink_signal.t >= Eyeblink_signal.GoTr_TimeStamps(curr_trial), 1, 'first')+round(Param.fs*2);
    Eyeblink_signal.ind_trials = [Eyeblink_signal.ind_trials; Eyeblink_signal.adc_filt(index)];
    Param.tvalues= [0:Param.Ts:(Param.Ts*length(index)-1*Param.Ts)]; %TimeStamps for plotting

    R.trial_min_vals(1, curr_trial)        = min(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)));%min value during baseline
    R.trial_max_vals(1, curr_trial)        = max(Eyeblink_signal.ind_trials(curr_trial,round(.75/Param.Ts): round(1.2/Param.Ts)));%max value after the puff
    R.trial_max_x(1, curr_trial) =          find(Eyeblink_signal.ind_trials(curr_trial,:)==R.trial_max_vals(1,curr_trial),1,'first');
    R.trial_baseline_vals(1, curr_trial)  =  mean(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)));%mean baseline values
    R.trial_baseline_SDvals(1, curr_trial)  =  std(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)));%SD baseline values

    %Write the trialdata
    if Eyeblink_signal.GoTr_IDstim(curr_trial)==3
        Eyeblink_signal.outlierindx_paired(1,curr_trial) = 1; % 1 if no outliers, 0 if outliers
        Eyeblink_signal.outlierfree_paired(curr_trial,:) = Eyeblink_signal.ind_trials(curr_trial,:);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==2
        Eyeblink_signal.outlierindx_USonly(1,curr_trial) = 1;
        Eyeblink_signal.outlierfree_USonly(curr_trial,:) = Eyeblink_signal.ind_trials(curr_trial,:);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==1
        Eyeblink_signal.outlierindx_CSonly(1,curr_trial) = 1;
        Eyeblink_signal.outlierfree_CSonly(curr_trial,:) = Eyeblink_signal.ind_trials(curr_trial,:);
    end

    % Thresholded test for baseline outliers
    if Eyeblink_signal.GoTr_IDstim(curr_trial)==3 && (R.trial_min_vals(1, curr_trial)-R.trial_baseline_vals(1, curr_trial))<Param.baselineThreshold(1) || Eyeblink_signal.GoTr_IDstim(curr_trial)==3 && (max(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)))-R.trial_baseline_vals(1, curr_trial))>Param.baselineThreshold(2)
        Eyeblink_signal.outlierindx_paired(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_paired(curr_trial,:) = NaN;
        fprintf('Trial %.0f (paired) has an unstable baseline (TH) and is discarded \n',curr_trial);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==2 && (R.trial_min_vals(1, curr_trial)-R.trial_baseline_vals(1, curr_trial))<Param.baselineThreshold(1) || Eyeblink_signal.GoTr_IDstim(curr_trial)==2 && (max(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)))-R.trial_baseline_vals(1, curr_trial))>Param.baselineThreshold(2)
        Eyeblink_signal.outlierindx_USonly(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_USonly(curr_trial,:) = NaN;
        fprintf('Trial %.0f (USonly) has an unstable baseline (TH) and is discarded \n',curr_trial);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==1 && (R.trial_min_vals(1, curr_trial)-R.trial_baseline_vals(1, curr_trial))<Param.baselineThreshold(1) || Eyeblink_signal.GoTr_IDstim(curr_trial)==1 && (max(Eyeblink_signal.ind_trials(curr_trial,1: round(.5/Param.Ts)))-R.trial_baseline_vals(1, curr_trial))>Param.baselineThreshold(2)
        Eyeblink_signal.outlierindx_CSonly(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_CSonly(curr_trial,:) = NaN;
        fprintf('Trial %.0f (CSonly) has an unstable baseline (TH) and is discarded \n',curr_trial);
    end


    % Thresholded test for baseline outliers. If values are higher than 5x
    % SD of the baseline, the trace is excluded.
    if Eyeblink_signal.GoTr_IDstim(curr_trial)==3 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))>(R.trial_baseline_vals(1, curr_trial)+(5*R.trial_baseline_SDvals(1, curr_trial))))>0 || Eyeblink_signal.GoTr_IDstim(curr_trial)==3 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))<(R.trial_baseline_vals(1, curr_trial)-(5*R.trial_baseline_SDvals(1, curr_trial))))>0
        Eyeblink_signal.outlierindx_paired(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_paired(curr_trial,:) = NaN;
        fprintf('Trial %.0f (paired) has an unstable baseline (> or < 5xSD baseline) and is discarded \n',curr_trial);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==2 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))>(R.trial_baseline_vals(1, curr_trial)+(5*R.trial_baseline_SDvals(1, curr_trial))))>0 || Eyeblink_signal.GoTr_IDstim(curr_trial)==2 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))<(R.trial_baseline_vals(1, curr_trial)-(5*R.trial_baseline_SDvals(1, curr_trial))))>0
        Eyeblink_signal.outlierindx_USonly(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_USonly(curr_trial,:) = NaN;
        fprintf('Trial %.0f (USonly) has an unstable baseline (> or < 5xSD baseline) and is discarded \n',curr_trial);
    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==1 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))>(R.trial_baseline_vals(1, curr_trial)+(5*R.trial_baseline_SDvals(1, curr_trial))))>0 || Eyeblink_signal.GoTr_IDstim(curr_trial)==1 && sum(Eyeblink_signal.ind_trials(curr_trial,round(1: round(.5/Param.Ts)))<(R.trial_baseline_vals(1, curr_trial)-(5*R.trial_baseline_SDvals(1, curr_trial))))>0
        Eyeblink_signal.outlierindx_CSonly(1,curr_trial) = 0;
        Eyeblink_signal.outlierfree_CSonly(curr_trial,:) = NaN;
        fprintf('Trial %.0f (CSonly) has an unstable baseline (> or < 5xSD baseline) and is discarded \n',curr_trial);
    end
end

%% Determine the average US peak
if sum(Eyeblink_signal.GoTr_IDstim(1,curr_trial)==2)>0
    for curr_trial = 1: size(Eyeblink_signal.GoTr_TimeStamps, 2)
        if Eyeblink_signal.outlierindx_USonly(curr_trial)==1 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==2
            R.trial_USonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial));
        end
    end
elseif sum(Eyeblink_signal.GoTr_IDstim(1,curr_trial)==2)==0 % if no US only trials, take the paired trials
    for curr_trial = 1: size(Eyeblink_signal.GoTr_TimeStamps, 2)
        if Eyeblink_signal.outlierindx_paired(curr_trial)==1 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==3
            R.trial_USonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial));
        end
    end
end

R.trial_USonly_avgPeak = nanmean(R.trial_USonly_range); % Average US peak

% Detect CR's and eyelid movements. Param.CR_SDthreshold*SD from baseline mean is considered to be a CR.
for curr_trial = 1: size(Eyeblink_signal.GoTr_TimeStamps, 2)
    if Eyeblink_signal.GoTr_IDstim(curr_trial)==3 % Paired
        % In case you have both CR and opening: the one with the highest amplitude counts
        if (max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) > ((Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))+R.trial_baseline_vals(1, curr_trial))) && (min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) < (R.trial_baseline_vals(1, curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))))
            if ((max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1, curr_trial)) > (R.trial_baseline_vals(1, curr_trial)-min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))))
                R.trial_success_flags(1,curr_trial)=1; %if CR is higher than min, then it's a CR
            elseif ((max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1, curr_trial)) < (R.trial_baseline_vals(1, curr_trial)-min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))))
                R.trial_success_flags(1,curr_trial)=2; %if min is higher than CR, its a opening
            end
        elseif max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) > ((Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))+R.trial_baseline_vals(1, curr_trial))
            R.trial_success_flags(1,curr_trial)=1;
        elseif min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) < (R.trial_baseline_vals(1, curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial)))
            R.trial_success_flags(1,curr_trial)=2;
        end

    elseif Eyeblink_signal.GoTr_IDstim(curr_trial)==1 % CSonly
        if (max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) > ((Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))+R.trial_baseline_vals(1, curr_trial))) && (min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) < (R.trial_baseline_vals(1, curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))))
            % In case you have both CR and opening: the one with the highest amplitude counts
            if ((max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1, curr_trial)) > (R.trial_baseline_vals(1, curr_trial)-min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))))
                R.trial_success_flags(1,curr_trial)=1; %if CR is higher than min, then it's a CR
            elseif ((max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1, curr_trial)) < (R.trial_baseline_vals(1, curr_trial)-min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))))
                R.trial_success_flags(1,curr_trial)=2; %if min is higher than CR, its a opening
            end
        elseif max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) > ((Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))+R.trial_baseline_vals(1, curr_trial))
            R.trial_success_flags(1,curr_trial)=1;
        elseif min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))) < (R.trial_baseline_vals(1, curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial)))
            R.trial_success_flags(1,curr_trial)=2;
        end
    else
        R.trial_success_flags(1,curr_trial)=0;
    end
end


%% Process data based on CR-normal-opening classification
cd([Param.path '\behavior_' Param.block]);
for curr_trial = 1: size(Eyeblink_signal.GoTr_TimeStamps, 2)

    % Paired trials
    if Eyeblink_signal.outlierindx_paired(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==1 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==3; % Paired CR

        % Plot and save the figure
        figure(H(10));
        plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'g'); %normalized to baseline trace
        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');

        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_paired_CR_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_paired_CR_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(1))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'g'); %normalized to baseline trace
        R.trial_paired_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % Range of paired blink scaled to that trial
        % CR yes/no
        R.trial_CRs(curr_trial,1) = 1;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal, 4 for paired eyelid opening, 5 for CSonly eyelid opening
        % CR amplitude in % of US amp
        R.trial_CRs(curr_trial,2) = ((max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak); % Amplitude as perc of US peak
        R.trial_paired_rawCRAmp(curr_trial) = (max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1,curr_trial));
        % Amp Time X
        R.ampTimeX_paired(curr_trial) = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % Time of HP
        index=(Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)))==max(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)));
        R.HP_x_paired(curr_trial) = Param.tvalues(find(index==1,1,'last'));
        % AUC between 550 and 750ms
        index = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_paired(curr_trial) = nansum(index(index>0));
        %         [Y I]=max(Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)));
        % CR onset (time where CR is >5% of CR amplitude
        %         index= (Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)) > ((0.05*R.trial_paired_rawCRAmp(curr_trial))+R.trial_baseline_vals(1,curr_trial))) ;
        index= (Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)) > (R.trial_baseline_vals(1,curr_trial)+(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))));
        index(1:round(.51/Param.Ts))=0; % from 510 ms onwards
        %         index=index(1:I);
        onset_idx = find(index==1,1,'last');
        R.trial_CRs(curr_trial,3) = Param.tvalues(find(index(1:onset_idx)==0,1,'last'));
        % Plot a line to indicate the onset of CR
        R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'm');
        if R.trial_CRs(curr_trial,3)<.51
            set(R.onsetlineaxishandle(curr_trial),'visible','off')
            R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'r');
            R.trial_CRs(curr_trial,3) = NaN;
        end


    elseif Eyeblink_signal.outlierindx_paired(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==2 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==3; % Paired eyelid opening
        % Plot and save the figure
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'k');%normalized to baseline trace

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_paired_SEO_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_paired_SEO_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(1))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'k');%normalized to baseline trace
        R.trial_paired_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % Range of paired blink scaled to that trial
        % movement yes/no
        R.trial_CRs(curr_trial,1) = 4;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal, 4 for paired eyelid opening, 5 for CSonly eyelid opening
        % eyelid movement amplitude in % of US amp
        R.trial_CRs(curr_trial,2) = ((min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak); % Amplitude as perc of US peak
        R.trial_paired_rawCRAmp(curr_trial) = (min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)))-R.trial_baseline_vals(1,curr_trial));
        % Amp Time X
        R.ampTimeX_paired(curr_trial) = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % Time of HP (or lowest point in this case)
        index=(Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)))==min(Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts)));
        R.HP_x_paired(curr_trial) = Param.tvalues(find(index==1,1,'last'));
        % AUC between 550 and 750ms
        index = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_paired(curr_trial) = nansum(index(index<0));
        %         [Y I]=max(Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)));
        % CR onset (time where CR is >5% of CR amplitude)
        % index= (Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)) < ((0.05*R.trial_paired_rawCRAmp(curr_trial))-R.trial_baseline_vals(1,curr_trial))) ;
        % CR onset (time where values reach the x*SD of baseline threshold
        index= (Eyeblink_signal.outlierfree_paired(curr_trial,1:round(.75/Param.Ts)) < (R.trial_baseline_vals(1,curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))));
        index(1:round(.51/Param.Ts))=0; % from 510 ms onwards
        %         index=index(1:I);
        onset_idx = find(index==1,1,'last');
        R.trial_CRs(curr_trial,3) = Param.tvalues(find(index(1:onset_idx)==0,1,'last'));
        % Plot a line to indicate the onset of CR
        % Plot a line to indicate the onset of CR
        R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'm');
        if R.trial_CRs(curr_trial,3)<.51
            set(R.onsetlineaxishandle(curr_trial),'visible','off')
            R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'r');
            R.trial_CRs(curr_trial,3) = NaN;
        end

    elseif Eyeblink_signal.outlierindx_paired(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==0 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==3; % Paired normal trace
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');
        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_paired_normal_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_paired_normal_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(1))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_paired(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');
        R.trial_paired_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % Range of paired blink scaled to that trial
        R.trial_CRs(curr_trial,1) = 0;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal
        R.trial_CRs(curr_trial,2) = NaN;
        R.trial_paired_rawCRAmp(curr_trial) = NaN;
        R.trial_CRs(curr_trial,3) = NaN;
        R.HP_x_paired(curr_trial) = NaN;
        % Amp Time X
        R.ampTimeX_paired(curr_trial) = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % AUC between 550 and 750ms
        index = (Eyeblink_signal.outlierfree_paired(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_paired(curr_trial) = nansum(index(index<0));

    elseif Eyeblink_signal.outlierindx_paired(curr_trial)==0 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==3;% Paired error trial
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r'); % ind_trials for erronous trials

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_paired_error_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_paired_error_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end
        figure(H(1))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r'); % ind_trials for erronous trials

        % US only
    elseif Eyeblink_signal.outlierindx_USonly(curr_trial)==1 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==2;
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_USonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');%normalized to baseline trace

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_USonly_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_USonly_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end
        figure(H(2))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_USonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');%normalized to baseline trace
        R.trial_USonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial));
    elseif Eyeblink_signal.outlierindx_USonly(curr_trial)==0 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==2;
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r');

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_USonly_error_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_USonly_behav_error_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(2))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r');

        % CS only
    elseif Eyeblink_signal.outlierindx_CSonly(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==1 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==1; % CSonly CRs
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'g'); %normalized to baseline trace

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_CSonly_CR_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_CSonly_CR_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(3))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'g'); %normalized to baseline trace
        R.trial_CSonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % Range of CSonly blink scaled to that trial
        % CR yes/no
        R.trial_CRs(curr_trial,1) = 2;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal, 4 for paired eyelid opening, 5 for CSonly eyelid opening
        % CR amplitude in % USamplitude between 550 and 1000ms
        R.trial_CRs(curr_trial,2) = ((max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts))))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak); % Amplitude as perc of US peak
        R.trial_CSonly_rawCRAmp(curr_trial) = (max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts)))-R.trial_baseline_vals(1,curr_trial));
        % Amp Time X
        R.ampTimeX_CSonly(curr_trial) = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % Time of HP between 550 and 1000ms
        index=(Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(1/Param.Ts)))==max(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts)));
        R.HP_x_CSonly(curr_trial) = Param.tvalues(find(index==1,1,'last'));
        % AUC between 550 and 750ms
        index = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_CSonly(curr_trial) = nansum(index(index>0));
        % CR onset (time where CR is >5% of CR amplitude
        %         [Y I]=max(Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(.75/Param.Ts)));
        index= (Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(.75/Param.Ts)) > (R.trial_baseline_vals(1,curr_trial)+(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))));
        index(1:round(.51/Param.Ts))=0; % from 510 ms onwards
        %         index=index(1:I);
        onset_idx = find(index==1,1,'last');
        R.trial_CRs(curr_trial,3) = Param.tvalues(find(index(1:onset_idx)==0,1,'last'));
        % Plot a line to indicate the onset of CR
        R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'm');
        if R.trial_CRs(curr_trial,3)<.51
            set(R.onsetlineaxishandle(curr_trial),'visible','off')
            R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'r');
            R.trial_CRs(curr_trial,3) = NaN;
        end

    elseif Eyeblink_signal.outlierindx_CSonly(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==2 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==1; % CSonly eyelid opening
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'k');%normalized to baseline trace
        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_CSonly_SEO_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_CSonly_SEO_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(3))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'k');%normalized to baseline trace
        R.trial_CSonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % Range of CSonly blink scaled to that trial
        % movement yes/no
        R.trial_CRs(curr_trial,1) = 5;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal, 4 for paired eyelid opening, 5 for CSonly eyelid opening
        % eyelid movement amplitude in % of US amp
        R.trial_CRs(curr_trial,2) = ((min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts))))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak); % Amplitude as perc of US peak
        R.trial_CSonly_rawCRAmp(curr_trial) = (min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts)))-R.trial_baseline_vals(1,curr_trial));
        % Amp Time X
        R.ampTimeX_CSonly(curr_trial) = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % Time of HP between 550 and 1000ms (or lowest point in this case)
        index=(Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(1/Param.Ts)))==min(Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts)));
        R.HP_x_CSonly(curr_trial) = Param.tvalues(find(index==1,1,'last'));
        % AUC between 550 and 750ms
        index = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_CSonly(curr_trial) = nansum(index(index<0));
        % CR onset (time where CR is >5% of CR amplitude
        %         [Y I]=max(Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(.75/Param.Ts)));
        index= (Eyeblink_signal.outlierfree_CSonly(curr_trial,1:round(.75/Param.Ts)) < (R.trial_baseline_vals(1,curr_trial)-(Param.CR_SDthreshold*R.trial_baseline_SDvals(1, curr_trial))));
        index(1:round(.51/Param.Ts))=0; % from 510 ms onwards
        %         index=index(1:I);
        onset_idx = find(index==1,1,'last');
        R.trial_CRs(curr_trial,3) = Param.tvalues(find(index(1:onset_idx)==0,1,'last'));
        % Plot a line to indicate the onset of CR
        R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'm');
        if R.trial_CRs(curr_trial,3)<.51
            set(R.onsetlineaxishandle(curr_trial),'visible','off')
            R.onsetlineaxishandle(curr_trial) = line([R.trial_CRs(curr_trial,3)*1000 R.trial_CRs(curr_trial,3)*1000],   [0 max(get(gca, 'Ylim'))], 'Color', 'r');
            R.trial_CRs(curr_trial,3) = NaN;
        end

    elseif Eyeblink_signal.outlierindx_CSonly(curr_trial)==1 && R.trial_success_flags(1,curr_trial)==0 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==1; % CSonly normal trace
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_CSonly_normal_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_CSonly_normal_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(3))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.outlierfree_CSonly(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'b');
        R.trial_CSonly_range(1,curr_trial) = (R.trial_max_vals(1,curr_trial)-R.trial_baseline_vals(1,curr_trial)); % US-blink range
        R.trial_CRs(curr_trial,1) = 3;%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal
        R.trial_CRs(curr_trial,2) = NaN;
        R.trial_CSonly_rawCRAmp(curr_trial) = NaN;
        R.trial_CRs(curr_trial,3) = NaN;
        R.HP_x_CSonly(curr_trial) = NaN;
        % Amp Time X
        R.ampTimeX_CSonly(curr_trial) = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.75/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/(Param.amp_norm*R.trial_USonly_avgPeak);
        % AUC between 550 and 1000ms
        index = (Eyeblink_signal.outlierfree_CSonly(curr_trial,round(.55/Param.Ts):round(1/Param.Ts))-R.trial_baseline_vals(1,curr_trial))/R.trial_USonly_avgPeak;
        R.AUC_CSonly(curr_trial) = nansum(index(index<0));

    elseif Eyeblink_signal.outlierindx_CSonly(curr_trial)==0 && Eyeblink_signal.GoTr_IDstim(1,curr_trial)==1;
        figure(H(10));
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r'); % ind_trials for erronous trials

        % Set the 'visible' property 'off'
        ylim([-5 10]);xlim([0 2000]);
        axis off
        line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        %Save the figure
        if Param.savefig ==1
            figname = sprintf('%.f_CSonly_normal_behav_%s.fig',curr_trial,Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('%.f_CSonly_normal_behav_%s.pdf',curr_trial,Param.cellID)
            print('-dpdf','-vector','-loose',figname)
        end

        figure(H(3))
        R.plotaxishandle(curr_trial) = plot(Param.tvalues*1000,Eyeblink_signal.ind_trials(curr_trial,:)-R.trial_baseline_vals(1, curr_trial),'r'); % ind_trials for erronous trials
    end



end


%% Add lines in graphs and save the data
if sum(Eyeblink_signal.GoTr_IDstim==3)>0;
    figure(H(1))
    line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    axis off

    if Param.savefig ==1
        figname = sprintf('Paired_%s_%s_%s.fig',Param.mouseID, Param.block);
        saveas(H(1),figname,'fig');
        print('-dpdf','-vector','-loose',figname)
        % legend('CR trial','No CR trial','location','NorthWest')
    end
end

if sum(Eyeblink_signal.GoTr_IDstim==1)>0;
    figure(H(3))
    line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    axis off

    if Param.savefig ==1
        figname = sprintf('CSonly_%s_%s_%s.fig',Param.mouseID, Param.block);
        saveas(H(3),figname,'fig');
        print('-dpdf','-vector','-loose',figname)
        %     legend('CR trial','No CR trial','location','NorthWest')
    end
end
if sum(Eyeblink_signal.GoTr_IDstim==2)>0;
    figure(H(2))
    line([500 500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([750 750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([760 760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    axis off
    if Param.savefig ==1
        figname = sprintf('USonly_%s_%s_%s.fig',Param.mouseID, Param.block);
        saveas(H(2),figname,'fig');
        print('-dpdf','-vector','-loose',figname)
    end
end

if Param.savefile ==1
    %     inputName=[];
    %     prompt = 'Type the additional savename:';
    %     inputName=input(prompt,'s');
    %     savename = sprintf('Results_extrdata_%s_%s_%s',Param.mouseID,Param.block,inputName);
    savename = sprintf('Results_behavior_%s_%s',Param.mouseID,Param.block);
    %     save(savename,'Eyeblink_signal', 'P', 'R', 'S');
    save(savename,'Eyeblink_signal','Param','R');
end
