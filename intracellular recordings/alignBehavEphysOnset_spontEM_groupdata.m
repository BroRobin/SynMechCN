%% Create averages based on group data and generate figures
% (c) R. Broersen, Erasmus MC, 2023

% Predefine the variables (run only first time)
opening=[];
opening.eyelidOnset_eyelid_trials_AVG = [];
opening.eyelidOnset_Vm_trials_AVG = [];
opening.VmOnset_eyelid_trials_AVG = [];
opening.VmOnset_Vm_trials_AVG = [];

closure=[];
closure.eyelidOnset_eyelid_trials_AVG = [];
closure.eyelidOnset_Vm_trials_AVG = [];
closure.VmOnset_eyelid_trials_AVG = [];
closure.VmOnset_Vm_trials_AVG = [];

% Manually load for each cell Results_SpontEM_lowPeak_onsetalignedtraces
% and run lines below. lowpeak = opening. Only take the depolarization
% cells
opening.eyelidOnset_eyelid_trials_AVG = [opening.eyelidOnset_eyelid_trials_AVG; Onsetnorm.eyelidOnset_eyelid_trials_AVG];
opening.eyelidOnset_Vm_trials_AVG = [opening.eyelidOnset_Vm_trials_AVG; Onsetnorm.eyelidOnset_Vm_trials_AVG];
opening.VmOnset_eyelid_trials_AVG = [opening.VmOnset_eyelid_trials_AVG; Onsetnorm.VmOnset_eyelid_trials_AVG];
opening.VmOnset_Vm_trials_AVG = [opening.VmOnset_Vm_trials_AVG; Onsetnorm.VmOnset_Vm_trials_AVG];

% Manually load for each cell Results_SpontEM_highPeak_onsetalignedtraces
% and run lines below. highpeak = closure. Only take the depolarization
% cells
closure.eyelidOnset_eyelid_trials_AVG = [closure.eyelidOnset_eyelid_trials_AVG; Onsetnorm.eyelidOnset_eyelid_trials_AVG];
closure.eyelidOnset_Vm_trials_AVG = [closure.eyelidOnset_Vm_trials_AVG; Onsetnorm.eyelidOnset_Vm_trials_AVG];
closure.VmOnset_eyelid_trials_AVG = [closure.VmOnset_eyelid_trials_AVG; Onsetnorm.VmOnset_eyelid_trials_AVG];
closure.VmOnset_Vm_trials_AVG = [closure.VmOnset_Vm_trials_AVG; Onsetnorm.VmOnset_Vm_trials_AVG];

%% Calculate group averages based on individual cell data
opening.eyelidOnset_eyelid_trials_AVG_AVG = nanmean(opening.eyelidOnset_eyelid_trials_AVG);
opening.eyelidOnset_Vm_trials_AVG_AVG = nanmean(opening.eyelidOnset_Vm_trials_AVG);
opening.VmOnset_eyelid_trials_AVG_AVG = nanmean(opening.VmOnset_eyelid_trials_AVG);
opening.VmOnset_Vm_trials_AVG_AVG = nanmean(opening.VmOnset_Vm_trials_AVG);

opening.eyelidOnset_eyelid_trials_AVG_SEM = nanstd(opening.eyelidOnset_eyelid_trials_AVG)/sqrt(size(opening.eyelidOnset_eyelid_trials_AVG,1));
opening.eyelidOnset_Vm_trials_AVG_SEM = nanstd(opening.eyelidOnset_Vm_trials_AVG)/sqrt(size(opening.eyelidOnset_Vm_trials_AVG,1));
opening.VmOnset_eyelid_trials_AVG_SEM = nanstd(opening.VmOnset_eyelid_trials_AVG)/sqrt(size(opening.VmOnset_eyelid_trials_AVG,1));
opening.VmOnset_Vm_trials_AVG_SEM = nanstd(opening.VmOnset_Vm_trials_AVG)/sqrt(size(opening.VmOnset_Vm_trials_AVG,1));

closure.eyelidOnset_eyelid_trials_AVG_AVG = nanmean(closure.eyelidOnset_eyelid_trials_AVG);
closure.eyelidOnset_Vm_trials_AVG_AVG = nanmean(closure.eyelidOnset_Vm_trials_AVG);
closure.VmOnset_eyelid_trials_AVG_AVG = nanmean(closure.VmOnset_eyelid_trials_AVG);
closure.VmOnset_Vm_trials_AVG_AVG = nanmean(closure.VmOnset_Vm_trials_AVG);

