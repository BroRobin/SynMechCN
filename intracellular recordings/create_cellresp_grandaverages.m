%% Generate group and condition averages for Vm and eyelid traces and output figures
% Generate the 'grandaverage' figures including data from CS-activated /
% CS-suppressed, separating per trial response type, group and CR/EO
% dependency.

% (c) R. Broersen, Erasmus MC, 2023


% Define the classification outcomes (1 = CS-activated/2 = CS-suppressed/
% 0 = no response)

allavgs.CSresp_trained = [2
    1
    1
    1
    1
    1
    0
    0
    0
    1
    1
    1
    1
    2
    1];

allavgs.CSresp_trained_CRdep = [1
    0
    0
    0
    0
    1
    NaN
    NaN
    NaN
    1
    0
    0
    NaN
    0
    1
    ];

allavgs.CSresp_naive = [1
    1
    0
    2
    1
    0
    0
    2
    1
    0
    2
    1
    1
    1
    1];

allavgs.CSresp_naive_CRdep = [1
    1
    NaN
    0
    NaN
    NaN
    NaN
    1
    1
    NaN
    0
    1
    NaN
    1
    NaN
    ];

allavgs.USresp_trained = [2
    1
    1
    1
    1
    1
    2
    1
    1
    1
    1
    1
    1
    0
    1];

allavgs.USresp_naive = [1
    1
    1
    2
    1
    1
    1
    1
    1
    1
    2
    1
    1
    1
    1];

%% Calculate averages based on CS-activated data (trained)

% ephys
allavgs.activated_avg_trained_CS_allcells = nanmean(allavgs.trained_CS(allavgs.CSresp_trained==1,:),1);
allavgs.activated_avg_trained_CS_normal_allcells = nanmean(allavgs.trained_CS_normal(allavgs.CSresp_trained==1,:),1);
allavgs.activated_avg_trained_CS_CR_allcells = nanmean(allavgs.trained_CS_CR(allavgs.CSresp_trained==1,:),1);
allavgs.activated_avg_trained_CS_SEO_allcells = nanmean(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1,:),1);

