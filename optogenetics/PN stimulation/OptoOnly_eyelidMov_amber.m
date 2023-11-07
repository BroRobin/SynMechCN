%% Analyze eyelid movements evoked by Amber light opto stimulation
% Requires output files from the behavioral analysis.
% (c) R. Broersen, Erasmus MC, 2023

% Predefine the parameters
clear; close all
outputvars=[];
opto=[];
opto.D0_traces=[];
opto.D5_traces=[];
opto.D10_traces=[];

% Load the data files (preanalysed with behavioral analysis)
for kk=1:22
    %% D0
    if kk==1
        cd('[path]')
        load('DataOutput_1709181_Block-3.mat')
        savename = 'Analysis_1709181_Block-3.mat'
    elseif kk==2
        cd('[path]')
        load('DataOutput_1709182_Block-2.mat')
        savename = 'Analysis_1709182_Block-2.mat'
    elseif kk==3
        cd('[path]')
        load('DataOutput_1709184_Block-2.mat')
        savename = 'Analysis_1709184_Block-2.mat'
    elseif kk==4
        cd('[path]')
        load('DataOutput_2109182_Block-1.mat')
        savename = 'Analysis_2109182_Block-1.mat'
    elseif kk==5
        cd('[path]')
        load('DataOutput_2109185_Block-1.mat')
        savename = 'Analysis_2109185_Block-1.mat'
        %% D5
    elseif kk==6
        cd('[path]')
        load('DataOutput_1709181_Block-12.mat')
        savename = 'Analysis_1709181_Block-12.mat'
    elseif kk==7
        cd('[path]')
        load('DataOutput_1709182_Block-9.mat')
        savename = 'Analysis_1709182_Block-9.mat'
    elseif kk==8
        cd('[path]')
        load('DataOutput_1709184_Block-5.mat')
        savename = 'Analysis_1709184_Block-5.mat'
    elseif kk==9
        cd('[path]')
        load('DataOutput_2109182_Block-9.mat')
        savename = 'Analysis_2109182_Block-9.mat'
    elseif kk==10
        cd('[path]')
        load('DataOutput_2609181_Block-3.mat')
        savename = 'Analysis_2609181_Block-3.mat'
    elseif kk==11
        cd('[path]')
        load('DataOutput_2609182_Block-3.mat')
        savename = 'Analysis_2609182_Block-3.mat'
    elseif kk==12
        cd('[path]')
        load('DataOutput_2609183_Block-4.mat')
        savename = 'Analysis_2609183_Block-4.mat'
    elseif kk==13
        cd('[path]')
        load('DataOutput_2609184_Block-3.mat')
        savename = 'Analysis_2609184_Block-3.mat'
        %% D10
    elseif kk==14
        cd('[path]')
        load('DataOutput_1709181_Block-13.mat')
        savename = 'Analysis_1709181_Block-13.mat'
    elseif kk==15
        cd('[path]')
        load('DataOutput_1709182_Block-10.mat')
        savename = 'Analysis_1709182_Block-10.mat'
    elseif kk==16
        cd('[path]')
        load('DataOutput_1709184_Block-9.mat')
        savename = 'Analysis_1709184_Block-9.mat'
    elseif kk==17
        cd('[path]')
        load('DataOutput_2109182_Block-14.mat')
        savename = 'Analysis_2109182_Block-14.mat'
    elseif kk==18
        cd('[path]')
        load('DataOutput_2109185_Block-5.mat')
        savename = 'Analysis_2109185_Block-5.mat'
    elseif kk==19
        cd('[path]')
        load('DataOutput_2609181_Block-5.mat')
        savename = 'Analysis_2609181_Block-5.mat'
    elseif kk==20
        cd('[path]')
        load('DataOutput_2609182_Block-5.mat')
        savename = 'Analysis_2609182_Block-5.mat'
    elseif kk==21
        cd('[path]')
        load('DataOutput_2609183_Block-11.mat')
        savename = 'Analysis_2609183_Block-11.mat'
    elseif kk==22
        cd('[path]')
        load('DataOutput_2609184_Block-5.mat')
        savename = 'Analysis_2609184_Block-5.mat'
    end

    %% Process the data
    for ii=1:size(signal.outlierfree_optoOnly,1) %normalize opto only to 250ms before the baseline value (250-500ms after start trial)
        opto.outlierfree_optoOnly_norm(ii,:) = signal.outlierfree_optoOnly(ii,:)-nanmean(signal.outlierfree_optoOnly(ii,round(0.25*P.fs_mdmt):round(0.5*P.fs_mdmt)));

        % exclude traces where baseline > 5*SD of baseline
        if sum(opto.outlierfree_optoOnly_norm(ii,1:round(0.5*P.fs_mdmt))>(5*nanstd(opto.outlierfree_optoOnly_norm(ii,round(0.25*P.fs_mdmt):round(0.5*P.fs_mdmt)))))>0
            opto.outlierfree_optoOnly_norm(ii,:) =NaN;
        end
        % exclude traces where baseline < -5*SD of baseline
        if sum(opto.outlierfree_optoOnly_norm(ii,1:round(0.5*P.fs_mdmt))<(-5*nanstd(opto.outlierfree_optoOnly_norm(ii,round(0.25*P.fs_mdmt):round(0.5*P.fs_mdmt)))))>0
            opto.outlierfree_optoOnly_norm(ii,:) =NaN;
        end
    end

    %% Plot all traces
    figure; hold on;
    for ii=1:size(opto.outlierfree_optoOnly_norm,1)
        plot(opto.outlierfree_optoOnly_norm(ii,:))
    end

    %% Calculate amplitudes / peaktime / AUC during the first 150 ms after opto
    opto.amp = [];
    opto.peaktime =[];
    opto.AUC=[];

    ampidx=[];
    amptime = [];
    AUCidx=[];
    for ii=1:size(opto.outlierfree_optoOnly_norm,1)
        if isnan(opto.outlierfree_optoOnly_norm(ii,1))==0
            [ampidx(1) amptime(1)]=max(opto.outlierfree_optoOnly_norm(ii,round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)));
            [ampidx(2) amptime(2)]=min(opto.outlierfree_optoOnly_norm(ii,round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)));
            opto.AUC(ii)=nansum(abs(opto.outlierfree_optoOnly_norm(ii,round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)))); % Absolute AUC calculation
            if abs(ampidx(1))>abs(ampidx(2)) % Select whether the min or the max amp is larger, take that one
                opto.amp(ii)=ampidx(1);
                opto.peaktime(ii) = amptime(1);
            elseif abs(ampidx(2))>abs(ampidx(1))
                opto.amp(ii)=ampidx(2);
                opto.peaktime(ii) = amptime(2);
            end
        else
            opto.amp(ii)=NaN;
            opto.peaktime(ii) = NaN;
            opto.AUC(ii) = NaN;
        end
    end

    %% calculate averages
    opto.avg_amp = nanmean(opto.amp);
    opto.std_amp = nanstd(opto.amp);
    opto.mdn_amp = nanmedian(opto.amp);
    opto.avg_peaktime= (round(nanmean(opto.peaktime))/P.fs_mdmt);
    opto.mdn_peaktime = (round(nanmedian(opto.peaktime))/P.fs_mdmt);
    opto.std_peaktime = nanstd(opto.peaktime);
    opto.avg_AUC = nanmean(opto.AUC);
    opto.mdn_AUC = nanmedian(opto.AUC);
    opto.std_AUC = nanstd(opto.AUC);

    %% Gather group averages
    opto.outlierfree_optoOnly_norm_avg = nanmean(opto.outlierfree_optoOnly_norm,1);
    % opto.avg_amp(1) = max(opto.outlierfree_optoOnly_norm_avg(round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)));
    % opto.avg_amp(2) = min(opto.outlierfree_optoOnly_norm_avg(round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)));
    % if abs(opto.avg_amp(1))>abs(opto.avg_amp(2))
    %     opto.avg_amp = opto.avg_amp(1);
    % elseif abs(opto.avg_amp(1))<abs(opto.avg_amp(2))
    % opto.avg_amp = opto.avg_amp(2);
    % end

    % opto.AUC = nansum((opto.outlierfree_optoOnly_norm_avg(round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)))); % Absolute AUC calculation
    % opto.AUC = nansum(abs(opto.outlierfree_optoOnly_norm_avg(round(0.5*P.fs_mdmt):round(0.65*P.fs_mdmt)))); % Absolute AUC calculation


    opto.outlierfree_optoOnly_norm_std = nanstd(opto.outlierfree_optoOnly_norm,1);
    opto.outlierfree_optoOnly_norm_sem = opto.outlierfree_optoOnly_norm_std/sqrt(sum(isnan(opto.outlierfree_optoOnly_norm(:,1))==0));
    xvalues = linspace(-0.5,1.5,4884);
    figure; hold on; shadedErrorBar(xvalues,opto.outlierfree_optoOnly_norm_avg,opto.outlierfree_optoOnly_norm_sem)

    outputvars = [outputvars;opto.avg_amp opto.mdn_amp opto.std_amp opto.avg_peaktime opto.std_peaktime opto.avg_AUC opto.std_AUC];

    save(savename);
    % pause;
    if kk<6
        opto.D0_traces= [opto.D0_traces; opto.outlierfree_optoOnly_norm_avg];
    elseif kk>5 && kk<14
        opto.D5_traces = [opto.D5_traces; opto.outlierfree_optoOnly_norm_avg];
    elseif kk>13
        opto.D10_traces = [opto.D10_traces; opto.outlierfree_optoOnly_norm_avg];
    end

