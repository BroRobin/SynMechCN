%% Generate figures showing data algined to eyelid onset or ephys onset, comparing trained vs naive
% (c) R. Broersen, Erasmus MC, 2023

% Manually load the following files files for each mouse and run the following code:
% Results_onsetalignedtraces_xxxx


% In case of trained mice
trained=[];
trained.eyelidOnset_eyelid_trials_AVG = [];
trained.eyelidOnset_Vm_trials_AVG = [];
trained.VmOnset_eyelid_trials_AVG = [];
trained.VmOnset_Vm_trials_AVG = [];


trained.eyelidOnset_eyelid_trials_AVG = [trained.eyelidOnset_eyelid_trials_AVG; Onsetnorm.eyelidOnset_eyelid_trials_AVG];
trained.eyelidOnset_Vm_trials_AVG = [trained.eyelidOnset_Vm_trials_AVG; Onsetnorm.eyelidOnset_Vm_trials_AVG];
trained.VmOnset_eyelid_trials_AVG = [trained.VmOnset_eyelid_trials_AVG; Onsetnorm.VmOnset_eyelid_trials_AVG];
trained.VmOnset_Vm_trials_AVG = [trained.VmOnset_Vm_trials_AVG; Onsetnorm.VmOnset_Vm_trials_AVG];

% In case of naive mice
naive=[];
naive.eyelidOnset_eyelid_trials_AVG = [];
naive.eyelidOnset_Vm_trials_AVG = [];
naive.VmOnset_eyelid_trials_AVG = [];
naive.VmOnset_Vm_trials_AVG = [];

naive.eyelidOnset_eyelid_trials_AVG = [naive.eyelidOnset_eyelid_trials_AVG; Onsetnorm.eyelidOnset_eyelid_trials_AVG];
naive.eyelidOnset_Vm_trials_AVG = [naive.eyelidOnset_Vm_trials_AVG; Onsetnorm.eyelidOnset_Vm_trials_AVG];
naive.VmOnset_eyelid_trials_AVG = [naive.VmOnset_eyelid_trials_AVG; Onsetnorm.VmOnset_eyelid_trials_AVG];
naive.VmOnset_Vm_trials_AVG = [naive.VmOnset_Vm_trials_AVG; Onsetnorm.VmOnset_Vm_trials_AVG];

%% Calculate group averages
% After gathering all individual mouse data in MATLAB, run the following
% code.

trained.eyelidOnset_eyelid_trials_AVG_AVG = nanmean(trained.eyelidOnset_eyelid_trials_AVG);
trained.eyelidOnset_Vm_trials_AVG_AVG = nanmean(trained.eyelidOnset_Vm_trials_AVG);
trained.VmOnset_eyelid_trials_AVG_AVG = nanmean(trained.VmOnset_eyelid_trials_AVG);
trained.VmOnset_Vm_trials_AVG_AVG = nanmean(trained.VmOnset_Vm_trials_AVG);

trained.eyelidOnset_eyelid_trials_AVG_SEM = nanstd(trained.eyelidOnset_eyelid_trials_AVG)/sqrt(size(trained.eyelidOnset_eyelid_trials_AVG,1));
trained.eyelidOnset_Vm_trials_AVG_SEM = nanstd(trained.eyelidOnset_Vm_trials_AVG)/sqrt(size(trained.eyelidOnset_Vm_trials_AVG,1));
trained.VmOnset_eyelid_trials_AVG_SEM = nanstd(trained.VmOnset_eyelid_trials_AVG)/sqrt(size(trained.VmOnset_eyelid_trials_AVG,1));
trained.VmOnset_Vm_trials_AVG_SEM = nanstd(trained.VmOnset_Vm_trials_AVG)/sqrt(size(trained.VmOnset_Vm_trials_AVG,1));

naive.eyelidOnset_eyelid_trials_AVG_AVG = nanmean(naive.eyelidOnset_eyelid_trials_AVG);
naive.eyelidOnset_Vm_trials_AVG_AVG = nanmean(naive.eyelidOnset_Vm_trials_AVG);
naive.VmOnset_eyelid_trials_AVG_AVG = nanmean(naive.VmOnset_eyelid_trials_AVG);
naive.VmOnset_Vm_trials_AVG_AVG = nanmean(naive.VmOnset_Vm_trials_AVG);

