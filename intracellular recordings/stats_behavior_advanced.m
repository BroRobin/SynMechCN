%% Calculate advanced statistics based on the behavioral data
% Calculate advanced statistics based on the behavioral data. Generate
% figures and save them in a separate folder. Detect onsets of CRs/EOs.
% (c) R. Broersen, Erasmus MC, 2023


cd(Param.path_ephys)
mkdir('behav_PSP')
cd([Param.path_ephys '\behav_PSP'])
behav =[];
correlation=[];
AUC_borders = [0.75 1.25]; % Define the time periods based on which the US AUC will be calculated
AUC_CS_borders = [0.55 0.75]; % Define the time periods based on which the CS AUC will be calculated


%% Determine the range of eyeopening
behav.range(1) = nanmin(nanmin([Eyeblink_signal.outlierfree_paired; Eyeblink_signal.outlierfree_USonly; Eyeblink_signal.outlierfree_CSonly]));
behav.range(2) = nanmax(nanmax([Eyeblink_signal.outlierfree_paired; Eyeblink_signal.outlierfree_USonly; Eyeblink_signal.outlierfree_CSonly]));
behav.range(3) = behav.range(2)-behav.range(1);

%% Normalize the raw values to the max range
Eyeblink_signal.outlierfree_paired_raw = Eyeblink_signal.outlierfree_paired;
Eyeblink_signal.outlierfree_USonly_raw = Eyeblink_signal.outlierfree_USonly;
Eyeblink_signal.outlierfree_CSonly_raw = Eyeblink_signal.outlierfree_CSonly;
Eyeblink_signal.ind_trials_raw = Eyeblink_signal.ind_trials;
R.trial_min_vals_raw = R.trial_min_vals;
R.trial_max_vals_raw = R.trial_max_vals;


Eyeblink_signal.outlierfree_paired = ((Eyeblink_signal.outlierfree_paired-behav.range(1))/behav.range(3))*100; % Normalize the values to max eyeopening
Eyeblink_signal.outlierfree_USonly = ((Eyeblink_signal.outlierfree_USonly-behav.range(1))/behav.range(3))*100; % Normalize the values to max eyeopening
Eyeblink_signal.outlierfree_CSonly = ((Eyeblink_signal.outlierfree_CSonly-behav.range(1))/behav.range(3))*100; % Normalize the values to max eyeopening
Eyeblink_signal.ind_trials = ((Eyeblink_signal.ind_trials-behav.range(1))/behav.range(3))*100; % Normalize the values to max eyeopening

behav.baseline_vals = ((R.trial_baseline_vals-behav.range(1))/behav.range(3))*100;
R.trial_baseline_vals_raw = R.trial_baseline_vals;
R.trial_baseline_vals = ((R.trial_baseline_vals-behav.range(1))/behav.range(3))*100;
R.trial_min_vals = ((R.trial_min_vals-behav.range(1))/behav.range(3))*100;
R.trial_max_vals = ((R.trial_max_vals-behav.range(1))/behav.range(3))*100;

%% Plot the baseline closure over trials
H(1) = figure; figureFullScreen(H(1)); hold on;
plot(behav.baseline_vals(:),'ko');
% h = lsline;
% set(h,'LineWidth',1)
for ii=1:size(behav.baseline_vals,2)
    h = plot(ii,behav.baseline_vals(ii),'o');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('Baseline eyelid closure over trials','fontsize',16); ylabel('Baseline eyelid closure (%)','fontsize',16); xlabel('Trialnumber','fontsize',16)

% Calculate the correlation over trials
corr_index = behav.baseline_vals(isnan(behav.baseline_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[behav.baseline_vals_RHO,behav.baseline_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.baseline_vals_RHO,behav.baseline_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_BaselineEyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_BaselineEyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('BaselineEyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('BaselineEyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))



%% Gather the eyelid openings at timepoint 750ms (for CSonly and paired trials)
behav.timeX_vals = [];
behav.timeX_vals_withUSonly = [];

for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        behav.timeX_vals(ii) = Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs))-behav.baseline_vals(ii);
        behav.timeX_vals_withUSonly(ii) = Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1
        behav.timeX_vals(ii) = Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs))-behav.baseline_vals(ii);
        behav.timeX_vals_withUSonly(ii) = Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.timeX_vals(ii) = NaN;
        behav.timeX_vals_withUSonly(ii) = Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs))-behav.baseline_vals(ii);
    else
        behav.timeX_vals(ii) = NaN;
    end
end