end

%% Analyze group data for the different time points
opto.D0_traces_avg = nanmean(opto.D0_traces,1);
opto.D5_traces_avg = nanmean(opto.D5_traces,1);
opto.D10_traces_avg = nanmean(opto.D10_traces,1);

opto.D0_traces_sem = nanstd(opto.D0_traces,1)/sqrt(5);
opto.D5_traces_sem = nanstd(opto.D5_traces,1)/sqrt(8);
opto.D10_traces_sem = nanstd(opto.D10_traces,1)/sqrt(9);

%% Create figures
xvalues = linspace(-200,500,1710);
figure; hold on;
plot(xvalues,opto.D0_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'k','LineWidth',1)
plot(xvalues,opto.D0_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))+opto.D0_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'k','LineWidth',1)
plot(xvalues,opto.D0_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))-opto.D0_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'k','LineWidth',1)

plot(xvalues,opto.D5_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'m','LineWidth',1)
plot(xvalues,opto.D5_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))+opto.D5_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'m','LineWidth',1)
plot(xvalues,opto.D5_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))-opto.D5_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'m','LineWidth',1)

plot(xvalues,opto.D10_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'c','LineWidth',1)
plot(xvalues,opto.D10_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))+opto.D10_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'c','LineWidth',1)
plot(xvalues,opto.D10_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt))-opto.D10_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'c','LineWidth',1)