naive.eyelidOnset_eyelid_trials_AVG_SEM = nanstd(naive.eyelidOnset_eyelid_trials_AVG)/sqrt(size(naive.eyelidOnset_eyelid_trials_AVG,1));
naive.eyelidOnset_Vm_trials_AVG_SEM = nanstd(naive.eyelidOnset_Vm_trials_AVG)/sqrt(size(naive.eyelidOnset_Vm_trials_AVG,1));
naive.VmOnset_eyelid_trials_AVG_SEM = nanstd(naive.VmOnset_eyelid_trials_AVG)/sqrt(size(naive.VmOnset_eyelid_trials_AVG,1));
naive.VmOnset_Vm_trials_AVG_SEM = nanstd(naive.VmOnset_Vm_trials_AVG)/sqrt(size(naive.VmOnset_Vm_trials_AVG,1));

%% Figures eyelid centered

%trained
figure; subplot(2,1,1); hold on; plot(xtimes_behav,trained.eyelidOnset_eyelid_trials_AVG_AVG,'k');
plot(xtimes_behav,trained.eyelidOnset_eyelid_trials_AVG_AVG+trained.eyelidOnset_eyelid_trials_AVG_SEM,'k');
plot(xtimes_behav,trained.eyelidOnset_eyelid_trials_AVG_AVG-trained.eyelidOnset_eyelid_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

subplot(2,1,2); hold on; plot(xtimes_Vm,trained.eyelidOnset_Vm_trials_AVG_AVG,'k');
plot(xtimes_Vm,trained.eyelidOnset_Vm_trials_AVG_AVG+trained.eyelidOnset_Vm_trials_AVG_SEM,'k');
plot(xtimes_Vm,trained.eyelidOnset_Vm_trials_AVG_AVG-trained.eyelidOnset_Vm_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

%naive
subplot(2,1,1); hold on; plot(xtimes_behav,naive.eyelidOnset_eyelid_trials_AVG_AVG,'r');
plot(xtimes_behav,naive.eyelidOnset_eyelid_trials_AVG_AVG+naive.eyelidOnset_eyelid_trials_AVG_SEM,'r');
plot(xtimes_behav,naive.eyelidOnset_eyelid_trials_AVG_AVG-naive.eyelidOnset_eyelid_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

subplot(2,1,2); hold on; plot(xtimes_Vm,naive.eyelidOnset_Vm_trials_AVG_AVG,'r');
plot(xtimes_Vm,naive.eyelidOnset_Vm_trials_AVG_AVG+naive.eyelidOnset_Vm_trials_AVG_SEM,'r');
plot(xtimes_Vm,naive.eyelidOnset_Vm_trials_AVG_AVG-naive.eyelidOnset_Vm_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])
title('eyelid onset')
ylim([-10 5])
figname = sprintf('EyelidAligned_hyp.fig')
saveas(gcf,figname,'fig');
figname = sprintf('EyelidAligned_hyp.pdf')
print('-dpdf','-vector','-loose',figname)

%% Figures Vm centered

%trained
figure; subplot(2,1,1); hold on; plot(xtimes_behav,trained.VmOnset_eyelid_trials_AVG_AVG,'k');
plot(xtimes_behav,trained.VmOnset_eyelid_trials_AVG_AVG+trained.VmOnset_eyelid_trials_AVG_SEM,'k');
plot(xtimes_behav,trained.VmOnset_eyelid_trials_AVG_AVG-trained.VmOnset_eyelid_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

subplot(2,1,2); hold on; plot(xtimes_Vm,trained.VmOnset_Vm_trials_AVG_AVG,'k');
plot(xtimes_Vm,trained.VmOnset_Vm_trials_AVG_AVG+trained.VmOnset_Vm_trials_AVG_SEM,'k');
plot(xtimes_Vm,trained.VmOnset_Vm_trials_AVG_AVG-trained.VmOnset_Vm_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

%naive
subplot(2,1,1); hold on; plot(xtimes_behav,naive.VmOnset_eyelid_trials_AVG_AVG,'r');
plot(xtimes_behav,naive.VmOnset_eyelid_trials_AVG_AVG+naive.VmOnset_eyelid_trials_AVG_SEM,'r');
plot(xtimes_behav,naive.VmOnset_eyelid_trials_AVG_AVG-naive.VmOnset_eyelid_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])

subplot(2,1,2); hold on; plot(xtimes_Vm,naive.VmOnset_Vm_trials_AVG_AVG,'r');
plot(xtimes_Vm,naive.VmOnset_Vm_trials_AVG_AVG+naive.VmOnset_Vm_trials_AVG_SEM,'r');
plot(xtimes_Vm,naive.VmOnset_Vm_trials_AVG_AVG-naive.VmOnset_Vm_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.5 0.5])
ylim([-10 5])
title('Vm onset')

figname = sprintf('VmAligned_hyp.fig')
saveas(gcf,figname,'fig');
figname = sprintf('VmAligned_hyp.pdf')
print('-dpdf','-vector','-loose',figname)
