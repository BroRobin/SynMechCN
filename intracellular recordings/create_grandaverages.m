%% Generate group and condition averages for Vm and eyelid traces and output figures
% Generate the 'grandaverage' figures including data from all cells,
% separated per trial response type and group.

% (c) R. Broersen, Erasmus MC, 2023

%Ephys data - trained
clear; close all

allavgs.timeX_ephys = linspace(-0.5,1.5,200000);
allavgs.timeX_behav = linspace(-0.5,1.5,4884);

% Predefine the variables (ephys)
allavgs.trained_CS = NaN(15,200000);
allavgs.trained_CS_CR = NaN(15,200000);
allavgs.trained_CS_normal = NaN(15,200000);
allavgs.trained_CS_SEO = NaN(15,200000);

allavgs.trained_US = NaN(15,200000);
allavgs.trained_USonly = NaN(15,200000);
allavgs.trained_US_CR = NaN(15,200000);
allavgs.trained_US_normal = NaN(15,200000);
allavgs.trained_US_SEO = NaN(15,200000);

allavgs.naive_CS = NaN(15,200000);
allavgs.naive_CS_CR = NaN(15,200000);
allavgs.naive_CS_normal = NaN(15,200000);
allavgs.naive_CS_SEO = NaN(15,200000);

allavgs.naive_US = NaN(15,200000);
allavgs.naive_USonly = NaN(15,200000);
allavgs.naive_US_CR = NaN(15,200000);
allavgs.naive_US_normal = NaN(15,200000);
allavgs.naive_US_SEO = NaN(15,200000);

% Predefine the variables (behav)
allbehav.trained_CS = NaN(15,4884);
allbehav.trained_CS_CR = NaN(15,4884);
allbehav.trained_CS_normal = NaN(15,4884);
allbehav.trained_CS_SEO = NaN(15,4884);

allbehav.trained_US = NaN(15,4884);
allbehav.trained_USonly = NaN(15,4884);
allbehav.trained_US_CR = NaN(15,4884);
allbehav.trained_US_normal = NaN(15,4884);
allbehav.trained_US_SEO = NaN(15,4884);

allbehav.naive_CS = NaN(15,4884);
allbehav.naive_CS_CR = NaN(15,4884);
allbehav.naive_CS_normal = NaN(15,4884);
allbehav.naive_CS_SEO = NaN(15,4884);

allbehav.naive_US = NaN(15,4884);
allbehav.naive_USonly = NaN(15,4884);
allbehav.naive_US_CR = NaN(15,4884);
allbehav.naive_US_normal = NaN(15,4884);
allbehav.naive_US_SEO = NaN(15,4884);


%% Collect all ephys averages for trained mice
ii=1; % Define the cell number from 1 to 15 when importing the data from each cell

% Manually load the ephys saved data file Results_ephys_CSandUS_XX.mat and
% execute the following lines.
allavgs.trained_CS(ii,:) = Spkavgs.avgtrace_CS;
allavgs.trained_CS_CR(ii,:) = Spkavgs.avgtrace_CS_CR;
allavgs.trained_CS_normal(ii,:) = Spkavgs.avgtrace_CS_normal;
allavgs.trained_CS_SEO(ii,:) = Spkavgs.avgtrace_CS_SEO;

allavgs.trained_US(ii,:) = Spkavgs.avgtrace_US;
allavgs.trained_USonly(ii,:) = Spkavgs.avgtrace_USonly;
allavgs.trained_US_CR(ii,:) = Spkavgs.avgtrace_US_CR;
allavgs.trained_US_normal(ii,:) = Spkavgs.avgtrace_US_normal;
allavgs.trained_US_SEO(ii,:) = Spkavgs.avgtrace_US_SEO;


%% Collect all ephys averages for naive mice
ii=1; % Define the cell number from 1 to 15 when importing the data from each cell