idx = allavgs.trained_CS(allavgs.CSresp_trained==1,:);
allavgs.activated_sem_trained_CS_allcells = nanstd(allavgs.trained_CS(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_normal(allavgs.CSresp_trained==1,:);
allavgs.activated_sem_trained_CS_normal_allcells = nanstd(allavgs.trained_CS_normal(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_CR(allavgs.CSresp_trained==1,:);
allavgs.activated_sem_trained_CS_CR_allcells = nanstd(allavgs.trained_CS_CR(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_SEO(allavgs.CSresp_trained==1,:);
allavgs.activated_sem_trained_CS_SEO_allcells = nanstd(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells-allavgs.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells+allavgs.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.activated_avg_trained_CS_allcells = nanmean(allbehav.trained_CS(allavgs.CSresp_trained==1,:),1);
allbehav.activated_avg_trained_CS_normal_allcells = nanmean(allbehav.trained_CS_normal(allavgs.CSresp_trained==1,:),1);
allbehav.activated_avg_trained_CS_CR_allcells = nanmean(allbehav.trained_CS_CR(allavgs.CSresp_trained==1,:),1);
allbehav.activated_avg_trained_CS_SEO_allcells = nanmean(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1,:),1);

idx = allbehav.trained_CS(allavgs.CSresp_trained==1,:);
allbehav.activated_sem_trained_CS_allcells = nanstd(allbehav.trained_CS(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_normal(allavgs.CSresp_trained==1,:);
allbehav.activated_sem_trained_CS_normal_allcells = nanstd(allbehav.trained_CS_normal(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_CR(allavgs.CSresp_trained==1,:);
allbehav.activated_sem_trained_CS_CR_allcells = nanstd(allbehav.trained_CS_CR(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_SEO(allavgs.CSresp_trained==1,:);
allbehav.activated_sem_trained_CS_SEO_allcells = nanstd(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells-allbehav.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells+allbehav.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Calculate averages based on CS-activated data (naive)
% ephys
allavgs.activated_avg_naive_CS_allcells = nanmean(allavgs.naive_CS(allavgs.CSresp_naive==1,:),1);
allavgs.activated_avg_naive_CS_normal_allcells = nanmean(allavgs.naive_CS_normal(allavgs.CSresp_naive==1,:),1);
allavgs.activated_avg_naive_CS_CR_allcells = nanmean(allavgs.naive_CS_CR(allavgs.CSresp_naive==1,:),1);
allavgs.activated_avg_naive_CS_SEO_allcells = nanmean(allavgs.naive_CS_SEO(allavgs.CSresp_naive==1,:),1);

idx = allavgs.naive_CS(allavgs.CSresp_naive==1,:);
allavgs.activated_sem_naive_CS_allcells = nanstd(allavgs.naive_CS(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_normal(allavgs.CSresp_naive==1,:);
allavgs.activated_sem_naive_CS_normal_allcells = nanstd(allavgs.naive_CS_normal(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_CR(allavgs.CSresp_naive==1,:);
allavgs.activated_sem_naive_CS_CR_allcells = nanstd(allavgs.naive_CS_CR(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_SEO(allavgs.CSresp_naive==1,:);
allavgs.activated_sem_naive_CS_SEO_allcells = nanstd(allavgs.naive_CS_SEO(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells-allavgs.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells+allavgs.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.activated_avg_naive_CS_allcells = nanmean(allbehav.naive_CS(allavgs.CSresp_naive==1,:),1);
allbehav.activated_avg_naive_CS_normal_allcells = nanmean(allbehav.naive_CS_normal(allavgs.CSresp_naive==1,:),1);
allbehav.activated_avg_naive_CS_CR_allcells = nanmean(allbehav.naive_CS_CR(allavgs.CSresp_naive==1,:),1);
allbehav.activated_avg_naive_CS_SEO_allcells = nanmean(allbehav.naive_CS_SEO(allavgs.CSresp_naive==1,:),1);

idx = allbehav.naive_CS(allavgs.CSresp_naive==1,:);
allbehav.activated_sem_naive_CS_allcells = nanstd(allbehav.naive_CS(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_normal(allavgs.CSresp_naive==1,:);
allbehav.activated_sem_naive_CS_normal_allcells = nanstd(allbehav.naive_CS_normal(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_CR(allavgs.CSresp_naive==1,:);
allbehav.activated_sem_naive_CS_CR_allcells = nanstd(allbehav.naive_CS_CR(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_SEO(allavgs.CSresp_naive==1,:);
allbehav.activated_sem_naive_CS_SEO_allcells = nanstd(allbehav.naive_CS_SEO(allavgs.CSresp_naive==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells-allbehav.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells+allbehav.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Plot in the same figure - CS activated
figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells-allavgs.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_allcells+allavgs.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells-allavgs.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_allcells+allavgs.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_grandaverage_ephys_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_grandaverage_ephys_both.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_allcells-allbehav.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_allcells+allbehav.activated_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_allcells-allbehav.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_allcells+allbehav.activated_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_grandaverage_behav_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_grandaverage_behav_both.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on CS-suppressed data (trained)

% ephys
allavgs.suppressed_avg_trained_CS_allcells = nanmean(allavgs.trained_CS(allavgs.CSresp_trained==2,:),1);
allavgs.suppressed_avg_trained_CS_normal_allcells = nanmean(allavgs.trained_CS_normal(allavgs.CSresp_trained==2,:),1);
allavgs.suppressed_avg_trained_CS_CR_allcells = nanmean(allavgs.trained_CS_CR(allavgs.CSresp_trained==2,:),1);
allavgs.suppressed_avg_trained_CS_SEO_allcells = nanmean(allavgs.trained_CS_SEO(allavgs.CSresp_trained==2,:),1);

idx = allavgs.trained_CS(allavgs.CSresp_trained==2,:);
allavgs.suppressed_sem_trained_CS_allcells = nanstd(allavgs.trained_CS(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_normal(allavgs.CSresp_trained==2,:);
allavgs.suppressed_sem_trained_CS_normal_allcells = nanstd(allavgs.trained_CS_normal(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_CR(allavgs.CSresp_trained==2,:);
allavgs.suppressed_sem_trained_CS_CR_allcells = nanstd(allavgs.trained_CS_CR(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_SEO(allavgs.CSresp_trained==2,:);
allavgs.suppressed_sem_trained_CS_SEO_allcells = nanstd(allavgs.trained_CS_SEO(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells-allavgs.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells+allavgs.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.suppressed_avg_trained_CS_allcells = nanmean(allbehav.trained_CS(allavgs.CSresp_trained==2,:),1);
allbehav.suppressed_avg_trained_CS_normal_allcells = nanmean(allbehav.trained_CS_normal(allavgs.CSresp_trained==2,:),1);
allbehav.suppressed_avg_trained_CS_CR_allcells = nanmean(allbehav.trained_CS_CR(allavgs.CSresp_trained==2,:),1);
allbehav.suppressed_avg_trained_CS_SEO_allcells = nanmean(allbehav.trained_CS_SEO(allavgs.CSresp_trained==2,:),1);

idx = allbehav.trained_CS(allavgs.CSresp_trained==2,:);
allbehav.suppressed_sem_trained_CS_allcells = nanstd(allbehav.trained_CS(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_normal(allavgs.CSresp_trained==2,:);
allbehav.suppressed_sem_trained_CS_normal_allcells = nanstd(allbehav.trained_CS_normal(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_CR(allavgs.CSresp_trained==2,:);
allbehav.suppressed_sem_trained_CS_CR_allcells = nanstd(allbehav.trained_CS_CR(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_SEO(allavgs.CSresp_trained==2,:);
allbehav.suppressed_sem_trained_CS_SEO_allcells = nanstd(allbehav.trained_CS_SEO(allavgs.CSresp_trained==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells-allbehav.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells+allbehav.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Calculate averages based on CS-suppressed data (naive)
% ephys
allavgs.suppressed_avg_naive_CS_allcells = nanmean(allavgs.naive_CS(allavgs.CSresp_naive==2,:),1);
allavgs.suppressed_avg_naive_CS_normal_allcells = nanmean(allavgs.naive_CS_normal(allavgs.CSresp_naive==2,:),1);
allavgs.suppressed_avg_naive_CS_CR_allcells = nanmean(allavgs.naive_CS_CR(allavgs.CSresp_naive==2,:),1);
allavgs.suppressed_avg_naive_CS_SEO_allcells = nanmean(allavgs.naive_CS_SEO(allavgs.CSresp_naive==2,:),1);

idx = allavgs.naive_CS(allavgs.CSresp_naive==2,:);
allavgs.suppressed_sem_naive_CS_allcells = nanstd(allavgs.naive_CS(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_normal(allavgs.CSresp_naive==2,:);
allavgs.suppressed_sem_naive_CS_normal_allcells = nanstd(allavgs.naive_CS_normal(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_CR(allavgs.CSresp_naive==2,:);
allavgs.suppressed_sem_naive_CS_CR_allcells = nanstd(allavgs.naive_CS_CR(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_SEO(allavgs.CSresp_naive==2,:);
allavgs.suppressed_sem_naive_CS_SEO_allcells = nanstd(allavgs.naive_CS_SEO(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells-allavgs.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells+allavgs.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.suppressed_avg_naive_CS_allcells = nanmean(allbehav.naive_CS(allavgs.CSresp_naive==2,:),1);
allbehav.suppressed_avg_naive_CS_normal_allcells = nanmean(allbehav.naive_CS_normal(allavgs.CSresp_naive==2,:),1);
allbehav.suppressed_avg_naive_CS_CR_allcells = nanmean(allbehav.naive_CS_CR(allavgs.CSresp_naive==2,:),1);
allbehav.suppressed_avg_naive_CS_SEO_allcells = nanmean(allbehav.naive_CS_SEO(allavgs.CSresp_naive==2,:),1);

idx = allbehav.naive_CS(allavgs.CSresp_naive==2,:);
allbehav.suppressed_sem_naive_CS_allcells = nanstd(allbehav.naive_CS(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_normal(allavgs.CSresp_naive==2,:);
allbehav.suppressed_sem_naive_CS_normal_allcells = nanstd(allbehav.naive_CS_normal(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_CR(allavgs.CSresp_naive==2,:);
allbehav.suppressed_sem_naive_CS_CR_allcells = nanstd(allbehav.naive_CS_CR(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_SEO(allavgs.CSresp_naive==2,:);
allbehav.suppressed_sem_naive_CS_SEO_allcells = nanstd(allbehav.naive_CS_SEO(allavgs.CSresp_naive==2,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells-allbehav.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells+allbehav.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Plot in the same figure - CS suppressed
figure; hold on; plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells-allavgs.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_allcells+allavgs.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells-allavgs.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_allcells+allavgs.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_grandaverage_ephys_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_grandaverage_ephys_both.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_allcells-allbehav.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_allcells+allbehav.suppressed_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_allcells-allbehav.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_allcells+allbehav.suppressed_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_grandaverage_behav_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_grandaverage_behav_both.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - NR (trained)

% ephys
allavgs.NR_avg_trained_CS_allcells = nanmean(allavgs.trained_CS(allavgs.CSresp_trained==0,:),1);
allavgs.NR_avg_trained_CS_normal_allcells = nanmean(allavgs.trained_CS_normal(allavgs.CSresp_trained==0,:),1);
allavgs.NR_avg_trained_CS_CR_allcells = nanmean(allavgs.trained_CS_CR(allavgs.CSresp_trained==0,:),1);
allavgs.NR_avg_trained_CS_SEO_allcells = nanmean(allavgs.trained_CS_SEO(allavgs.CSresp_trained==0,:),1);

idx = allavgs.trained_CS(allavgs.CSresp_trained==0,:);
allavgs.NR_sem_trained_CS_allcells = nanstd(allavgs.trained_CS(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_normal(allavgs.CSresp_trained==0,:);
allavgs.NR_sem_trained_CS_normal_allcells = nanstd(allavgs.trained_CS_normal(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_CR(allavgs.CSresp_trained==0,:);
allavgs.NR_sem_trained_CS_CR_allcells = nanstd(allavgs.trained_CS_CR(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_SEO(allavgs.CSresp_trained==0,:);
allavgs.NR_sem_trained_CS_SEO_allcells = nanstd(allavgs.trained_CS_SEO(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells-allavgs.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells+allavgs.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.NR_avg_trained_CS_allcells = nanmean(allbehav.trained_CS(allavgs.CSresp_trained==0,:),1);
allbehav.NR_avg_trained_CS_normal_allcells = nanmean(allbehav.trained_CS_normal(allavgs.CSresp_trained==0,:),1);
allbehav.NR_avg_trained_CS_CR_allcells = nanmean(allbehav.trained_CS_CR(allavgs.CSresp_trained==0,:),1);
allbehav.NR_avg_trained_CS_SEO_allcells = nanmean(allbehav.trained_CS_SEO(allavgs.CSresp_trained==0,:),1);

idx = allbehav.trained_CS(allavgs.CSresp_trained==0,:);
allbehav.NR_sem_trained_CS_allcells = nanstd(allbehav.trained_CS(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_normal(allavgs.CSresp_trained==0,:);
allbehav.NR_sem_trained_CS_normal_allcells = nanstd(allbehav.trained_CS_normal(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_CR(allavgs.CSresp_trained==0,:);
allbehav.NR_sem_trained_CS_CR_allcells = nanstd(allbehav.trained_CS_CR(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_SEO(allavgs.CSresp_trained==0,:);
allbehav.NR_sem_trained_CS_SEO_allcells = nanstd(allbehav.trained_CS_SEO(allavgs.CSresp_trained==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells-allbehav.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.avg_trained_CS_allcells+allbehav.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Calculate averages based on responders - NR (naive)
% ephys
allavgs.NR_avg_naive_CS_allcells = nanmean(allavgs.naive_CS(allavgs.CSresp_naive==0,:),1);
allavgs.NR_avg_naive_CS_normal_allcells = nanmean(allavgs.naive_CS_normal(allavgs.CSresp_naive==0,:),1);
allavgs.NR_avg_naive_CS_CR_allcells = nanmean(allavgs.naive_CS_CR(allavgs.CSresp_naive==0,:),1);
allavgs.NR_avg_naive_CS_SEO_allcells = nanmean(allavgs.naive_CS_SEO(allavgs.CSresp_naive==0,:),1);

idx = allavgs.naive_CS(allavgs.CSresp_naive==0,:);
allavgs.NR_sem_naive_CS_allcells = nanstd(allavgs.naive_CS(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_normal(allavgs.CSresp_naive==0,:);
allavgs.NR_sem_naive_CS_normal_allcells = nanstd(allavgs.naive_CS_normal(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_CR(allavgs.CSresp_naive==0,:);
allavgs.NR_sem_naive_CS_CR_allcells = nanstd(allavgs.naive_CS_CR(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_SEO(allavgs.CSresp_naive==0,:);
allavgs.NR_sem_naive_CS_SEO_allcells = nanstd(allavgs.naive_CS_SEO(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells-allavgs.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells+allavgs.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%behav
allbehav.NR_avg_naive_CS_allcells = nanmean(allbehav.naive_CS(allavgs.CSresp_naive==0,:),1);
allbehav.NR_avg_naive_CS_normal_allcells = nanmean(allbehav.naive_CS_normal(allavgs.CSresp_naive==0,:),1);
allbehav.NR_avg_naive_CS_CR_allcells = nanmean(allbehav.naive_CS_CR(allavgs.CSresp_naive==0,:),1);
allbehav.NR_avg_naive_CS_SEO_allcells = nanmean(allbehav.naive_CS_SEO(allavgs.CSresp_naive==0,:),1);

idx = allbehav.naive_CS(allavgs.CSresp_naive==0,:);
allbehav.NR_sem_naive_CS_allcells = nanstd(allbehav.naive_CS(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_normal(allavgs.CSresp_naive==0,:);
allbehav.NR_sem_naive_CS_normal_allcells = nanstd(allbehav.naive_CS_normal(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_CR(allavgs.CSresp_naive==0,:);
allbehav.NR_sem_naive_CS_CR_allcells = nanstd(allbehav.naive_CS_CR(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_SEO(allavgs.CSresp_naive==0,:);
allbehav.NR_sem_naive_CS_SEO_allcells = nanstd(allbehav.naive_CS_SEO(allavgs.CSresp_naive==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

figure; hold on; plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells-allbehav.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.avg_naive_CS_allcells+allbehav.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

%% Plot in the same figure - CS NR
figure; hold on; plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells-allavgs.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_trained_CS_allcells+allavgs.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells-allavgs.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_ephys,allavgs.NR_avg_naive_CS_allcells+allavgs.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSNR_grandaverage_ephys_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSNR_grandaverage_ephys_both.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.NR_avg_trained_CS_allcells,'Color',allavgs.colormap(11,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.NR_avg_trained_CS_allcells-allbehav.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));
plot(allavgs.timeX_behav,allbehav.NR_avg_trained_CS_allcells+allbehav.NR_sem_trained_CS_allcells,'Color',allavgs.colormap(11,:));

plot(allavgs.timeX_behav,allbehav.NR_avg_naive_CS_allcells,'Color',allavgs.colormap(15,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.NR_avg_naive_CS_allcells-allbehav.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));
plot(allavgs.timeX_behav,allbehav.NR_avg_naive_CS_allcells+allbehav.NR_sem_naive_CS_allcells,'Color',allavgs.colormap(15,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSNR_grandaverage_behav_both.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSNR_grandaverage_behav_both.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - CS-activated - CR vs normal trials TRAINED

figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_allcells-allavgs.activated_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_allcells+allavgs.activated_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_allcells-allavgs.activated_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_allcells+allavgs.activated_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_conditioned_CRvsnormal.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_conditioned_CRvsnormal.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_allcells-allbehav.activated_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_allcells+allbehav.activated_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_allcells-allbehav.activated_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_allcells+allbehav.activated_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_conditioned_CRvsnormal_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_conditioned_CRvsnormal_behav.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - CS-suppressed - CR vs normal trials TRAINED

figure; hold on; plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_CR_allcells-allavgs.suppressed_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_CR_allcells+allavgs.suppressed_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_normal_allcells-allavgs.suppressed_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_trained_CS_normal_allcells+allavgs.suppressed_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_conditioned_CRvsnormal.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_conditioned_CRvsnormal.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_CR_allcells-allbehav.suppressed_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_CR_allcells+allbehav.suppressed_sem_trained_CS_CR_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_normal_allcells-allbehav.suppressed_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_trained_CS_normal_allcells+allbehav.suppressed_sem_trained_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_conditioned_CRvsnormal_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_conditioned_CRvsnormal_behav.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - CS-activated - SEO vs normal trials naive

figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_allcells-allavgs.activated_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_allcells+allavgs.activated_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_allcells-allavgs.activated_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_allcells+allavgs.activated_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_naive_SEOvsnormal.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_naive_SEOvsnormal.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_allcells-allbehav.activated_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_allcells+allbehav.activated_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_allcells-allbehav.activated_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_allcells+allbehav.activated_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSactivated_naive_SEOvsnormal_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSactivated_naive_SEOvsnormal_behav.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - CS-suppressed - SEO vs normal trials naive

figure; hold on; plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_SEO_allcells-allavgs.suppressed_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_SEO_allcells+allavgs.suppressed_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_normal_allcells-allavgs.suppressed_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.suppressed_avg_naive_CS_normal_allcells+allavgs.suppressed_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_naive_SEOvsnormal.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_naive_SEOvsnormal.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_SEO_allcells-allbehav.suppressed_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_SEO_allcells+allbehav.suppressed_sem_naive_CS_SEO_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_normal_allcells-allbehav.suppressed_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.suppressed_avg_naive_CS_normal_allcells+allbehav.suppressed_sem_naive_CS_normal_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_CSsuppressed_naive_SEOvsnormal_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_CSsuppressed_naive_SEOvsnormal_behav.pdf')
print('-dpdf','-vector','-loose',figname)

%% Calculate averages based on responders - CS-activated CR-dependent

% ephys
allavgs.activated_avg_trained_CS_CRdep_allcells = nanmean(allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allavgs.activated_avg_trained_CS_normal_CRdep_allcells = nanmean(allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allavgs.activated_avg_trained_CS_CR_CRdep_allcells = nanmean(allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allavgs.activated_avg_trained_CS_SEO_CRdep_allcells = nanmean(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);

idx = allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allavgs.activated_sem_trained_CS_CRdep_allcells = nanstd(allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allavgs.activated_sem_trained_CS_normal_CRdep_allcells = nanstd(allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allavgs.activated_sem_trained_CS_CR_CRdep_allcells = nanstd(allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allavgs.activated_sem_trained_CS_SEO_CRdep_allcells = nanstd(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%behav
allbehav.activated_avg_trained_CS_CRdep_allcells = nanmean(allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allbehav.activated_avg_trained_CS_normal_CRdep_allcells = nanmean(allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allbehav.activated_avg_trained_CS_CR_CRdep_allcells = nanmean(allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);
allbehav.activated_avg_trained_CS_SEO_CRdep_allcells = nanmean(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1);

idx = allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allbehav.activated_sem_trained_CS_CRdep_allcells = nanstd(allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allbehav.activated_sem_trained_CS_normal_CRdep_allcells = nanstd(allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allbehav.activated_sem_trained_CS_CR_CRdep_allcells = nanstd(allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:);
allbehav.activated_sem_trained_CS_SEO_CRdep_allcells = nanstd(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%% Plot in the same figure - CS activated CR dep
figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRdep_allcells-allavgs.activated_sem_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRdep_allcells+allavgs.activated_sem_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRdep_allcells-allavgs.activated_sem_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRdep_allcells+allavgs.activated_sem_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRdep_ephys.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRdep_ephys.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRdep_allcells-allbehav.activated_sem_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRdep_allcells+allbehav.activated_sem_trained_CS_CR_CRdep_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRdep_allcells-allbehav.activated_sem_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRdep_allcells+allbehav.activated_sem_trained_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRdep_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRdep_behav.pdf')
print('-dpdf','-vector','-loose',figname)


%% Calculate averages based on responders - CS activated CR-independent

% ephys
allavgs.activated_avg_trained_CS_CRindep_allcells = nanmean(allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allavgs.activated_avg_trained_CS_normal_CRindep_allcells = nanmean(allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allavgs.activated_avg_trained_CS_CR_CRindep_allcells = nanmean(allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allavgs.activated_avg_trained_CS_SEO_CRindep_allcells = nanmean(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);

idx = allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allavgs.activated_sem_trained_CS_CRindep_allcells = nanstd(allavgs.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allavgs.activated_sem_trained_CS_normal_CRindep_allcells = nanstd(allavgs.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allavgs.activated_sem_trained_CS_CR_CRindep_allcells = nanstd(allavgs.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allavgs.activated_sem_trained_CS_SEO_CRindep_allcells = nanstd(allavgs.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%behav
allbehav.activated_avg_trained_CS_CRindep_allcells = nanmean(allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allbehav.activated_avg_trained_CS_normal_CRindep_allcells = nanmean(allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allbehav.activated_avg_trained_CS_CR_CRindep_allcells = nanmean(allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);
allbehav.activated_avg_trained_CS_SEO_CRindep_allcells = nanmean(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1);

idx = allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allbehav.activated_sem_trained_CS_CRindep_allcells = nanstd(allbehav.trained_CS(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allbehav.activated_sem_trained_CS_normal_CRindep_allcells = nanstd(allbehav.trained_CS_normal(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allbehav.activated_sem_trained_CS_CR_CRindep_allcells = nanstd(allbehav.trained_CS_CR(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:);
allbehav.activated_sem_trained_CS_SEO_CRindep_allcells = nanstd(allbehav.trained_CS_SEO(allavgs.CSresp_trained==1&allavgs.CSresp_trained_CRdep==0,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%% Plot in the same figure - CS activated CR independent
figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRindep_allcells-allavgs.activated_sem_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_CR_CRindep_allcells+allavgs.activated_sem_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRindep_allcells-allavgs.activated_sem_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_trained_CS_normal_CRindep_allcells+allavgs.activated_sem_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRindep_ephys.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRindep_ephys.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRindep_allcells-allbehav.activated_sem_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_CR_CRindep_allcells+allbehav.activated_sem_trained_CS_CR_CRindep_allcells,'Color',allavgs.colormap(3,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRindep_allcells-allbehav.activated_sem_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_trained_CS_normal_CRindep_allcells+allbehav.activated_sem_trained_CS_normal_CRindep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRindep_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_trained_CSactivated_CRvsNR_CRindep_behav.pdf')
print('-dpdf','-vector','-loose',figname)


%% Naive: EO dependency
% Calculate averages based on responders - activated EU-dependent

% ephys
allavgs.activated_avg_naive_CS_CRdep_allcells = nanmean(allavgs.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allavgs.activated_avg_naive_CS_normal_CRdep_allcells = nanmean(allavgs.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allavgs.activated_avg_naive_CS_CR_CRdep_allcells = nanmean(allavgs.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allavgs.activated_avg_naive_CS_SEO_CRdep_allcells = nanmean(allavgs.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);

idx = allavgs.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allavgs.activated_sem_naive_CS_CRdep_allcells = nanstd(allavgs.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allavgs.activated_sem_naive_CS_normal_CRdep_allcells = nanstd(allavgs.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allavgs.activated_sem_naive_CS_CR_CRdep_allcells = nanstd(allavgs.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allavgs.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allavgs.activated_sem_naive_CS_SEO_CRdep_allcells = nanstd(allavgs.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%behav
allbehav.activated_avg_naive_CS_CRdep_allcells = nanmean(allbehav.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allbehav.activated_avg_naive_CS_normal_CRdep_allcells = nanmean(allbehav.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allbehav.activated_avg_naive_CS_CR_CRdep_allcells = nanmean(allbehav.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);
allbehav.activated_avg_naive_CS_SEO_CRdep_allcells = nanmean(allbehav.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1);

idx = allbehav.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allbehav.activated_sem_naive_CS_CRdep_allcells = nanstd(allbehav.naive_CS(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allbehav.activated_sem_naive_CS_normal_CRdep_allcells = nanstd(allbehav.naive_CS_normal(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allbehav.activated_sem_naive_CS_CR_CRdep_allcells = nanstd(allbehav.naive_CS_CR(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));
idx = allbehav.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:);
allbehav.activated_sem_naive_CS_SEO_CRdep_allcells = nanstd(allbehav.naive_CS_SEO(allavgs.CSresp_naive==1&allavgs.CSresp_naive_CRdep==1,:),1)/sqrt(sum(isnan(idx(:,1))==0));

%% Plot in the same figure - CS activated CR dep
figure; hold on; plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_CRdep_allcells-allavgs.activated_sem_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_SEO_CRdep_allcells+allavgs.activated_sem_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_CRdep_allcells-allavgs.activated_sem_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_ephys,allavgs.activated_avg_naive_CS_normal_CRdep_allcells+allavgs.activated_sem_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_naive_CSactivated_CRvsNR_CRdep_ephys.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_naive_CSactivated_CRvsNR_CRdep_ephys.pdf')
print('-dpdf','-vector','-loose',figname)

figure; hold on; plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_CRdep_allcells-allbehav.activated_sem_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_SEO_CRdep_allcells+allbehav.activated_sem_naive_CS_SEO_CRdep_allcells,'Color',allavgs.colormap(4,:));

plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:),'linewidth',2);
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_CRdep_allcells-allbehav.activated_sem_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));
plot(allavgs.timeX_behav,allbehav.activated_avg_naive_CS_normal_CRdep_allcells+allbehav.activated_sem_naive_CS_normal_CRdep_allcells,'Color',allavgs.colormap(1,:));

xlim([-0.15 0.25]);
% ylim([-2 5])
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

figname = sprintf('alldata_naive_CSactivated_CRvsNR_CRdep_behav.fig')
saveas(gcf,figname,'fig');
figname = sprintf('alldata_naive_CSactivated_CRvsNR_CRdep_behav.pdf')
print('-dpdf','-vector','-loose',figname)
%
% figure
% image(reshape(allavgs.colormap,[1 size(allavgs.colormap)]))