%% Generate PSTH plots
% (c) R. Broersen, Erasmus MC, 2023

% 20 ms bins
if nansum(signal.GoTr_IDstim==20 | signal.GoTr_IDstim==30)>0
    [Spks.stimuli.n_US_20ms] = histc(Spks.stimuli.USperiod_combined,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_US_20ms = (Spks.stimuli.n_US_20ms/(Spks.stimuli.N_paired_30+Spks.stimuli.N_USonly_20))/(2/Spks.stimuli.nBins_20ms);

    Spks.stimuli.SD_baseline_US = std(Spks.stimuli.n_US_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_US = mean(Spks.stimuli.n_US_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    H(20) = figure; figureFullScreen(H(20)); subplot(3,2,1)
    bar(Spks.stimuli.binEdges_20ms+(0.5*Spks.stimuli.binEdges_20ms(2)),Spks.stimuli.n_US_20ms,'k'); hold on;refline(0,(3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US);refline(0,(-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US);refline(0,Spks.stimuli.mean_baseline_US);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %         line([0.760 0.760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('US responses (20ms bins)');
    Spks.stimuli.peakfreq_US = max(Spks.stimuli.n_US_20ms(ceil(Spks.stimuli.nBins_20ms/2*0.75):ceil(Spks.stimuli.nBins_20ms/2*1.2)));
    Spks.stimuli.minfreq_US = min(Spks.stimuli.n_US_20ms(ceil(Spks.stimuli.nBins_20ms/2*0.75):ceil(Spks.stimuli.nBins_20ms/2*1.2)));
    if (Spks.stimuli.peakfreq_US > ((3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0 && (Spks.stimuli.minfreq_US < ((-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_20ms = 'US facilitation & suppression';
    elseif (Spks.stimuli.peakfreq_US > ((3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_20ms = 'US facilitation';
    elseif (Spks.stimuli.minfreq_US < ((-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_20ms = 'US suppresion';
    else
        Spks.stimuli.US_dec_20ms = 'No response';
    end

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_US,testTimeVector] = gauss_kde_20ms([Spks.ind_trial_spiketimes_20 Spks.ind_trial_spiketimes_30],[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_US,'r','LineWidth',1)

    axis tight; box off; ;xlim([0 2]);
    text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');ylim([0 text_Ylim(2)])
    text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.1*(text_Ylim(2)-text_Ylim(1))),Spks.stimuli.US_dec_20ms,'FontSize',12,'Color','r')

    % a = get(gca,'YTickLabel'); set(gca,'YTickLabel',a,'FontSize',12);

    %%10ms bins
    [Spks.stimuli.n_US_10ms] = histc(Spks.stimuli.USperiod_combined,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_US_10ms = (Spks.stimuli.n_US_10ms/(Spks.stimuli.N_paired_30+Spks.stimuli.N_USonly_20))/(2/Spks.stimuli.nBins_10ms);
    subplot(3,2,3)
    bar(Spks.stimuli.binEdges_10ms+(0.5*Spks.stimuli.binEdges_10ms(2)),Spks.stimuli.n_US_10ms,'k'); hold on;refline(0,(3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US);refline(0,(-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US);refline(0,Spks.stimuli.mean_baseline_US);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %         line([0.760 0.760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('US responses (10ms bins)');
    Spks.stimuli.peakfreq_US = max(Spks.stimuli.n_US_10ms(ceil(Spks.stimuli.nBins_10ms/2*0.75):ceil(Spks.stimuli.nBins_10ms/2*1.2)));
    Spks.stimuli.minfreq_US = min(Spks.stimuli.n_US_10ms(ceil(Spks.stimuli.nBins_10ms/2*0.75):ceil(Spks.stimuli.nBins_10ms/2*1.2)));
    if (Spks.stimuli.peakfreq_US > ((3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0 && (Spks.stimuli.minfreq_US < ((-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_10ms = 'US facilitation & suppression';
    elseif (Spks.stimuli.peakfreq_US > ((3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_10ms = 'US facilitation';
    elseif (Spks.stimuli.minfreq_US < ((-3*Spks.stimuli.SD_baseline_US)+Spks.stimuli.mean_baseline_US))>0
        Spks.stimuli.US_dec_10ms = 'US suppresion';
    else
        Spks.stimuli.US_dec_10ms = 'No response';
    end

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_US,testTimeVector] = gauss_kde_10ms([Spks.ind_trial_spiketimes_20 Spks.ind_trial_spiketimes_30],[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_US,'r','LineWidth',1)

    axis tight; box off; xlim([0 2]);
    text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');ylim([0 text_Ylim(2)])
    text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.1*(text_Ylim(2)-text_Ylim(1))),Spks.stimuli.US_dec_10ms,'FontSize',12,'Color','r')

    % a = get(gca,'YTickLabel'); set(gca,'YTickLabel',a,'FontSize',12);

    %Scatter US
    Spks.stimuli.C_US = unique(Spks.stimuli.USperiod_combined_idx);

    subplot(3,2,5); hold on
    for ii = 1:numel(Spks.stimuli.C_US)
        plot_index = Spks.stimuli.USperiod_combined(Spks.stimuli.USperiod_combined_idx==Spks.stimuli.C_US(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_US(ii))==30
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','b')
        elseif signal.GoTr_IDstim(Spks.stimuli.C_US(ii))==20
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end

    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_US)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'FontSize',12);
end
%% CS combined
if nansum(signal.GoTr_IDstim==10 | signal.GoTr_IDstim==30)>0
    % 20 ms bins
    [Spks.stimuli.n_CS_20ms] = histc(Spks.stimuli.CSperiod_combined,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_CS_20ms = (Spks.stimuli.n_CS_20ms/(Spks.stimuli.N_paired_30+Spks.stimuli.N_CSonly_10))/(2/Spks.stimuli.nBins_20ms);

    Spks.stimuli.SD_baseline_CS = std(Spks.stimuli.n_CS_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_CS = mean(Spks.stimuli.n_CS_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    figure(H(20))
    subplot(3,2,2); bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_CS_20ms,'k'); hold on;refline(0,(3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS);refline(0,(-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS);refline(0,Spks.stimuli.mean_baseline_CS);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %         line([0.760 0.760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('CS responses (20ms bins)');
    Spks.stimuli.peakfreq_CS = max(Spks.stimuli.n_CS_20ms(ceil(Spks.stimuli.nBins_20ms/2*0.5)+1:floor(Spks.stimuli.nBins_20ms/2*0.75)));
    Spks.stimuli.minfreq_CS = min(Spks.stimuli.n_CS_20ms(ceil(Spks.stimuli.nBins_20ms/2*0.5)+1:floor(Spks.stimuli.nBins_20ms/2*0.75)));
    if (Spks.stimuli.peakfreq_CS > ((3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0 && (Spks.stimuli.minfreq_CS < ((-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_20ms = 'CS facilitation & suppression';
    elseif (Spks.stimuli.peakfreq_CS > ((3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_20ms = 'CS facilitation';
    elseif (Spks.stimuli.minfreq_CS < ((-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_20ms = 'CS suppresion';
    else
        Spks.stimuli.CS_dec_20ms = 'No response';
    end

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_CS,testTimeVector] = gauss_kde_20ms([Spks.ind_trial_spiketimes_10 Spks.ind_trial_spiketimes_30],[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_CS,'r','LineWidth',1)

    axis tight; box off; xlim([0 2]);
    text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');ylim([0 text_Ylim(2)]);
    text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.1*(text_Ylim(2)-text_Ylim(1))),Spks.stimuli.CS_dec_20ms,'FontSize',12,'Color','r')

    % a = get(gca,'YTickLabel'); set(gca,'YTickLabel',a,'FontSize',12);

    %%10ms bins
    [Spks.stimuli.n_CS_10ms] = histc(Spks.stimuli.CSperiod_combined,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_CS_10ms = (Spks.stimuli.n_CS_10ms/(Spks.stimuli.N_paired_30+Spks.stimuli.N_CSonly_10))/(2/Spks.stimuli.nBins_10ms);
    subplot(3,2,4);
    bar(Spks.stimuli.binEdges_10ms+(0.5*Spks.stimuli.binEdges_10ms(2)),Spks.stimuli.n_CS_10ms,'k'); hold on;refline(0,(3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS);refline(0,(-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS);refline(0,Spks.stimuli.mean_baseline_CS);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %         line([0.760 0.760],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('CS responses (10ms bins)');

    Spks.stimuli.peakfreq_CS = max(Spks.stimuli.n_CS_10ms(ceil(Spks.stimuli.nBins_10ms/2*0.5)+1:floor(Spks.stimuli.nBins_10ms/2*0.75)));
    Spks.stimuli.minfreq_CS = min(Spks.stimuli.n_CS_10ms(ceil(Spks.stimuli.nBins_10ms/2*0.5)+1:floor(Spks.stimuli.nBins_10ms/2*0.75)));
    if (Spks.stimuli.peakfreq_CS > ((3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0 && (Spks.stimuli.minfreq_CS < ((-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_10ms = 'CS facilitation & suppression';
    elseif (Spks.stimuli.peakfreq_CS > ((3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_10ms = 'CS facilitation';
    elseif (Spks.stimuli.minfreq_CS < ((-3*Spks.stimuli.SD_baseline_CS)+Spks.stimuli.mean_baseline_CS))>0
        Spks.stimuli.CS_dec_10ms = 'CS suppresion';
    else
        Spks.stimuli.CS_dec_10ms = 'No response';
    end

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_CS,testTimeVector] = gauss_kde_10ms([Spks.ind_trial_spiketimes_10 Spks.ind_trial_spiketimes_30],[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_CS,'r','LineWidth',1)

    xlim([0 2]);text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
    text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.1*(text_Ylim(2)-text_Ylim(1))),Spks.stimuli.CS_dec_10ms,'FontSize',12,'Color','r')
    axis tight; box off; ylim([0 text_Ylim(2)]);xlim([0 2]);
    % a = get(gca,'YTickLabel'); set(gca,'YTickLabel',a,'FontSize',12);

    %Scatter CS
    Spks.stimuli.C_CS = unique(Spks.stimuli.CSperiod_combined_idx);

    subplot(3,2,6); hold on
    for ii = 1:numel(Spks.stimuli.C_CS)
        plot_index = Spks.stimuli.CSperiod_combined(Spks.stimuli.CSperiod_combined_idx==Spks.stimuli.C_CS(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_CS(ii))==30
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','b')
        elseif signal.GoTr_IDstim(Spks.stimuli.C_CS(ii))==10
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end

    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_CS)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k'); line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');

    % a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'FontSize',12);
end
%% calculate for every stimulus ID the histogram + KDE
% ID 10
H(21) = figure; figureFullScreen(H(21));

if length(Spks.ind_trial_spiketimes_10)>0
    [Spks.stimuli.n_10_20ms] = histc(Spks.stimuli.CSonly_10,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_10_20ms = (Spks.stimuli.n_10_20ms/(Spks.stimuli.N_CSonly_10))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_10_10ms] = histc(Spks.stimuli.CSonly_10,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_10_10ms = (Spks.stimuli.n_10_10ms/(Spks.stimuli.N_CSonly_10))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_10 = std(Spks.stimuli.n_10_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_10 = mean(Spks.stimuli.n_10_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,1);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_10_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_10)+Spks.stimuli.mean_baseline_10);refline(0,(-3*Spks.stimuli.SD_baseline_10)+Spks.stimuli.mean_baseline_10);refline(0,Spks.stimuli.mean_baseline_10);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlim([0 2]);
    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_10,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_10,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_10,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID10 responses (20ms bins)');


    subplot(6,3,4);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_10_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_10)+Spks.stimuli.mean_baseline_10);refline(0,(-3*Spks.stimuli.SD_baseline_10)+Spks.stimuli.mean_baseline_10);refline(0,Spks.stimuli.mean_baseline_10);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlim([0 2]);
    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_10,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_10,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_10,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID10 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_10 = unique(Spks.stimuli.CSonly_10_idx);
    subplot(6,3,7); hold on
    for ii = 1:numel(Spks.stimuli.C_10)
        plot_index = Spks.stimuli.CSonly_10(Spks.stimuli.CSonly_10_idx==Spks.stimuli.C_10(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_10(ii))==10
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_10)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 11

if length(Spks.ind_trial_spiketimes_11)>0
    [Spks.stimuli.n_11_20ms] = histc(Spks.stimuli.CSonly_11,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_11_20ms = (Spks.stimuli.n_11_20ms/(Spks.stimuli.N_CSonly_11))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_11_10ms] = histc(Spks.stimuli.CSonly_11,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_11_10ms = (Spks.stimuli.n_11_10ms/(Spks.stimuli.N_CSonly_11))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_11 = std(Spks.stimuli.n_11_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_11 = mean(Spks.stimuli.n_11_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,2);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_11_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_11)+Spks.stimuli.mean_baseline_11);refline(0,(-3*Spks.stimuli.SD_baseline_11)+Spks.stimuli.mean_baseline_11);refline(0,Spks.stimuli.mean_baseline_11);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_11,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_11,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_11,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID11 responses (20ms bins)');


    subplot(6,3,5);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_11_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_11)+Spks.stimuli.mean_baseline_11);refline(0,(-3*Spks.stimuli.SD_baseline_11)+Spks.stimuli.mean_baseline_11);refline(0,Spks.stimuli.mean_baseline_11);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_11,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_11,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_11,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID11 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_11 = unique(Spks.stimuli.CSonly_11_idx);
    subplot(6,3,8); hold on
    for ii = 1:numel(Spks.stimuli.C_11)
        plot_index = Spks.stimuli.CSonly_11(Spks.stimuli.CSonly_11_idx==Spks.stimuli.C_11(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_11(ii))==11
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_11)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end


%% ID 12

if length(Spks.ind_trial_spiketimes_12)>0
    [Spks.stimuli.n_12_20ms] = histc(Spks.stimuli.CSonly_12,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_12_20ms = (Spks.stimuli.n_12_20ms/(Spks.stimuli.N_CSonly_12))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_12_10ms] = histc(Spks.stimuli.CSonly_12,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_12_10ms = (Spks.stimuli.n_12_10ms/(Spks.stimuli.N_CSonly_12))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_12 = std(Spks.stimuli.n_12_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_12 = mean(Spks.stimuli.n_12_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,3);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_12_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_12)+Spks.stimuli.mean_baseline_12);refline(0,(-3*Spks.stimuli.SD_baseline_12)+Spks.stimuli.mean_baseline_12);refline(0,Spks.stimuli.mean_baseline_12);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_12,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_12,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_12,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID12 responses (20ms bins)');


    subplot(6,3,6);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_12_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_12)+Spks.stimuli.mean_baseline_12);refline(0,(-3*Spks.stimuli.SD_baseline_12)+Spks.stimuli.mean_baseline_12);refline(0,Spks.stimuli.mean_baseline_12);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_12,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_12,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_12,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID12 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_12 = unique(Spks.stimuli.CSonly_12_idx);
    subplot(6,3,9); hold on
    for ii = 1:numel(Spks.stimuli.C_12)
        plot_index = Spks.stimuli.CSonly_12(Spks.stimuli.CSonly_12_idx==Spks.stimuli.C_12(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_12(ii))==12
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_12)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 13

if length(Spks.ind_trial_spiketimes_13)>0
    [Spks.stimuli.n_13_20ms] = histc(Spks.stimuli.CSonly_13,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_13_20ms = (Spks.stimuli.n_13_20ms/(Spks.stimuli.N_CSonly_13))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_13_10ms] = histc(Spks.stimuli.CSonly_13,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_13_10ms = (Spks.stimuli.n_13_10ms/(Spks.stimuli.N_CSonly_13))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_13 = std(Spks.stimuli.n_13_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_13 = mean(Spks.stimuli.n_13_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,10);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_13_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_13)+Spks.stimuli.mean_baseline_13);refline(0,(-3*Spks.stimuli.SD_baseline_13)+Spks.stimuli.mean_baseline_13);refline(0,Spks.stimuli.mean_baseline_13);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_13,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_13,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_13,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID13 responses (20ms bins)');

    subplot(6,3,13);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_13_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_13)+Spks.stimuli.mean_baseline_13);refline(0,(-3*Spks.stimuli.SD_baseline_13)+Spks.stimuli.mean_baseline_13);refline(0,Spks.stimuli.mean_baseline_13);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_13,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_13,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_13,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID13 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_13 = unique(Spks.stimuli.CSonly_13_idx);
    subplot(6,3,16); hold on
    for ii = 1:numel(Spks.stimuli.C_13)
        plot_index = Spks.stimuli.CSonly_13(Spks.stimuli.CSonly_13_idx==Spks.stimuli.C_13(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_13(ii))==13
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_13)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 14

if length(Spks.ind_trial_spiketimes_14)>0
    [Spks.stimuli.n_14_20ms] = histc(Spks.stimuli.CSonly_14,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_14_20ms = (Spks.stimuli.n_14_20ms/(Spks.stimuli.N_CSonly_14))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_14_10ms] = histc(Spks.stimuli.CSonly_14,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_14_10ms = (Spks.stimuli.n_14_10ms/(Spks.stimuli.N_CSonly_14))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_14 = std(Spks.stimuli.n_14_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_14 = mean(Spks.stimuli.n_14_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,11);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_14_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_14)+Spks.stimuli.mean_baseline_14);refline(0,(-3*Spks.stimuli.SD_baseline_14)+Spks.stimuli.mean_baseline_14);refline(0,Spks.stimuli.mean_baseline_14);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_14,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_14,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_14,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID14 responses (20ms bins)');

    subplot(6,3,14);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_14_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_14)+Spks.stimuli.mean_baseline_14);refline(0,(-3*Spks.stimuli.SD_baseline_14)+Spks.stimuli.mean_baseline_14);refline(0,Spks.stimuli.mean_baseline_14);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_14,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_14,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_14,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID14 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_14 = unique(Spks.stimuli.CSonly_14_idx);
    subplot(6,3,17); hold on
    for ii = 1:numel(Spks.stimuli.C_14)
        plot_index = Spks.stimuli.CSonly_14(Spks.stimuli.CSonly_14_idx==Spks.stimuli.C_14(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_14(ii))==14
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_14)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 15

if length(Spks.ind_trial_spiketimes_15)>0
    [Spks.stimuli.n_15_20ms] = histc(Spks.stimuli.CSonly_15,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_15_20ms = (Spks.stimuli.n_15_20ms/(Spks.stimuli.N_CSonly_15))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_15_10ms] = histc(Spks.stimuli.CSonly_15,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_15_10ms = (Spks.stimuli.n_15_10ms/(Spks.stimuli.N_CSonly_15))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_15 = std(Spks.stimuli.n_15_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_15 = mean(Spks.stimuli.n_15_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,12);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_15_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_15)+Spks.stimuli.mean_baseline_15);refline(0,(-3*Spks.stimuli.SD_baseline_15)+Spks.stimuli.mean_baseline_15);refline(0,Spks.stimuli.mean_baseline_15);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_15,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_15,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_15,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID15 responses (20ms bins)');

    subplot(6,3,15);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_15_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_15)+Spks.stimuli.mean_baseline_15);refline(0,(-3*Spks.stimuli.SD_baseline_15)+Spks.stimuli.mean_baseline_15);refline(0,Spks.stimuli.mean_baseline_15);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_15,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_15,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_15,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID15 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_15 = unique(Spks.stimuli.CSonly_15_idx);
    subplot(6,3,18); hold on
    for ii = 1:numel(Spks.stimuli.C_15)
        plot_index = Spks.stimuli.CSonly_15(Spks.stimuli.CSonly_15_idx==Spks.stimuli.C_15(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_15(ii))==15
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','r')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_15)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end


%% ID 20
H(22) = figure; figureFullScreen(H(22));
if length(Spks.ind_trial_spiketimes_20)>0
    [Spks.stimuli.n_20_20ms] = histc(Spks.stimuli.USonly_20,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_20_20ms = (Spks.stimuli.n_20_20ms/(Spks.stimuli.N_USonly_20))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_20_10ms] = histc(Spks.stimuli.USonly_20,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_20_10ms = (Spks.stimuli.n_20_10ms/(Spks.stimuli.N_USonly_20))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_20 = std(Spks.stimuli.n_20_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_20 = mean(Spks.stimuli.n_20_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,1);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_20_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_20)+Spks.stimuli.mean_baseline_20);refline(0,(-3*Spks.stimuli.SD_baseline_20)+Spks.stimuli.mean_baseline_20);refline(0,Spks.stimuli.mean_baseline_20);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_20,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_20,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_20,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID20 responses (20ms bins)');

    subplot(6,3,4);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_20_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_20)+Spks.stimuli.mean_baseline_20);refline(0,(-3*Spks.stimuli.SD_baseline_20)+Spks.stimuli.mean_baseline_20);refline(0,Spks.stimuli.mean_baseline_20);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_20,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_20,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_20,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID20 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_20 = unique(Spks.stimuli.USonly_20_idx);
    subplot(6,3,7); hold on
    for ii = 1:numel(Spks.stimuli.C_20)
        plot_index = Spks.stimuli.USonly_20(Spks.stimuli.USonly_20_idx==Spks.stimuli.C_20(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_20(ii))==20
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_20)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 21
if length(Spks.ind_trial_spiketimes_21)>0
    [Spks.stimuli.n_21_20ms] = histc(Spks.stimuli.USonly_21,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_21_20ms = (Spks.stimuli.n_21_20ms/(Spks.stimuli.N_USonly_21))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_21_10ms] = histc(Spks.stimuli.USonly_21,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_21_10ms = (Spks.stimuli.n_21_10ms/(Spks.stimuli.N_USonly_21))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_21 = std(Spks.stimuli.n_21_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_21 = mean(Spks.stimuli.n_21_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,2);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_21_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_21)+Spks.stimuli.mean_baseline_21);refline(0,(-3*Spks.stimuli.SD_baseline_21)+Spks.stimuli.mean_baseline_21);refline(0,Spks.stimuli.mean_baseline_21);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_21,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_21,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_21,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID21 responses (20ms bins)');

    subplot(6,3,5);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_21_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_21)+Spks.stimuli.mean_baseline_21);refline(0,(-3*Spks.stimuli.SD_baseline_21)+Spks.stimuli.mean_baseline_21);refline(0,Spks.stimuli.mean_baseline_21);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_21,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_21,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_21,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID21 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_21 = unique(Spks.stimuli.USonly_21_idx);
    subplot(6,3,8); hold on
    for ii = 1:numel(Spks.stimuli.C_21)
        plot_index = Spks.stimuli.USonly_21(Spks.stimuli.USonly_21_idx==Spks.stimuli.C_21(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_21(ii))==21
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_21)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 22
if length(Spks.ind_trial_spiketimes_22)>0
    [Spks.stimuli.n_22_20ms] = histc(Spks.stimuli.USonly_22,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_22_20ms = (Spks.stimuli.n_22_20ms/(Spks.stimuli.N_USonly_22))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_22_10ms] = histc(Spks.stimuli.USonly_22,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_22_10ms = (Spks.stimuli.n_22_10ms/(Spks.stimuli.N_USonly_22))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_22 = std(Spks.stimuli.n_22_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_22 = mean(Spks.stimuli.n_22_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,3);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_22_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_22)+Spks.stimuli.mean_baseline_22);refline(0,(-3*Spks.stimuli.SD_baseline_22)+Spks.stimuli.mean_baseline_22);refline(0,Spks.stimuli.mean_baseline_22);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_22,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_22,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_22,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID22 responses (20ms bins)');

    subplot(6,3,6);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_22_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_22)+Spks.stimuli.mean_baseline_22);refline(0,(-3*Spks.stimuli.SD_baseline_22)+Spks.stimuli.mean_baseline_22);refline(0,Spks.stimuli.mean_baseline_22);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_22,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_22,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_22,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID22 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_22 = unique(Spks.stimuli.USonly_22_idx);
    subplot(6,3,9); hold on
    for ii = 1:numel(Spks.stimuli.C_22)
        plot_index = Spks.stimuli.USonly_22(Spks.stimuli.USonly_22_idx==Spks.stimuli.C_22(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_22(ii))==22
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_22)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 23
if length(Spks.ind_trial_spiketimes_23)>0
    [Spks.stimuli.n_23_20ms] = histc(Spks.stimuli.USonly_23,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_23_20ms = (Spks.stimuli.n_23_20ms/(Spks.stimuli.N_USonly_23))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_23_10ms] = histc(Spks.stimuli.USonly_23,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_23_10ms = (Spks.stimuli.n_23_10ms/(Spks.stimuli.N_USonly_23))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_23 = std(Spks.stimuli.n_23_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_23 = mean(Spks.stimuli.n_23_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,10);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_23_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_23)+Spks.stimuli.mean_baseline_23);refline(0,(-3*Spks.stimuli.SD_baseline_23)+Spks.stimuli.mean_baseline_23);refline(0,Spks.stimuli.mean_baseline_23);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_23,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_23,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_23,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID23 responses (20ms bins)');

    subplot(6,3,13);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_23_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_23)+Spks.stimuli.mean_baseline_23);refline(0,(-3*Spks.stimuli.SD_baseline_23)+Spks.stimuli.mean_baseline_23);refline(0,Spks.stimuli.mean_baseline_23);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_23,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_23,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_23,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID23 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_23 = unique(Spks.stimuli.USonly_23_idx);
    subplot(6,3,16); hold on
    for ii = 1:numel(Spks.stimuli.C_23)
        plot_index = Spks.stimuli.USonly_23(Spks.stimuli.USonly_23_idx==Spks.stimuli.C_23(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_23(ii))==23
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_23)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 24
if length(Spks.ind_trial_spiketimes_24)>0
    [Spks.stimuli.n_24_20ms] = histc(Spks.stimuli.USonly_24,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_24_20ms = (Spks.stimuli.n_24_20ms/(Spks.stimuli.N_USonly_24))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_24_10ms] = histc(Spks.stimuli.USonly_24,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_24_10ms = (Spks.stimuli.n_24_10ms/(Spks.stimuli.N_USonly_24))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_24 = std(Spks.stimuli.n_24_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_24 = mean(Spks.stimuli.n_24_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,11);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_24_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_24)+Spks.stimuli.mean_baseline_24);refline(0,(-3*Spks.stimuli.SD_baseline_24)+Spks.stimuli.mean_baseline_24);refline(0,Spks.stimuli.mean_baseline_24);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_24,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_24,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_24,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID24 responses (20ms bins)');

    subplot(6,3,14);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_24_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_24)+Spks.stimuli.mean_baseline_24);refline(0,(-3*Spks.stimuli.SD_baseline_24)+Spks.stimuli.mean_baseline_24);refline(0,Spks.stimuli.mean_baseline_24);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_24,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_24,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_24,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID24 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_24 = unique(Spks.stimuli.USonly_24_idx);
    subplot(6,3,17); hold on
    for ii = 1:numel(Spks.stimuli.C_24)
        plot_index = Spks.stimuli.USonly_24(Spks.stimuli.USonly_24_idx==Spks.stimuli.C_24(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_24(ii))==24
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_24)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 25
if length(Spks.ind_trial_spiketimes_25)>0
    [Spks.stimuli.n_25_20ms] = histc(Spks.stimuli.USonly_25,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_25_20ms = (Spks.stimuli.n_25_20ms/(Spks.stimuli.N_USonly_25))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_25_10ms] = histc(Spks.stimuli.USonly_25,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_25_10ms = (Spks.stimuli.n_25_10ms/(Spks.stimuli.N_USonly_25))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_25 = std(Spks.stimuli.n_25_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_25 = mean(Spks.stimuli.n_25_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,12);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_25_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_25)+Spks.stimuli.mean_baseline_25);refline(0,(-3*Spks.stimuli.SD_baseline_25)+Spks.stimuli.mean_baseline_25);refline(0,Spks.stimuli.mean_baseline_25);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_25,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_25,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_25,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID25 responses (20ms bins)');

    subplot(6,3,15);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_25_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_25)+Spks.stimuli.mean_baseline_25);refline(0,(-3*Spks.stimuli.SD_baseline_25)+Spks.stimuli.mean_baseline_25);refline(0,Spks.stimuli.mean_baseline_25);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_25,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_25,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_25,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID25 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_25 = unique(Spks.stimuli.USonly_25_idx);
    subplot(6,3,18); hold on
    for ii = 1:numel(Spks.stimuli.C_25)
        plot_index = Spks.stimuli.USonly_25(Spks.stimuli.USonly_25_idx==Spks.stimuli.C_25(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_25(ii))==25
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_25)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 30
H(23) = figure; figureFullScreen(H(23));
if length(Spks.ind_trial_spiketimes_30)>0
    [Spks.stimuli.n_30_20ms] = histc(Spks.stimuli.paired_30,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_30_20ms = (Spks.stimuli.n_30_20ms/(Spks.stimuli.N_paired_30))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_30_10ms] = histc(Spks.stimuli.paired_30,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_30_10ms = (Spks.stimuli.n_30_10ms/(Spks.stimuli.N_paired_30))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_30 = std(Spks.stimuli.n_30_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_30 = mean(Spks.stimuli.n_30_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,1);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_30_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_30)+Spks.stimuli.mean_baseline_30);refline(0,(-3*Spks.stimuli.SD_baseline_30)+Spks.stimuli.mean_baseline_30);refline(0,Spks.stimuli.mean_baseline_30);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_30,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_30,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_30,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID30 responses (20ms bins)');

    subplot(6,3,4);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_30_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_30)+Spks.stimuli.mean_baseline_30);refline(0,(-3*Spks.stimuli.SD_baseline_30)+Spks.stimuli.mean_baseline_30);refline(0,Spks.stimuli.mean_baseline_30);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_30,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_30,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_30,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID30 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_30 = unique(Spks.stimuli.paired_30_idx);
    subplot(6,3,7); hold on
    for ii = 1:numel(Spks.stimuli.C_30)
        plot_index = Spks.stimuli.paired_30(Spks.stimuli.paired_30_idx==Spks.stimuli.C_30(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_30(ii))==30
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_30)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 31
if length(Spks.ind_trial_spiketimes_31)>0
    [Spks.stimuli.n_31_20ms] = histc(Spks.stimuli.paired_31,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_31_20ms = (Spks.stimuli.n_31_20ms/(Spks.stimuli.N_paired_31))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_31_10ms] = histc(Spks.stimuli.paired_31,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_31_10ms = (Spks.stimuli.n_31_10ms/(Spks.stimuli.N_paired_31))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_31 = std(Spks.stimuli.n_31_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_31 = mean(Spks.stimuli.n_31_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,2);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_31_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_31)+Spks.stimuli.mean_baseline_31);refline(0,(-3*Spks.stimuli.SD_baseline_31)+Spks.stimuli.mean_baseline_31);refline(0,Spks.stimuli.mean_baseline_31);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_31,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_31,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_31,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID31 responses (20ms bins)');

    subplot(6,3,5);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_31_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_31)+Spks.stimuli.mean_baseline_31);refline(0,(-3*Spks.stimuli.SD_baseline_31)+Spks.stimuli.mean_baseline_31);refline(0,Spks.stimuli.mean_baseline_31);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_31,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_31,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_31,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID31 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_31 = unique(Spks.stimuli.paired_31_idx);
    subplot(6,3,8); hold on
    for ii = 1:numel(Spks.stimuli.C_31)
        plot_index = Spks.stimuli.paired_31(Spks.stimuli.paired_31_idx==Spks.stimuli.C_31(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_31(ii))==31
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_31)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 32
if length(Spks.ind_trial_spiketimes_32)>0
    [Spks.stimuli.n_32_20ms] = histc(Spks.stimuli.paired_32,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_32_20ms = (Spks.stimuli.n_32_20ms/(Spks.stimuli.N_paired_32))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_32_10ms] = histc(Spks.stimuli.paired_32,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_32_10ms = (Spks.stimuli.n_32_10ms/(Spks.stimuli.N_paired_32))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_32 = std(Spks.stimuli.n_32_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_32 = mean(Spks.stimuli.n_32_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,3);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_32_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_32)+Spks.stimuli.mean_baseline_32);refline(0,(-3*Spks.stimuli.SD_baseline_32)+Spks.stimuli.mean_baseline_32);refline(0,Spks.stimuli.mean_baseline_32);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_32,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_32,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_32,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID32 responses (20ms bins)');

    subplot(6,3,6);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_32_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_32)+Spks.stimuli.mean_baseline_32);refline(0,(-3*Spks.stimuli.SD_baseline_32)+Spks.stimuli.mean_baseline_32);refline(0,Spks.stimuli.mean_baseline_32);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_32,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_32,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_32,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID32 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_32 = unique(Spks.stimuli.paired_32_idx);
    subplot(6,3,9); hold on
    for ii = 1:numel(Spks.stimuli.C_32)
        plot_index = Spks.stimuli.paired_32(Spks.stimuli.paired_32_idx==Spks.stimuli.C_32(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_32(ii))==32
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_32)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 33
if length(Spks.ind_trial_spiketimes_33)>0
    [Spks.stimuli.n_33_20ms] = histc(Spks.stimuli.paired_33,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_33_20ms = (Spks.stimuli.n_33_20ms/(Spks.stimuli.N_paired_33))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_33_10ms] = histc(Spks.stimuli.paired_33,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_33_10ms = (Spks.stimuli.n_33_10ms/(Spks.stimuli.N_paired_33))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_33 = std(Spks.stimuli.n_33_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_33 = mean(Spks.stimuli.n_33_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,10);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_33_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_33)+Spks.stimuli.mean_baseline_33);refline(0,(-3*Spks.stimuli.SD_baseline_33)+Spks.stimuli.mean_baseline_33);refline(0,Spks.stimuli.mean_baseline_33);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_33,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_33,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_33,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID33 responses (20ms bins)');

    subplot(6,3,13);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_33_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_33)+Spks.stimuli.mean_baseline_33);refline(0,(-3*Spks.stimuli.SD_baseline_33)+Spks.stimuli.mean_baseline_33);refline(0,Spks.stimuli.mean_baseline_33);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_33,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_33,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_33,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID33 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_33 = unique(Spks.stimuli.paired_33_idx);
    subplot(6,3,16); hold on
    for ii = 1:numel(Spks.stimuli.C_33)
        plot_index = Spks.stimuli.paired_33(Spks.stimuli.paired_33_idx==Spks.stimuli.C_33(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_33(ii))==33
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_33)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 34
if length(Spks.ind_trial_spiketimes_34)>0
    [Spks.stimuli.n_34_20ms] = histc(Spks.stimuli.paired_34,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_34_20ms = (Spks.stimuli.n_34_20ms/(Spks.stimuli.N_paired_34))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_34_10ms] = histc(Spks.stimuli.paired_34,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_34_10ms = (Spks.stimuli.n_34_10ms/(Spks.stimuli.N_paired_34))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_34 = std(Spks.stimuli.n_34_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_34 = mean(Spks.stimuli.n_34_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,11);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_34_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_34)+Spks.stimuli.mean_baseline_34);refline(0,(-3*Spks.stimuli.SD_baseline_34)+Spks.stimuli.mean_baseline_34);refline(0,Spks.stimuli.mean_baseline_34);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_34,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_34,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_34,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID34 responses (20ms bins)');

    subplot(6,3,14);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_34_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_34)+Spks.stimuli.mean_baseline_34);refline(0,(-3*Spks.stimuli.SD_baseline_34)+Spks.stimuli.mean_baseline_34);refline(0,Spks.stimuli.mean_baseline_34);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_34,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_34,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_34,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID34 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_34 = unique(Spks.stimuli.paired_34_idx);
    subplot(6,3,17); hold on
    for ii = 1:numel(Spks.stimuli.C_34)
        plot_index = Spks.stimuli.paired_34(Spks.stimuli.paired_34_idx==Spks.stimuli.C_34(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_34(ii))==34
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_34)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 35
if length(Spks.ind_trial_spiketimes_35)>0
    [Spks.stimuli.n_35_20ms] = histc(Spks.stimuli.paired_35,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_35_20ms = (Spks.stimuli.n_35_20ms/(Spks.stimuli.N_paired_35))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_35_10ms] = histc(Spks.stimuli.paired_35,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_35_10ms = (Spks.stimuli.n_35_10ms/(Spks.stimuli.N_paired_35))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_35 = std(Spks.stimuli.n_35_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_35 = mean(Spks.stimuli.n_35_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,12);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_35_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_35)+Spks.stimuli.mean_baseline_35);refline(0,(-3*Spks.stimuli.SD_baseline_35)+Spks.stimuli.mean_baseline_35);refline(0,Spks.stimuli.mean_baseline_35);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_35,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_35,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_35,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID35 responses (20ms bins)');

    subplot(6,3,15);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_35_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_35)+Spks.stimuli.mean_baseline_35);refline(0,(-3*Spks.stimuli.SD_baseline_35)+Spks.stimuli.mean_baseline_35);refline(0,Spks.stimuli.mean_baseline_35);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_35,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_35,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_35,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID35 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_35 = unique(Spks.stimuli.paired_35_idx);
    subplot(6,3,18); hold on
    for ii = 1:numel(Spks.stimuli.C_35)
        plot_index = Spks.stimuli.paired_35(Spks.stimuli.paired_35_idx==Spks.stimuli.C_35(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_35(ii))==35
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_35)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 40
H(24) = figure; figureFullScreen(H(24));
if length(Spks.ind_trial_spiketimes_40)>0
    [Spks.stimuli.n_40_20ms] = histc(Spks.stimuli.OptoOnly_40,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_40_20ms = (Spks.stimuli.n_40_20ms/(Spks.stimuli.N_OptoOnly_40))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_40_10ms] = histc(Spks.stimuli.OptoOnly_40,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_40_10ms = (Spks.stimuli.n_40_10ms/(Spks.stimuli.N_OptoOnly_40))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_40 = std(Spks.stimuli.n_40_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_40 = mean(Spks.stimuli.n_40_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,1);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_40_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_40)+Spks.stimuli.mean_baseline_40);refline(0,(-3*Spks.stimuli.SD_baseline_40)+Spks.stimuli.mean_baseline_40);refline(0,Spks.stimuli.mean_baseline_40);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_40,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_40,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_40,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID40 responses (20ms bins)');

    subplot(6,3,4);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_40_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_40)+Spks.stimuli.mean_baseline_40);refline(0,(-3*Spks.stimuli.SD_baseline_40)+Spks.stimuli.mean_baseline_40);refline(0,Spks.stimuli.mean_baseline_40);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_40,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_40,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_40,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID40 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_40 = unique(Spks.stimuli.OptoOnly_40_idx);
    subplot(6,3,7); hold on
    for ii = 1:numel(Spks.stimuli.C_40)
        plot_index = Spks.stimuli.OptoOnly_40(Spks.stimuli.OptoOnly_40_idx==Spks.stimuli.C_40(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_40(ii))==40
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_40)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 41
if length(Spks.ind_trial_spiketimes_41)>0
    [Spks.stimuli.n_41_20ms] = histc(Spks.stimuli.OptoOnly_41,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_41_20ms = (Spks.stimuli.n_41_20ms/(Spks.stimuli.N_OptoOnly_41))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_41_10ms] = histc(Spks.stimuli.OptoOnly_41,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_41_10ms = (Spks.stimuli.n_41_10ms/(Spks.stimuli.N_OptoOnly_41))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_41 = std(Spks.stimuli.n_41_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_41 = mean(Spks.stimuli.n_41_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,2);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_41_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_41)+Spks.stimuli.mean_baseline_41);refline(0,(-3*Spks.stimuli.SD_baseline_41)+Spks.stimuli.mean_baseline_41);refline(0,Spks.stimuli.mean_baseline_41);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_41,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_41,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_41,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID41 responses (20ms bins)');

    subplot(6,3,5);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_41_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_41)+Spks.stimuli.mean_baseline_41);refline(0,(-3*Spks.stimuli.SD_baseline_41)+Spks.stimuli.mean_baseline_41);refline(0,Spks.stimuli.mean_baseline_41);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_41,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_41,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_41,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID41 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_41 = unique(Spks.stimuli.OptoOnly_41_idx);
    subplot(6,3,8); hold on
    for ii = 1:numel(Spks.stimuli.C_41)
        plot_index = Spks.stimuli.OptoOnly_41(Spks.stimuli.OptoOnly_41_idx==Spks.stimuli.C_41(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_41(ii))==41
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_41)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 42
if length(Spks.ind_trial_spiketimes_42)>0
    [Spks.stimuli.n_42_20ms] = histc(Spks.stimuli.OptoOnly_42,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_42_20ms = (Spks.stimuli.n_42_20ms/(Spks.stimuli.N_OptoOnly_42))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_42_10ms] = histc(Spks.stimuli.OptoOnly_42,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_42_10ms = (Spks.stimuli.n_42_10ms/(Spks.stimuli.N_OptoOnly_42))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_42 = std(Spks.stimuli.n_42_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_42 = mean(Spks.stimuli.n_42_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,3);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_42_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_42)+Spks.stimuli.mean_baseline_42);refline(0,(-3*Spks.stimuli.SD_baseline_42)+Spks.stimuli.mean_baseline_42);refline(0,Spks.stimuli.mean_baseline_42);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_42,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_42,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_42,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID42 responses (20ms bins)');

    subplot(6,3,6);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_42_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_42)+Spks.stimuli.mean_baseline_42);refline(0,(-3*Spks.stimuli.SD_baseline_42)+Spks.stimuli.mean_baseline_42);refline(0,Spks.stimuli.mean_baseline_42);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_42,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_42,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_42,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID42 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_42 = unique(Spks.stimuli.OptoOnly_42_idx);
    subplot(6,3,9); hold on
    for ii = 1:numel(Spks.stimuli.C_42)
        plot_index = Spks.stimuli.OptoOnly_42(Spks.stimuli.OptoOnly_42_idx==Spks.stimuli.C_42(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_42(ii))==42
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_42)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 43
if length(Spks.ind_trial_spiketimes_43)>0
    [Spks.stimuli.n_43_20ms] = histc(Spks.stimuli.OptoOnly_43,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_43_20ms = (Spks.stimuli.n_43_20ms/(Spks.stimuli.N_OptoOnly_43))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_43_10ms] = histc(Spks.stimuli.OptoOnly_43,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_43_10ms = (Spks.stimuli.n_43_10ms/(Spks.stimuli.N_OptoOnly_43))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_43 = std(Spks.stimuli.n_43_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_43 = mean(Spks.stimuli.n_43_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,10);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_43_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_43)+Spks.stimuli.mean_baseline_43);refline(0,(-3*Spks.stimuli.SD_baseline_43)+Spks.stimuli.mean_baseline_43);refline(0,Spks.stimuli.mean_baseline_43);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_43,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_43,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_43,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID43 responses (20ms bins)');

    subplot(6,3,13);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_43_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_43)+Spks.stimuli.mean_baseline_43);refline(0,(-3*Spks.stimuli.SD_baseline_43)+Spks.stimuli.mean_baseline_43);refline(0,Spks.stimuli.mean_baseline_43);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_43,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_43,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_43,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID43 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_43 = unique(Spks.stimuli.OptoOnly_43_idx);
    subplot(6,3,16); hold on
    for ii = 1:numel(Spks.stimuli.C_43)
        plot_index = Spks.stimuli.OptoOnly_43(Spks.stimuli.OptoOnly_43_idx==Spks.stimuli.C_43(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_43(ii))==43
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_43)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 44
if length(Spks.ind_trial_spiketimes_44)>0
    [Spks.stimuli.n_44_20ms] = histc(Spks.stimuli.OptoOnly_44,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_44_20ms = (Spks.stimuli.n_44_20ms/(Spks.stimuli.N_OptoOnly_44))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_44_10ms] = histc(Spks.stimuli.OptoOnly_44,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_44_10ms = (Spks.stimuli.n_44_10ms/(Spks.stimuli.N_OptoOnly_44))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_44 = std(Spks.stimuli.n_44_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_44 = mean(Spks.stimuli.n_44_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,11);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_44_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_44)+Spks.stimuli.mean_baseline_44);refline(0,(-3*Spks.stimuli.SD_baseline_44)+Spks.stimuli.mean_baseline_44);refline(0,Spks.stimuli.mean_baseline_44);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_44,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_44,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_44,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID44 responses (20ms bins)');

    subplot(6,3,14);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_44_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_44)+Spks.stimuli.mean_baseline_44);refline(0,(-3*Spks.stimuli.SD_baseline_44)+Spks.stimuli.mean_baseline_44);refline(0,Spks.stimuli.mean_baseline_44);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_44,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_44,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_44,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID44 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_44 = unique(Spks.stimuli.OptoOnly_44_idx);
    subplot(6,3,17); hold on
    for ii = 1:numel(Spks.stimuli.C_44)
        plot_index = Spks.stimuli.OptoOnly_44(Spks.stimuli.OptoOnly_44_idx==Spks.stimuli.C_44(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_44(ii))==44
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_44)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end

%% ID 45
if length(Spks.ind_trial_spiketimes_45)>0
    [Spks.stimuli.n_45_20ms] = histc(Spks.stimuli.OptoOnly_45,Spks.stimuli.binEdges_20ms);
    Spks.stimuli.n_45_20ms = (Spks.stimuli.n_45_20ms/(Spks.stimuli.N_OptoOnly_45))/(2/Spks.stimuli.nBins_20ms);
    [Spks.stimuli.n_45_10ms] = histc(Spks.stimuli.OptoOnly_45,Spks.stimuli.binEdges_10ms);
    Spks.stimuli.n_45_10ms = (Spks.stimuli.n_45_10ms/(Spks.stimuli.N_OptoOnly_45))/(2/Spks.stimuli.nBins_10ms);

    % Baseline activity and SD based on 20ms bins histogram
    Spks.stimuli.SD_baseline_45 = std(Spks.stimuli.n_45_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));
    Spks.stimuli.mean_baseline_45 = mean(Spks.stimuli.n_45_20ms(1:floor(Spks.stimuli.nBins_20ms/2*0.5)));

    subplot(6,3,12);
    bar(Spks.stimuli.binEdges_20ms+(Spks.stimuli.binEdges_20ms(1)),Spks.stimuli.n_45_20ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_45)+Spks.stimuli.mean_baseline_45);refline(0,(-3*Spks.stimuli.SD_baseline_45)+Spks.stimuli.mean_baseline_45);refline(0,Spks.stimuli.mean_baseline_45);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 20ms binwidth gauss
    [Spks.kde_20ms_45,testTimeVector] = gauss_kde_20ms(Spks.ind_trial_spiketimes_45,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_20ms_45,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID45 responses (20ms bins)');

    subplot(6,3,15);
    bar(Spks.stimuli.binEdges_10ms+(Spks.stimuli.binEdges_10ms(1)),Spks.stimuli.n_45_10ms,'k');
    hold on;refline(0,(3*Spks.stimuli.SD_baseline_45)+Spks.stimuli.mean_baseline_45);refline(0,(-3*Spks.stimuli.SD_baseline_45)+Spks.stimuli.mean_baseline_45);refline(0,Spks.stimuli.mean_baseline_45);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    % Calculate and plot kernel density estimator - 10ms binwidth gauss
    [Spks.kde_10ms_45,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_45,[0 2]);
    hold on; plot(testTimeVector,Spks.kde_10ms_45,'r','LineWidth',1)
    axis tight; box off;text_Ylim = get(gca,'Ylim'); ylim([0 text_Ylim(2)]);xlim([0 2]);
    ylabel('FF (Hz)'); xlabel('Time (s)'); title('ID45 responses (10ms bins)');

    % scatterplot
    Spks.stimuli.C_45 = unique(Spks.stimuli.OptoOnly_45_idx);
    subplot(6,3,18); hold on
    for ii = 1:numel(Spks.stimuli.C_45)
        plot_index = Spks.stimuli.OptoOnly_45(Spks.stimuli.OptoOnly_45_idx==Spks.stimuli.C_45(ii));
        if signal.GoTr_IDstim(Spks.stimuli.C_45(ii))==45
            h = raster(plot_index,repmat(ii,1,length(plot_index)));
            set(h,'Color','k')
        end
    end
    ylabel('Trial'); xlabel('Time (s)');xlim([0 2]);
    axis on
    ylim([0 numel(Spks.stimuli.C_45)]);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    line([0.750 0.750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
end