% Manually load the ephys saved data file Results_ephys_CSandUS_XX.mat and
% execute the following lines.
allavgs.naive_CS(ii,:) = Spkavgs.avgtrace_CS;
allavgs.naive_CS_CR(ii,:) = Spkavgs.avgtrace_CS_CR;
allavgs.naive_CS_normal(ii,:) = Spkavgs.avgtrace_CS_normal;
allavgs.naive_CS_SEO(ii,:) = Spkavgs.avgtrace_CS_SEO;

allavgs.naive_US(ii,:) = Spkavgs.avgtrace_US;
allavgs.naive_USonly(ii,:) = Spkavgs.avgtrace_USonly;
allavgs.naive_US_CR(ii,:) = Spkavgs.avgtrace_US_CR;
allavgs.naive_US_normal(ii,:) = Spkavgs.avgtrace_US_normal;
allavgs.naive_US_SEO(ii,:) = Spkavgs.avgtrace_US_SEO;


%% Collect all eyelid averages for trained mice
ii=1; % Define the cell number from 1 to 15 when importing the data from each cell

% Manually load the behav saved data files:
% Results_behavior_XX_XX.mat and Results_behavior_advanced_XX.mat

% for each cell run the lines below.

% CS trials
try
    plotidx = [behav.ind_trials_paired; behav.ind_trials_CSonly];
catch
    try
        plotidx = [behav.ind_trials_paired];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_CS(ii,:) = plotidx_avg;

%CS_CR trials
try
    plotidx = [behav.ind_trials_paired_CR; behav.ind_trials_CSonly_CR];
catch
    try
        plotidx = [behav.ind_trials_paired_CR];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_CS_CR(ii,:) = plotidx_avg;

%CS_normal trials
try
    plotidx = [behav.ind_trials_paired_normal; behav.ind_trials_CSonly_normal];
catch
    try
        plotidx = [behav.ind_trials_paired_normal];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_CS_normal(ii,:) = plotidx_avg;

%CS_SEO trials
try
    plotidx = [behav.ind_trials_paired_SEO; behav.ind_trials_CSonly_SEO];
catch
    try
        plotidx = [behav.ind_trials_paired_SEO];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_CS_SEO(ii,:) = plotidx_avg;

% US trials
try
    plotidx = [behav.ind_trials_paired; behav.ind_trials_USonly];
catch
    try
        plotidx = [behav.ind_trials_paired];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_US(ii,:) = plotidx_avg;

% US_CR trials
try
    plotidx = [behav.ind_trials_paired_CR];
catch
    try
        plotidx = [behav.ind_trials_paired_CR];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_US_CR(ii,:) = plotidx_avg;

% USonly trials
try
    plotidx = [behav.ind_trials_USonly];
catch

    plotidx = NaN(1,4884);

end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_USonly(ii,:) = plotidx_avg;

% US_normal trials
try
    plotidx = [behav.ind_trials_paired_normal];
catch
    try
        plotidx = [behav.ind_trials_paired_normal];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_US_normal(ii,:) = plotidx_avg;

% US_SEO trials
try
    plotidx = [behav.ind_trials_paired_SEO];
catch
    try
        plotidx = [behav.ind_trials_paired_SEO];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.trained_US_SEO(ii,:) = plotidx_avg;


%% Naive
ii=1; % Define the cell number from 1 to 15 when importing the data from each cell

% Manually load the behav saved data files:
% Results_behavior_XX_XX.mat and Results_behavior_advanced_XX.mat

% for each cell run the lines below.

% CS trials
try
    plotidx = [behav.ind_trials_paired; behav.ind_trials_CSonly];
catch
    try
        plotidx = [behav.ind_trials_paired];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_CS(ii,:) = plotidx_avg;

%CS_CR trials
try
    plotidx = [behav.ind_trials_paired_CR; behav.ind_trials_CSonly_CR];
catch
    try
        plotidx = [behav.ind_trials_paired_CR];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_CS_CR(ii,:) = plotidx_avg;

%CS_normal trials
try
    plotidx = [behav.ind_trials_paired_normal; behav.ind_trials_CSonly_normal];