%Plot the TimeX  closure over trials
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.timeX_vals,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.timeX_vals,2)
    h = plot(ii,behav.timeX_vals(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('Eyelid closure on start airpuff over trials','fontsize',16); ylabel('Eyelid closure (% relative to baseline)','fontsize',16); xlabel('Trialnumber','fontsize',16)

% Calculate the correlation over trials
corr_index = behav.timeX_vals(isnan(behav.timeX_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[behav.timeX_vals_RHO,behav.timeX_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.timeX_vals_RHO,behav.timeX_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_timeXEyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_timeXEyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('timeXEyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('timeXEyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))


%% Calculate the full UR amp (opening at time X till max UR blink) + time of the peak
behav.maxUR_vals = R.trial_max_vals;
behav.fullURamplitude_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.fullURamplitude_vals_withCSonly = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

behav.fullURamplitude_peakTime = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.fullURamplitude_peakTime_withCSonly = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        behav.fullURamplitude_vals(ii) = R.trial_max_vals(ii)-Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs));
        behav.fullURamplitude_vals_withCSonly(ii) = R.trial_max_vals(ii)-Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs));

        [y behav.fullURamplitude_peakTime(ii)] = nanmax(Eyeblink_signal.ind_trials(ii,0.75*Param.fs:1.2*Param.fs));
        [y behav.fullURamplitude_peakTime_withCSonly(ii)] = nanmax(Eyeblink_signal.ind_trials(ii,0.75*Param.fs:1.2*Param.fs));

    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1
        behav.fullURamplitude_vals(ii) = NaN;
        behav.fullURamplitude_vals_withCSonly(ii) = R.trial_max_vals(ii)-Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs));

        behav.fullURamplitude_peakTime(ii) = NaN;
        [y behav.fullURamplitude_peakTime_withCSonly(ii)] = nanmax(Eyeblink_signal.ind_trials(ii,0.75*Param.fs:1.2*Param.fs));

    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.fullURamplitude_vals(ii) = R.trial_max_vals(ii)-Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs));
        behav.fullURamplitude_vals_withCSonly(ii) = R.trial_max_vals(ii)-Eyeblink_signal.ind_trials(ii,round(0.75*Param.fs));

        [y behav.fullURamplitude_peakTime(ii)] = nanmax(Eyeblink_signal.ind_trials(ii,0.75*Param.fs:1.2*Param.fs));
        [y behav.fullURamplitude_peakTime_withCSonly(ii)] = nanmax(Eyeblink_signal.ind_trials(ii,0.75*Param.fs:1.2*Param.fs));

    else
        behav.fullURamplitude_vals(ii)= NaN;
        behav.fullURamplitude_vals_withCSonly(ii) = NaN;

        behav.fullURamplitude_peakTime(ii) = NaN;
        behav.fullURamplitude_peakTime_withCSonly(ii) = NaN;
    end
end

behav.fullURamplitude_peakTime = (behav.fullURamplitude_peakTime+round(0.75*Param.fs))*Param.Ts; % Convert to ms
behav.fullURamplitude_peakTime_withCSonly = (behav.fullURamplitude_peakTime_withCSonly+round(0.75*Param.fs))*Param.Ts;% Convert to ms

behav.fullURamplitude_peakTime = (behav.fullURamplitude_peakTime-0.5)*1000; % normalize to onset CS and calculate ms
behav.fullURamplitude_peakTime_withCSonly = (behav.fullURamplitude_peakTime_withCSonly-0.5)*1000;

