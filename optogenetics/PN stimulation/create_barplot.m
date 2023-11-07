%% Generate barplots of spike activity during optogenetic stimulation of the pontine nuclei
% Requires previously analyzed spike times and data. Trial ID 44 represents
% opto-only trials.
% (c) R. Broersen, Erasmus MC, 2023

%% Responses to Blue light

figure; hold on;
for ii=1:size(AllCells.hist_44_10ms_norm,1)
    AllCells.hist_44_10ms_norm(ii,:) = AllCells.hist_44_10ms(ii,:)-nanmean(AllCells.hist_44_10ms(ii,1:49));
end
bar(nanmean(AllCells.hist_44_10ms_norm),'b')

line([50 50],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
line([76 76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

ylim([-20 40]); ylabel('Normalized spikerate (Hz)')

% Save the data
cd('[path]')
figname = sprintf('barplot_spikerate_bluefacilitation.fig')
saveas(gcf,figname,'fig');
figname = sprintf('barplot_spikerate_bluefacilitation.pdf');
print('-dpdf','-painters','-loose',figname);

%% Responses to Amber light
figure; hold on;
for ii=1:size(AllCells.hist_44_10ms_norm,1)
    AllCells.hist_44_10ms_norm(ii,:) = AllCells.hist_44_10ms(ii,:)-nanmean(AllCells.hist_44_10ms(ii,1:49));
end
bar(nanmean(AllCells.hist_44_10ms_norm),'r')

line([50 50],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
line([76 76],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

ylim([-60 100]); ylabel('Normalized spikerate (Hz)')

% Save the data
cd('[path]')
figname = sprintf('barplot_spikerate_bluesuppression.fig')
saveas(gcf,figname,'fig');
figname = sprintf('barplot_spikerate_bluesuppression.pdf');
print('-dpdf','-painters','-loose',figname);