xlim([-50 200]);
xticks([-50 0 50 100 150 200])
ylim([-2 3])
% figure; hold on;
% shadedErrorBar(xvalues,opto.D10_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),opto.D10_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'c')
% shadedErrorBar(xvalues,opto.D5_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),opto.D5_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'m')
% shadedErrorBar(xvalues,opto.D0_traces_avg(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),opto.D0_traces_sem(round(0.3*P.fs_mdmt):round(1*P.fs_mdmt)),'k')
% xlim([-0.2 0.5]);


%%%%% modify to fit figures
% ylim([-2 6]);
% xlim([-0.2 0.5]);
% yticks([-2 -1 0 1 2 3 4 5 6]); % MODIFY TO FIT FIGURES
% xticks([-0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5])
% ylabel('FEC (%UR)');
% xlabel('Time (s)')

set(gca,'fontSize',20,'FontName','Arial');
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);
% line([0.26 0.26],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);
box off
legend('D0','D5','D10')
% yyaxis right
% yticklabels([0 100 200 300 400]); ylabel('Spike rate (Hz)','fontSize',35,'fontName','Arial','Color','k');set(gca,'fontSize',35,'FontName','Arial','YColor','k')

%% Save figures
cd('[path]')
figname = 'Opto_Amber_averages.fig';
saveas(gcf,figname,'fig');
figname = 'Opto_Amber_averages.pdf';
print('-dpdf','-painters','-loose',figname);