catch
    try
        plotidx = [behav.ind_trials_paired_normal];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_CS_normal(ii,:) = plotidx_avg;

%CS_SEO trials
try
    plotidx = [behav.ind_trials_paired_SEO; behav.ind_trials_CSonly_SEO];
catch
    try
        plotidx = [behav.ind_trials_paired_SEO];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_CS_SEO(ii,:) = plotidx_avg;

% US trials
try
    plotidx = [behav.ind_trials_paired; behav.ind_trials_USonly];
catch
    try
        plotidx = [behav.ind_trials_paired];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_US(ii,:) = plotidx_avg;

% US_CR trials
try
    plotidx = [behav.ind_trials_paired_CR];
catch
    try
        plotidx = [behav.ind_trials_paired_CR];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_US_CR(ii,:) = plotidx_avg;

% USonly trials
try
    plotidx = [behav.ind_trials_USonly];
catch

    plotidx = NaN(1,4884);

end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_USonly(ii,:) = plotidx_avg;

% US_normal trials
try
    plotidx = [behav.ind_trials_paired_normal];
catch
    try
        plotidx = [behav.ind_trials_paired_normal];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_US_normal(ii,:) = plotidx_avg;

% US_SEO trials
try
    plotidx = [behav.ind_trials_paired_SEO];
catch
    try
        plotidx = [behav.ind_trials_paired_SEO];
    catch
        plotidx = NaN(1,4884);
    end
end
plotidx_avg = nanmean(plotidx,1);
allbehav.naive_US_SEO(ii,:) = plotidx_avg;

save('alldata_avgs_trained+naive.mat','allavgs','allbehav')

%% Create average graphs - Trained
% Once all data has been gathered, run the analyses below to generate the
% figures.

allavgs.avg_trained_CS_allcells = nanmean(allavgs.trained_CS,1);
allavgs.avg_trained_CS_normal_allcells = nanmean(allavgs.trained_CS_normal,1);
allavgs.avg_trained_CS_CR_allcells = nanmean(allavgs.trained_CS_CR,1);
allavgs.avg_trained_CS_SEO_allcells = nanmean(allavgs.trained_CS_SEO,1);

