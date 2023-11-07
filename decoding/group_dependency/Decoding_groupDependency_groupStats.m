%% Calculate statistics based on decoding output from different neuron group sizes
% Output contains 30 iterations, but only 29 were used for final data
% analysis.

% R. Broersen, Erasmus MC, 2023.


% Preallocate the variables
decod_accuracy_avgs=[];
max_accuracy_avgs = [];
clustsig_max_avgs=[];
clustsig_median_avgs=[];
clustsig_mean_avgs=[];
clustsig_signtime_avgs=[];

% Calculate the averages for each group (per 29 iterations)
idx = [];
for ii=1:15
    idx(:,ii) = perm.clustsig_signtime((ii*30)-29:(ii*30)-1,:);

    decod_accuracy_avgs(ii,:) = nanmedian(perm.dec_accuracy((ii*30)-29:(ii*30)-1,:));
    decod_accuracy_sem(ii,:) = nanstd(perm.dec_accuracy((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.dec_accuracy((ii*30)-29:(ii*30)-1,:),1));

    max_accuracy_avgs(ii,:) = nanmedian(perm.max_accuracy((ii*30)-29:(ii*30)-1,:));
    max_accuracy_sem(ii,:) = nanstd(perm.max_accuracy((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.max_accuracy((ii*30)-29:(ii*30)-1,:),1));

    clustsig_max_avgs(ii,:)=nanmedian(perm.clustsig_max((ii*30)-29:(ii*30)-1,:));
    clustsig_max_sem(ii,:) = nanstd(perm.clustsig_max((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.clustsig_max((ii*30)-29:(ii*30)-1,:),1));


    clustsig_median_avgs(ii,:)=nanmedian(perm.clustsig_mdn((ii*30)-29:(ii*30)-1,:));
    clustsig_median_sem(ii,:) = nanstd(perm.clustsig_mdn((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.clustsig_mdn((ii*30)-29:(ii*30)-1,:),1));


    clustsig_mean_avgs(ii,:)=nanmedian(perm.clustsig_mean((ii*30)-29:(ii*30)-1,:));
    clustsig_mean_sem(ii,:) = nanstd(perm.clustsig_mean((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.clustsig_mean((ii*30)-29:(ii*30)-1,:),1));

    clustsig_signtime_avgs(ii,:)=nanmedian(perm.clustsig_signtime((ii*30)-29:(ii*30)-1,:));
    clustsig_signtime_sem(ii,:) = nanstd(perm.clustsig_signtime((ii*30)-29:(ii*30)-1,:))/sqrt(size(perm.clustsig_signtime((ii*30)-29:(ii*30)-1,:),1));
end


save('Allneurons_avgs_naive.mat')

%%
% decod_accuracy_avgs=[];
max_accuracy_ind = [];
% clustsign_max_avgs=[];
% clustsig_median_avgs=[];
% clustsig_mean_avgs=[];
% clustsig_signtime_avgs=[];
% counter = 0;

for ii=1:450
    max_accuracy_ind(ii,1) = nanmax(perm.dec_accuracy(ii,0.6*10^5:0.75*10^5));
end

decod_accuracy_avgs=[];
decod_accuracy_sem = [];

for ii=1:15
    decod_accuracy_avgs(ii,:) = nanmean(max_accuracy_ind((ii*30)-29:(ii*30)-1,:));
    decod_accuracy_sem(ii,:) = nanstd(max_accuracy_ind((ii*30)-29:(ii*30)-1,:))/sqrt(size(max_accuracy_ind((ii*30)-29:(ii*30)-1,:),1));
end

%% Generate figures showing decoding over time for the different sizes of neurons
%cond
figure; hold on;
for ii=1:13
    plot(decod_accuracy_avgs(ii,:),'Color',[0 (0+(0.9/13)*ii) (0+(0.9/13)*ii)]);

    % pause;
end
legend('15','14','13','12','11','10','9','8','7','6','5','4','3')
line([0.5*10^5 0.5*10^5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.75*10^5 0.75*10^5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
xlim([0.35*10^5 0.75*10^5])
title('cond')

ylim([40 75])
cd('[path]')

figname = sprintf('Cond_groupdependency.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Cond_groupdependency.pdf');
print('-dpdf','-painters','-loose',figname);


%naive
figure; hold on;
for ii=1:13
    plot(decod_accuracy_avgs(ii,:),'Color',[(0+(0.9/13)*ii) 0 0]);

    % pause;
end
legend('15','14','13','12','11','10','9','8','7','6','5','4','3')
line([0.5*10^5 0.5*10^5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.75*10^5 0.75*10^5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
xlim([0.35*10^5 0.75*10^5])
title('naive')

ylim([40 75])
cd('[path]')

figname = sprintf('Naive_groupdependency.fig')
saveas(gcf,figname,'fig');
figname = sprintf('Naive_groupdependency.pdf');
print('-dpdf','-painters','-loose',figname);