closure.eyelidOnset_eyelid_trials_AVG_SEM = nanstd(closure.eyelidOnset_eyelid_trials_AVG)/sqrt(size(closure.eyelidOnset_eyelid_trials_AVG,1));
closure.eyelidOnset_Vm_trials_AVG_SEM = nanstd(closure.eyelidOnset_Vm_trials_AVG)/sqrt(size(closure.eyelidOnset_Vm_trials_AVG,1));
closure.VmOnset_eyelid_trials_AVG_SEM = nanstd(closure.VmOnset_eyelid_trials_AVG)/sqrt(size(closure.VmOnset_eyelid_trials_AVG,1));
closure.VmOnset_Vm_trials_AVG_SEM = nanstd(closure.VmOnset_Vm_trials_AVG)/sqrt(size(closure.VmOnset_Vm_trials_AVG,1));

%% Generate figures eyelid centered

%opening
figure; subplot(2,1,1); hold on; plot(xtimes_behav,opening.eyelidOnset_eyelid_trials_AVG_AVG,'k');
plot(xtimes_behav,opening.eyelidOnset_eyelid_trials_AVG_AVG+opening.eyelidOnset_eyelid_trials_AVG_SEM,'k');
plot(xtimes_behav,opening.eyelidOnset_eyelid_trials_AVG_AVG-opening.eyelidOnset_eyelid_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); hold on; plot(xtimes_Vm,opening.eyelidOnset_Vm_trials_AVG_AVG,'k');
plot(xtimes_Vm,opening.eyelidOnset_Vm_trials_AVG_AVG+opening.eyelidOnset_Vm_trials_AVG_SEM,'k');
plot(xtimes_Vm,opening.eyelidOnset_Vm_trials_AVG_AVG-opening.eyelidOnset_Vm_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

%closure
subplot(2,1,1); hold on; plot(xtimes_behav,closure.eyelidOnset_eyelid_trials_AVG_AVG,'r');
plot(xtimes_behav,closure.eyelidOnset_eyelid_trials_AVG_AVG+closure.eyelidOnset_eyelid_trials_AVG_SEM,'r');
plot(xtimes_behav,closure.eyelidOnset_eyelid_trials_AVG_AVG-closure.eyelidOnset_eyelid_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); hold on; plot(xtimes_Vm,closure.eyelidOnset_Vm_trials_AVG_AVG,'r');
plot(xtimes_Vm,closure.eyelidOnset_Vm_trials_AVG_AVG+closure.eyelidOnset_Vm_trials_AVG_SEM,'r');
plot(xtimes_Vm,closure.eyelidOnset_Vm_trials_AVG_AVG-closure.eyelidOnset_Vm_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])
title('eyelid onset')

figname = sprintf('EyelidAligned_SpontEM_dep.fig')
saveas(gcf,figname,'fig');
figname = sprintf('EyelidAligned_SpontEM_dep.pdf')
print('-dpdf','-vector','-loose',figname)

%% Figures Vm centered

%opening
figure; subplot(2,1,1); hold on; plot(xtimes_behav,opening.VmOnset_eyelid_trials_AVG_AVG,'k');
plot(xtimes_behav,opening.VmOnset_eyelid_trials_AVG_AVG+opening.VmOnset_eyelid_trials_AVG_SEM,'k');
plot(xtimes_behav,opening.VmOnset_eyelid_trials_AVG_AVG-opening.VmOnset_eyelid_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); hold on; plot(xtimes_Vm,opening.VmOnset_Vm_trials_AVG_AVG,'k');
plot(xtimes_Vm,opening.VmOnset_Vm_trials_AVG_AVG+opening.VmOnset_Vm_trials_AVG_SEM,'k');
plot(xtimes_Vm,opening.VmOnset_Vm_trials_AVG_AVG-opening.VmOnset_Vm_trials_AVG_SEM,'k');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

%closure
subplot(2,1,1); hold on; plot(xtimes_behav,closure.VmOnset_eyelid_trials_AVG_AVG,'r');
plot(xtimes_behav,closure.VmOnset_eyelid_trials_AVG_AVG+closure.VmOnset_eyelid_trials_AVG_SEM,'r');
plot(xtimes_behav,closure.VmOnset_eyelid_trials_AVG_AVG-closure.VmOnset_eyelid_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); hold on; plot(xtimes_Vm,closure.VmOnset_Vm_trials_AVG_AVG,'r');
plot(xtimes_Vm,closure.VmOnset_Vm_trials_AVG_AVG+closure.VmOnset_Vm_trials_AVG_SEM,'r');
plot(xtimes_Vm,closure.VmOnset_Vm_trials_AVG_AVG-closure.VmOnset_Vm_trials_AVG_SEM,'r');

line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])
title('Vm onset')

figname = sprintf('VmAligned_SpontEM_dep.fig')
saveas(gcf,figname,'fig');
figname = sprintf('VmAligned_SpontEM_dep.pdf')
print('-dpdf','-vector','-loose',figname)