%Plot the full US blink closure over trials
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.fullURamplitude_vals,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.fullURamplitude_vals,2)
    h = plot(ii,behav.fullURamplitude_vals(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('Max UR amplitude over trials','fontsize',16); ylabel('Amplitude eyelid closure (% of max eyelid closure)','fontsize',16); xlabel('Trialnumber','fontsize',16)

% Calculate the correlation over trials
corr_index = behav.fullURamplitude_vals(isnan(behav.fullURamplitude_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[behav.fullURamplitude_vals_RHO,behav.fullURamplitude_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.fullURamplitude_vals_RHO,behav.fullURamplitude_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_MaxUREyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_MaxUREyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('MaxUREyelidClosureOverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('MaxUREyelidClosureOverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))

%% Plot the peaktime of max UR over trials
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.fullURamplitude_peakTime,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.fullURamplitude_peakTime,2)
    h = plot(ii,behav.fullURamplitude_peakTime(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('Time of max UR amplitude over trials','fontsize',16); ylabel('Time after onset CS (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16);

% Calculate the correlation over trials
corr_index = behav.fullURamplitude_peakTime(isnan(behav.fullURamplitude_peakTime)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[behav.fullURamplitude_peakTime_RHO,behav.fullURamplitude_peakTime_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.fullURamplitude_peakTime_RHO,behav.fullURamplitude_peakTime_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_TimemaxUR_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_TimemaxUR_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('TimemaxUR_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('TimemaxUR_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))

%% AUC UR USperiod (paired and USonly)
behav.AUC_USperiod_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.AUC_USperiod_vals_withCSonly = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.AUC_USonly_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.AUC_USperiod_pairedNormal_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

% Calculate UR AUC (USonly)
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        index = Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_USonly_vals(ii,1) = nansum(index(index>0));
    else
        behav.AUC_USonly_vals(ii,1) = NaN;
        %         behav.AUC_USonly_vals_withUSonly(ii,1) = NaN;
    end
end
behav.AUC_USonly_vals=behav.AUC_USonly_vals(isnan(behav.AUC_USonly_vals)==0);

% Calculate UR AUC (paired normal)
index=[];
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && R.trial_CRs(ii,1)==0
        index = Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_USperiod_pairedNormal_vals(ii) = nansum(index(index>0));
        %         behav.AUC_USonly_vals(ii,1) = nansum(index(index>0));
    else
        behav.AUC_USperiod_pairedNormal_vals(ii) = NaN;
        %         behav.AUC_USperiod_vals_withUSonly(ii,1) = NaN;
    end
end
behav.AUC_USperiod_pairedNormal_vals=behav.AUC_USperiod_pairedNormal_vals(isnan(behav.AUC_USperiod_pairedNormal_vals)==0)';


% Calculate UR AUC
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        index = Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_USperiod_vals(ii) = nansum(index(index>0));
        behav.AUC_USperiod_vals_withCSonly(ii) = nansum(index(index>0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1
        index = Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_USperiod_vals(ii) = NaN;
        behav.AUC_USperiod_vals_withCSonly(ii) = nansum(index(index>0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        index = Eyeblink_signal.ind_trials(ii,0.75*Param.fs:AUC_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_USperiod_vals(ii) = nansum(index(index>0));
        behav.AUC_USperiod_vals_withCSonly(ii) = nansum(index(index>0));
    else
        behav.AUC_USperiod_vals(ii) = NaN;
        behav.AUC_USperiod_vals_withUSonly(ii) = NaN;
    end
end

%Plot the US period AUC over time
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.AUC_USperiod_vals,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.AUC_USperiod_vals,2)
    h = plot(ii,behav.AUC_USperiod_vals(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('AUC UR USperiod over trials','fontsize',16); ylabel('AUC','fontsize',16); xlabel('Trialnumber','fontsize',16)

% Calculate the correlation over trials
corr_index = behav.AUC_USperiod_vals(isnan(behav.AUC_USperiod_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[behav.AUC_USperiod_vals_RHO,behav.AUC_USperiod_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.AUC_USperiod_vals_RHO,behav.AUC_USperiod_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_AUCUSperiod_UR_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_AUCUSperiod_UR_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('AUCUSperiod_UR_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('AUCUSperiod_UR_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))


%% Amplitude USperiod

behav.amplitude_USperiod_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.amplitude_USonly_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.amplitude_USperiod_pairedNormal_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

% for USonly + paired trials
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        behav.amplitude_USperiod_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.amplitude_USperiod_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    else
        behav.amplitude_USperiod_vals(ii) = NaN;
        behav.amplitude_USperiod_vals(ii) = NaN;
    end
end
behav.amplitude_USperiod_vals=behav.amplitude_USperiod_vals(isnan(behav.amplitude_USperiod_vals)==0)';

% for USonly trials
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.amplitude_USonly_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    else
        behav.amplitude_USonly_vals(ii) = NaN;
        behav.amplitude_USonly_vals(ii) = NaN;
    end
end
behav.amplitude_USonly_vals=behav.amplitude_USonly_vals(isnan(behav.amplitude_USonly_vals)==0)';

% for paired normal trials
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==0
        behav.amplitude_USperiod_pairedNormal_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    else
        behav.amplitude_USperiod_pairedNormal_vals(ii) = NaN;
        behav.amplitude_USperiod_pairedNormal_vals(ii) = NaN;
    end
end
behav.amplitude_USperiod_pairedNormal_vals=behav.amplitude_USperiod_pairedNormal_vals(isnan(behav.amplitude_USperiod_pairedNormal_vals)==0)';

%% AUC CSperiod (paired and CSonly) - SEO and CR together
behav.AUC_CSperiod_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.AUC_CSperiod_vals_withUSonly = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

% Calculate AUC
for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4 % SEO paired
        index = Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_CSperiod_vals(ii) = nansum(index(index<0));
        behav.AUC_CSperiod_vals_withUSonly(ii) = nansum(index(index<0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==5% SEO CSonly
        index = Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_CSperiod_vals(ii) = nansum(index(index<0));
        behav.AUC_CSperiod_vals_withUSonly(ii) = nansum(index(index<0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1% USonly
        index = Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_CSperiod_vals(ii) = NaN;
        behav.AUC_CSperiod_vals_withUSonly(ii) = nansum(index(index<0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1 % CR paired
        index = Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_CSperiod_vals(ii) = nansum(index(index>0));
        behav.AUC_CSperiod_vals_withUSonly(ii) = nansum(index(index>0));
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==2% CR CSonly
        index = Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs)-behav.baseline_vals(ii);
        behav.AUC_CSperiod_vals(ii) = nansum(index(index>0));
        behav.AUC_CSperiod_vals_withUSonly(ii) = nansum(index(index>0));
    else
        behav.AUC_CSperiod_vals(ii) = NaN;
        behav.AUC_CSperiod_vals_withUSonly(ii) = NaN;
    end
end

%Plot the CSonly period AUC over time
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.AUC_CSperiod_vals,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.AUC_CSperiod_vals,2)
    h = plot(ii,behav.AUC_CSperiod_vals(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end
title('AUC CSperiod over trials','fontsize',16); ylabel('AUC','fontsize',16); xlabel('Trialnumber','fontsize',16);

% Calculate the correlation over trials
corr_index = behav.AUC_CSperiod_vals(isnan(behav.AUC_CSperiod_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
try
    [behav.AUC_CSperiod_vals_RHO,behav.AUC_CSperiod_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));
catch
    [behav.AUC_CSperiod_vals_RHO]=NaN;
    [behav.AUC_CSperiod_vals_PVAL] =NaN;
end

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.AUC_CSperiod_vals_RHO,behav.AUC_CSperiod_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_AUCCSperiod_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_AUCCSperiod_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('AUCCSperiod_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('AUCCSperiod_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))


%% Amplitude CSperiod (paired and CSonly) - SEO and CR together

behav.amplitude_CSperiod_vals = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));
behav.amplitude_CSperiod_vals_withUSonly = NaN(1,size(Eyeblink_signal.GoTr_IDstim,2));

for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4
        behav.amplitude_CSperiod_vals(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_vals_withUSonly(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==5
        behav.amplitude_CSperiod_vals(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_vals_withUSonly(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1
        behav.amplitude_CSperiod_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_vals_withUSonly(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==2
        behav.amplitude_CSperiod_vals(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_vals_withUSonly(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.amplitude_CSperiod_vals(ii) = NaN;
        behav.amplitude_CSperiod_vals_withUSonly(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    else
        behav.amplitude_CSperiod_vals(ii) = NaN;
        behav.amplitude_CSperiod_vals_withUSonly(ii) = NaN;
    end
end

%Plot the CSonly period amp over time
H(1)=figure; figureFullScreen(H(1)); hold on;

plot(behav.amplitude_CSperiod_vals,'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(behav.amplitude_CSperiod_vals,2)
    h = plot(ii,behav.amplitude_CSperiod_vals(ii),'ko');
    if Eyeblink_signal.GoTr_IDstim(ii) ==2
        set(h,'MarkerFaceColor','k')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
        set(h,'MarkerFaceColor','r')
    elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
        set(h,'MarkerFaceColor','b')
    end
    set(h,'MarkerEdgeColor','k')
    %     set(h,'MarkerWidth',1)
end

title('Amplitude over trials','fontsize',16); ylabel('Eyelid closure relative to baseline (%)','fontsize',16); xlabel('Trialnumber','fontsize',16)

% Calculate the correlation over trials
corr_index = behav.amplitude_CSperiod_vals(isnan(behav.amplitude_CSperiod_vals)==0)';
corr_index(1:length(corr_index),2) = 1:length(corr_index);
try
    [behav.amplitude_CSperiod_vals_RHO,behav.amplitude_CSperiod_vals_PVAL] = corr(corr_index(:,1),corr_index(:,2));

catch
    [behav.amplitude_CSperiod_vals_RHO]=NaN;
    [behav.amplitude_CSperiod_vals_PVAL] =NaN;
end

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.amplitude_CSperiod_vals_RHO,behav.amplitude_CSperiod_vals_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
if Param.savefig==1
    figname = sprintf('Axis_Amplitude_CSperiod_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Axis_Amplitude_CSperiod_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)

    axis off
    figname = sprintf('Amplitude_CSperiod_OverTrials_%s.fig',Param.cellID)
    saveas(gcf,figname,'fig');
    figname = sprintf('Amplitude_CSperiod_OverTrials_%s.pdf',Param.cellID)
    print('-dpdf','-vector','-loose',figname)
end
close(H(1))

%% Amplitude for correlation - CS period
%0 for paired normal, 1 for CR paired, 2 for CR CSonly, 3 for CSonly normal, 4 for paired eyelid opening, 5 for CSonly eyelid opening

behav.amplitude_CSperiod_CSonly = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_paired = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_CSonly_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_paired_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_CSonly_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_paired_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_CSonly_normal = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_CSperiod_paired_normal = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);

for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4 % paired SEO
        behav.amplitude_CSperiod_paired(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_paired_SEO(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==5 % CSonly SEO
        behav.amplitude_CSperiod_CSonly(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_CSonly_SEO(ii) = nanmin(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1 % Paired CR
        behav.amplitude_CSperiod_paired(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_paired_CR(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==2 % CSonly CR
        behav.amplitude_CSperiod_CSonly(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_CSonly_CR(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        behav.amplitude_CSperiod_vals(ii) = NaN;
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==0 % Paired normal
        behav.amplitude_CSperiod_paired(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_paired_normal(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==3 % CSonly normal
        behav.amplitude_CSperiod_CSonly(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_CSperiod_CSonly_normal(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_CS_borders(1)*Param.fs:AUC_CS_borders(2)*Param.fs))-behav.baseline_vals(ii);
        %     else
        %         behav.amplitude_CSperiod_vals(ii) = NaN;

    end
end

for ii=1:size(Param.exclude_trials,2)
    behav.amplitude_CSperiod_CSonly(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_paired(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_CSonly_CR(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_paired_CR(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_CSonly_SEO(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_paired_SEO(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_CSonly_normal(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_CSperiod_paired_normal(Param.exclude_trials(ii)) = NaN;
end


correlation.behav_amp_behav_CSperiod_CSonly=behav.amplitude_CSperiod_CSonly;
correlation.behav_amp_behav_CSperiod_paired=behav.amplitude_CSperiod_paired;
correlation.behav_amp_behav_CSperiod_CSonly_CR=behav.amplitude_CSperiod_CSonly_CR;
correlation.behav_amp_behav_CSperiod_paired_CR=behav.amplitude_CSperiod_paired_CR;
correlation.behav_amp_behav_CSperiod_CSonly_SEO=behav.amplitude_CSperiod_CSonly_SEO;
correlation.behav_amp_behav_CSperiod_paired_SEO=behav.amplitude_CSperiod_paired_SEO;
correlation.behav_amp_behav_CSperiod_CSonly_normal=behav.amplitude_CSperiod_CSonly_normal;
correlation.behav_amp_behav_CSperiod_paired_normal=behav.amplitude_CSperiod_paired_normal;
correlation.behav_amp_behav_CSperiod_CStrials=[behav.amplitude_CSperiod_CSonly; correlation.behav_amp_behav_CSperiod_paired];

%Normalized
correlation.behav_amp_behav_CSperiod_CSonly_norm=behav.amplitude_CSperiod_CSonly/nanmax(behav.amplitude_CSperiod_CSonly);
correlation.behav_amp_behav_CSperiod_paired_norm=behav.amplitude_CSperiod_paired/nanmax(behav.amplitude_CSperiod_paired);
correlation.behav_amp_behav_CSperiod_CSonly_CR_norm=behav.amplitude_CSperiod_CSonly_CR/nanmax(behav.amplitude_CSperiod_CSonly_CR);
correlation.behav_amp_behav_CSperiod_paired_CR_norm=behav.amplitude_CSperiod_paired_CR/nanmax(behav.amplitude_CSperiod_paired_CR);
correlation.behav_amp_behav_CSperiod_CSonly_SEO_norm=behav.amplitude_CSperiod_CSonly_SEO/nanmin(behav.amplitude_CSperiod_CSonly_SEO);
correlation.behav_amp_behav_CSperiod_paired_SEO_norm=behav.amplitude_CSperiod_paired_SEO/nanmin(behav.amplitude_CSperiod_paired_SEO);
correlation.behav_amp_behav_CSperiod_CSonly_normal_norm=behav.amplitude_CSperiod_CSonly_normal/nanmax(behav.amplitude_CSperiod_CSonly_normal);
correlation.behav_amp_behav_CSperiod_paired_normal_norm=behav.amplitude_CSperiod_paired_normal/nanmax(behav.amplitude_CSperiod_paired_normal);
correlation.behav_amp_behav_CSperiod_CStrials_norm=correlation.behav_amp_behav_CSperiod_CStrials/nanmax(correlation.behav_amp_behav_CSperiod_CStrials);


%% Amplitude for correlation - US period

behav.amplitude_USperiod_USonly = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_USperiod_paired = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_USperiod_paired_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_USperiod_paired_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);
behav.amplitude_USperiod_paired_normal = NaN(size(Eyeblink_signal.GoTr_IDstim,2),1);

for ii = 1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1 % USonly
        behav.amplitude_USperiod_USonly(ii)= nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4 % paired SEO
        behav.amplitude_USperiod_paired(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_USperiod_paired_SEO(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1 % Paired CR
        behav.amplitude_USperiod_paired(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_USperiod_paired_CR(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==0 % Paired normal
        behav.amplitude_USperiod_paired(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
        behav.amplitude_USperiod_paired_normal(ii) = nanmax(Eyeblink_signal.ind_trials(ii,AUC_borders(1)*Param.fs:AUC_borders(2)*Param.fs))-behav.baseline_vals(ii);
    end
end

for ii=1:size(Param.exclude_trials,2)
    behav.amplitude_USperiod_USonly(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_USperiod_paired(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_USperiod_paired_CR(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_USperiod_paired_SEO(Param.exclude_trials(ii)) = NaN;
    behav.amplitude_USperiod_paired_normal(Param.exclude_trials(ii)) = NaN;
end


correlation.behav_amp_behav_USperiod_USonly=behav.amplitude_USperiod_USonly;
correlation.behav_amp_behav_USperiod_paired=behav.amplitude_USperiod_paired;
correlation.behav_amp_behav_USperiod_paired_CR=behav.amplitude_USperiod_paired_CR;
correlation.behav_amp_behav_USperiod_paired_SEO=behav.amplitude_USperiod_paired_SEO;
correlation.behav_amp_behav_USperiod_paired_normal=behav.amplitude_USperiod_paired_normal;
correlation.behav_amp_behav_USperiod_UStrials = [behav.amplitude_USperiod_USonly; behav.amplitude_USperiod_paired];

% Normalized
correlation.behav_amp_behav_USperiod_USonly_norm=behav.amplitude_USperiod_USonly/nanmax(behav.amplitude_USperiod_USonly);
correlation.behav_amp_behav_USperiod_paired_norm=behav.amplitude_USperiod_paired/nanmax(behav.amplitude_USperiod_paired);
correlation.behav_amp_behav_USperiod_paired_CR_norm=behav.amplitude_USperiod_paired_CR/nanmax(behav.amplitude_USperiod_paired_CR);
correlation.behav_amp_behav_USperiod_paired_SEO_norm=behav.amplitude_USperiod_paired_SEO/nanmax(behav.amplitude_USperiod_paired_SEO);
correlation.behav_amp_behav_USperiod_paired_normal_norm=behav.amplitude_USperiod_paired_normal/nanmax(behav.amplitude_USperiod_paired_normal);
correlation.behav_amp_behav_USperiod_UStrials_norm = correlation.behav_amp_behav_USperiod_UStrials/nanmax(correlation.behav_amp_behav_USperiod_UStrials);


%% Visualize SEO performance over time (CSonly and paired)

if sum(R.trial_CRs(:,1)==4)>0 || sum(R.trial_CRs(:,1)==5)>0
    behav.sum_performance_SEO = [];
    perf_counter = 0;

    for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
        if R.trial_CRs(ii,1)==4 || R.trial_CRs(ii,1)==5
            perf_counter=perf_counter+1;
            behav.sum_performance_SEO(ii) = perf_counter;
        elseif R.trial_CRs(ii,1)==0 || R.trial_CRs(ii,1)==1 || R.trial_CRs(ii,1)==2 || R.trial_CRs(ii,1)==3
            behav.sum_performance_SEO(ii) = perf_counter;
        else
            behav.sum_performance_SEO(ii) = NaN;
        end
    end
    behav.sum_performance_SEO = behav.sum_performance_SEO(isnan(behav.sum_performance_SEO)==0);
    behav.sum_performance_SEO = behav.sum_performance_SEO/nanmax(behav.sum_performance_SEO);

    H(1)=figure; figureFullScreen(H(1)); hold on;
    h = plot(behav.sum_performance_SEO,'k'); set(h,'LineWidth',1)

    title('performance_SEO over trials (paired + CSonly)','fontsize',16); ylabel('Normalized performance_SEO','fontsize',16); xlabel('Trialnumber','fontsize',16)
    a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
    if Param.savefig==1
        figname = sprintf('Axis_performance_SEO_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_performance_SEO_CSperiod_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('performance_SEO_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('performance_SEO_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
    close(H(1))
end

%% Visualize CR performance over time (CSonly and paired)

if sum(R.trial_CRs(:,1)==1)>0 || sum(R.trial_CRs(:,1)==2)>0
    behav.sum_performance_CR = [];
    perf_counter = 0;
    try
        for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
            if R.trial_CRs(ii,1)==1 || R.trial_CRs(ii,1)==2
                perf_counter=perf_counter+1;
                behav.sum_performance_CR(ii) = perf_counter;
            elseif R.trial_CRs(ii,1)==0 || R.trial_CRs(ii,1)==4 || R.trial_CRs(ii,1)==5 || R.trial_CRs(ii,1)==3
                behav.sum_performance_CR(ii) = perf_counter;
            else
                behav.sum_performance_CR(ii) = NaN;
            end
        end
    end
    behav.sum_performance_CR = behav.sum_performance_CR(isnan(behav.sum_performance_CR)==0);
    behav.sum_performance_CR = behav.sum_performance_CR/nanmax(behav.sum_performance_CR);

    H(1)=figure; figureFullScreen(H(1)); hold on;
    h = plot(behav.sum_performance_CR,'k'); set(h,'LineWidth',1)

    title('performance_CR over trials (paired + CSonly)','fontsize',16); ylabel('Normalized performance_CR','fontsize',16); xlabel('Trialnumber','fontsize',16)
    a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);
    if Param.savefig==1
        figname = sprintf('Axis_performance_CR_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_performance_CR_CSperiod_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('performance_CR_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('performance_CR_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
    close(H(1))
end


%% Determine the onset of the behavior

Param.fsratio = 100000/Param.fs;
cd(Param.path_ephys)
mkdir('Onset_analysis_behav')
cd([Param.path_ephys '\Onset_analysis_behav'])

if Param.savefile==1
    %% Detect SEO onsets
    if sum(R.trial_CRs(:,1)==4)>0 || sum(R.trial_CRs(:,1)==5)>0
        mkdir('Ind_onset_SEO')
        cd([Param.path_ephys '\Onset_analysis_behav\Ind_onset_SEO'])

        behav.onset_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
        H(1)=figure; figureFullScreen(H(1));

        for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
            if R.trial_CRs(ii,1)==4 | R.trial_CRs(ii,1)==5
                ii
                plot(Eyeblink_signal.ind_trials(ii,:),'r'); hold on;
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                line([0.75*Param.fs 0.75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                line([0.76*Param.fs 0.76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                title('Select 2 timepoints around SEO onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.5*Param.fs) && xindex_ginput(2)<round(0.75*Param.fs)
                    [y xindex] = nanmax(Eyeblink_signal.ind_trials(ii,round(xindex_ginput(1)):round(xindex_ginput(2))));
                    behav.onset_SEO(ii,1) = xindex+round(xindex_ginput(1));
                    behav.onset_SEO(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
                    figname = sprintf('Axis_SEO_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Axis_SEOindOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose',figname)

                    axis off
                    figname = sprintf('SEO_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('SEOindOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose',figname)
                else
                    behav.onset_SEO(ii,1) =  NaN;
                    behav.onset_SEO(ii,2) = NaN;
                end
                hold off; plot(NaN);
            end
        end
        close(gcf)
        % Retrieve correct values
        behav.onset_SEO(:,1) = ((behav.onset_SEO(:,1)/Param.fs)-0.5)*1000;
        behav.onset_SEO(:,2) = behav.onset_SEO(:,2)-behav.baseline_vals';
    end

    %% Detect CR onsets
    if sum(R.trial_CRs(:,1)==1)>0 || sum(R.trial_CRs(:,1)==2)>0
        cd([Param.path_ephys '\Onset_analysis_behav'])
        mkdir('Ind_onset_CR')
        cd([Param.path_ephys '\Onset_analysis_behav\Ind_onset_CR'])

        behav.onset_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
        H(1)=figure; figureFullScreen(H(1));

        for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
            if R.trial_CRs(ii,1)==1 || R.trial_CRs(ii,1)==2
                ii
                plot(Eyeblink_signal.ind_trials(ii,:),'r'); hold on;
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                line([0.75*Param.fs 0.75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                line([0.76*Param.fs 0.76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                title('Select 2 timepoints around CR onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.5*Param.fs) && xindex_ginput(2)<round(0.75*Param.fs)
                    [y xindex] = nanmin(Eyeblink_signal.ind_trials(ii,round(xindex_ginput(1)):round(xindex_ginput(2))));
                    behav.onset_CR(ii,1) = xindex+round(xindex_ginput(1));
                    behav.onset_CR(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
                    figname = sprintf('Axis_CR_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Axis_CRindOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose',figname)

                    axis off
                    figname = sprintf('CR_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('CRindOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose',figname)
                else
                    behav.onset_CR(ii,1) =  NaN;
                    behav.onset_CR(ii,2) = NaN;
                end
                hold off; plot(NaN);
            end
        end

        close(gcf)
        % Retrieve correct values
        behav.onset_CR(:,1) = ((behav.onset_CR(:,1)/Param.fs)-0.5)*1000;
        behav.onset_CR(:,2) = behav.onset_CR(:,2)-behav.baseline_vals';
    end

    %% Plot SEO onset time over trials

    cd([Param.path_ephys '\Onset_analysis_behav']);
    if sum(R.trial_CRs(:,1)==4)>0 || sum(R.trial_CRs(:,1)==5)>0
        H(1)=figure; figureFullScreen(H(1)); hold on;
        plot(behav.onset_SEO(:,1),'ko');
        h = lsline;
        set(h,'LineWidth',1)
        for ii=1:size(behav.onset_SEO(:,1),1)
            h = plot(ii,behav.onset_SEO(ii,1),'ko');
            if Eyeblink_signal.GoTr_IDstim(ii) ==2
                set(h,'MarkerFaceColor','k')
            elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
                set(h,'MarkerFaceColor','r')
            elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
                set(h,'MarkerFaceColor','b')
            end
            set(h,'MarkerEdgeColor','k')
            %     set(h,'MarkerWidth',1)
        end

        title('SEO onset time over trials (paired + CSonly)','fontsize',16); ylabel('Time after onset CS (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
        % Calculate the correlation over trials
        corr_index = behav.onset_SEO(isnan(behav.onset_SEO(:,1))==0,1);
        corr_index(1:length(corr_index),2) = 1:length(corr_index);
        try
            [behav.onset_SEO_RHO,behav.onset_SEO_PVAL] = corr(corr_index(:,1),corr_index(:,2));
        catch
            behav.onset_SEO_RHO = NaN;
            behav.onset_SEO_PVAL = NaN;
        end
        % Print the values in the scatterplot
        text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
        text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.onset_SEO_RHO,behav.onset_SEO_PVAL),'FontSize',14)
        a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

        figname = sprintf('Axis_SEOonsetTime_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_SEOonsetTime_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('SEOonsetTime_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('SEOonsetTime_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        close(H(1))
    end

    %% Plot CR onset time over trials

    cd([Param.path_ephys '\Onset_analysis_behav']);
    if sum(R.trial_CRs(:,1)==1)>0 || sum(R.trial_CRs(:,1)==2)>0
        H(1)=figure; figureFullScreen(H(1)); hold on;
        plot(behav.onset_CR(:,1),'ko');
        h = lsline;
        set(h,'LineWidth',1)
        for ii=1:size(behav.onset_CR(:,1),1)
            h = plot(ii,behav.onset_CR(ii,1),'ko');
            if Eyeblink_signal.GoTr_IDstim(ii) ==2
                set(h,'MarkerFaceColor','k')
            elseif Eyeblink_signal.GoTr_IDstim(ii) ==3
                set(h,'MarkerFaceColor','r')
            elseif Eyeblink_signal.GoTr_IDstim(ii) ==1
                set(h,'MarkerFaceColor','b')
            end
            set(h,'MarkerEdgeColor','k')
            %     set(h,'MarkerWidth',1)
        end

        title('CR onset time over trials (paired + CSonly)','fontsize',16); ylabel('Time after onset CS (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
        % Calculate the correlation over trials
        corr_index = behav.onset_CR(isnan(behav.onset_CR(:,1))==0,1);
        corr_index(1:length(corr_index),2) = 1:length(corr_index);
        try
            [behav.onset_CR_RHO,behav.onset_CR_PVAL] = corr(corr_index(:,1),corr_index(:,2));
        catch
            behav.onset_CR_RHO=NaN;
            behav.onset_CR_PVAL=NaN;
        end

        % Print the values in the scatterplot
        text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
        text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',behav.onset_CR_RHO,behav.onset_CR_PVAL),'FontSize',14)
        a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

        figname = sprintf('Axis_CRonsetTime_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_CRonsetTime_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('CRonsetTime_OverTrials_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('CRonsetTime_OverTrials_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        close(H(1))
    end
end
%% Make a composite figure of all behavioral traces
cd(Param.path_ephys)
mkdir('Ind_behav')
cd([Param.path_ephys '\Ind_behav'])

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==2)>0 % for US only trials
    behav.ind_trials_USonly = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
            behav.ind_trials_USonly = [behav.ind_trials_USonly; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_USonly),'k'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('USonly trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_USonly_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_USonly_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_USonly_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_USonly_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==1)>0  % For CS only trials
    behav.ind_trials_CSonly = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1
            behav.ind_trials_CSonly = [behav.ind_trials_CSonly; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_CSonly),'k'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('CSonly trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_CSonly_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_CSonly_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_CSonly_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_CSonly_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==1)>0 && sum(R.trial_CRs(:,1)==2)>0 % CSonly CR trials
    behav.ind_trials_CSonly_CR = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==2
            behav.ind_trials_CSonly_CR = [behav.ind_trials_CSonly_CR; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_CSonly_CR),'g'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('CSonly_CR trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_CSonly_CR_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_CSonly_CR_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_CSonly_CR_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_CSonly_CR_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==1)>0 && sum(R.trial_CRs(:,1)==3)>0 % CSonly normal trials
    behav.ind_trials_CSonly_normal = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==3
            behav.ind_trials_CSonly_normal = [behav.ind_trials_CSonly_normal; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_CSonly_normal),'b'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('CSonly_normal trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_CSonly_normal_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_CSonly_normal_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_CSonly_normal_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_CSonly_normal_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==1)>0 && sum(R.trial_CRs(:,1)==5)>0 % CSonly SEO trials
    behav.ind_trials_CSonly_SEO = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==5
            behav.ind_trials_CSonly_SEO = [behav.ind_trials_CSonly_SEO; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_CSonly_SEO),'r'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('CSonly_SEO trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_CSonly_SEO_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_CSonly_SEO_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_CSonly_SEO_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_CSonly_SEO_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==3)>0 && sum(Eyeblink_signal.outlierindx_paired==1)>0 % Paired trials
    behav.ind_trials_paired = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
            behav.ind_trials_paired = [behav.ind_trials_paired; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_paired),'k'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('paired trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_paired_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_paired_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_paired_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_paired_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))


H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==3)>0 && sum(R.trial_CRs(:,1)==1)>0 % paired CR trials
    behav.ind_trials_paired_CR = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1
            behav.ind_trials_paired_CR = [behav.ind_trials_paired_CR; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_paired_CR),'g'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('paired_CR trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_paired_CR_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_paired_CR_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_paired_CR_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_paired_CR_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

H(1)=figure; figureFullScreen(H(1)); hold on;
if sum(Eyeblink_signal.GoTr_IDstim==3)>0 && sum(R.trial_CRs(:,1)==0)>0 % Paired normal trials
    behav.ind_trials_paired_normal = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==0
            behav.ind_trials_paired_normal = [behav.ind_trials_paired_normal; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_paired_normal),'b'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('paired_normal trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_paired_normal_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_paired_normal_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_paired_normal_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_paired_normal_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))
%
H(1)=figure; figureFullScreen(H(1));hold on;
if sum(Eyeblink_signal.GoTr_IDstim==3)>0 && sum(R.trial_CRs(:,1)==4)>0 % paired SEO trials
    behav.ind_trials_paired_SEO = [];
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4
            behav.ind_trials_paired_SEO = [behav.ind_trials_paired_SEO; (Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))];
            h=plot((Eyeblink_signal.ind_trials(ii,:)-nanmean(Eyeblink_signal.ind_trials(ii,1:round(0.5*Param.fs))))); set(h, 'color', [0.7 0.7 0.7]);set(h, 'LineWidth', [1]);
        end
    end

    h = plot(nanmean(behav.ind_trials_paired_SEO),'r'); set(h, 'LineWidth', [1]);xlim([0*Param.fs 2*Param.fs]); ylim([-50 100]);
    line([.5*Param.fs .5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.75*Param.fs .75*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([.76*Param.fs .76*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    title('paired_SEO trials - behavior'); ylabel('Eyelid closure (%)'); xlabel('Time (samples)')
    if Param.savefig==1
        figname = sprintf('Axis_behav_paired_SEO_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('Axis_behav_paired_SEO_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)

        axis off
        figname = sprintf('behav_paired_SEO_%s.fig',Param.cellID)
        saveas(gcf,figname,'fig');
        figname = sprintf('behav_paired_SEO_%s.pdf',Param.cellID)
        print('-dpdf','-vector','-loose',figname)
    end
end
close(H(1))

%% Save the newly generated data
cd([Param.path_ephys '\behavior\advanced'])
if Param.savefile==1
    savename = sprintf('Results_behavior_advanced_%s_%s',Param.cellID);
    %     save(savename,'behav','OnsetAnalysis');
    save(savename,'behav');
end