allavgs.sem_trained_CS_allcells = nanstd(allavgs.trained_CS,1)/sqrt(sum(isnan(allavgs.trained_CS(:,1))==0));
allavgs.sem_trained_CS_normal_allcells = nanstd(allavgs.trained_CS_normal,1)/sqrt(sum(isnan(allavgs.trained_CS_normal(:,1))==0));
allavgs.sem_trained_CS_CR_allcells = nanstd(allavgs.trained_CS_CR,1)/sqrt(sum(isnan(allavgs.trained_CS_CR(:,1))==0));
allavgs.sem_trained_CS_SEO_allcells = nanstd(allavgs.trained_CS_SEO,1)/sqrt(sum(isnan(allavgs.trained_CS_SEO(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells,'k');
plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells-allavgs.sem_trained_CS_allcells,'r');
plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells+allavgs.sem_trained_CS_allcells,'r');
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_ephys_trained.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_ephys_trained.pdf')
print('-dpdf','-vector','-loose',figname)

%behav
allbehav.avg_trained_CS_allcells = nanmean(allbehav.trained_CS,1);
allbehav.avg_trained_CS_normal_allcells = nanmean(allbehav.trained_CS_normal,1);
allbehav.avg_trained_CS_CR_allcells = nanmean(allbehav.trained_CS_CR,1);
allbehav.avg_trained_CS_SEO_allcells = nanmean(allbehav.trained_CS_SEO,1);

allbehav.sem_trained_CS_allcells = nanstd(allbehav.trained_CS,1)/sqrt(sum(isnan(allbehav.trained_CS(:,1))==0));
allbehav.sem_trained_CS_normal_allcells = nanstd(allbehav.trained_CS_normal,1)/sqrt(sum(isnan(allbehav.trained_CS_normal(:,1))==0));
allbehav.sem_trained_CS_CR_allcells = nanstd(allbehav.trained_CS_CR,1)/sqrt(sum(isnan(allbehav.trained_CS_CR(:,1))==0));
allbehav.sem_trained_CS_SEO_allcells = nanstd(allbehav.trained_CS_SEO,1)/sqrt(sum(isnan(allbehav.trained_CS_SEO(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells,'k');
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells-allbehav.sem_trained_CS_allcells,'r');
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells+allbehav.sem_trained_CS_allcells,'r');
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_behav_trained.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_behav_trained.pdf')
print('-dpdf','-vector','-loose',figname)

%% Create average graphs - Naive

allavgs.avg_naive_CS_allcells = nanmean(allavgs.naive_CS,1);
allavgs.avg_naive_CS_normal_allcells = nanmean(allavgs.naive_CS_normal,1);
allavgs.avg_naive_CS_CR_allcells = nanmean(allavgs.naive_CS_CR,1);
allavgs.avg_naive_CS_SEO_allcells = nanmean(allavgs.naive_CS_SEO,1);

allavgs.sem_naive_CS_allcells = nanstd(allavgs.naive_CS,1)/sqrt(sum(isnan(allavgs.naive_CS(:,1))==0));
allavgs.sem_naive_CS_normal_allcells = nanstd(allavgs.naive_CS_normal,1)/sqrt(sum(isnan(allavgs.naive_CS_normal(:,1))==0));
allavgs.sem_naive_CS_CR_allcells = nanstd(allavgs.naive_CS_CR,1)/sqrt(sum(isnan(allavgs.naive_CS_CR(:,1))==0));
allavgs.sem_naive_CS_SEO_allcells = nanstd(allavgs.naive_CS_SEO,1)/sqrt(sum(isnan(allavgs.naive_CS_SEO(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells,'k');
plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells-allavgs.sem_naive_CS_allcells,'r');
plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells+allavgs.sem_naive_CS_allcells,'r');
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_ephys_naive.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_ephys_naive.pdf')
print('-dpdf','-vector','-loose',figname)

%behav
allbehav.avg_naive_CS_allcells = nanmean(allbehav.naive_CS,1);
allbehav.avg_naive_CS_normal_allcells = nanmean(allbehav.naive_CS_normal,1);
allbehav.avg_naive_CS_CR_allcells = nanmean(allbehav.naive_CS_CR,1);
allbehav.avg_naive_CS_SEO_allcells = nanmean(allbehav.naive_CS_SEO,1);

allbehav.sem_naive_CS_allcells = nanstd(allbehav.naive_CS,1)/sqrt(sum(isnan(allbehav.naive_CS(:,1))==0));
allbehav.sem_naive_CS_normal_allcells = nanstd(allbehav.naive_CS_normal,1)/sqrt(sum(isnan(allbehav.naive_CS_normal(:,1))==0));
allbehav.sem_naive_CS_CR_allcells = nanstd(allbehav.naive_CS_CR,1)/sqrt(sum(isnan(allbehav.naive_CS_CR(:,1))==0));
allbehav.sem_naive_CS_SEO_allcells = nanstd(allbehav.naive_CS_SEO,1)/sqrt(sum(isnan(allbehav.naive_CS_SEO(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells,'k');
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells-allbehav.sem_naive_CS_allcells,'r');
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells+allbehav.sem_naive_CS_allcells,'r');
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_behav_naive.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_behav_naive.pdf')
print('-dpdf','-vector','-loose',figname)

%% Plot in the same figure
figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'LineWidth',2);
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells-allbehav.sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells+allbehav.sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'LineWidth',2);
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells-allbehav.sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells+allbehav.sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_behav_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_behav_both.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'LineWidth',2);
plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells-allavgs.sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.avg_trained_CS_allcells+allavgs.sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'LineWidth',2);
plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells-allavgs.sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.avg_naive_CS_allcells+allavgs.sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_allneurons_grandaverage_ephys_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_allneurons_grandaverage_ephys_both.pdf')
print('-dpdf','-vector','-loose',figname)