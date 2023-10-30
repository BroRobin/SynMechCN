%% Determine the onsets of Vm responses following the CS and the US
% Plot the individual trials with GUI controls to indicate the onset
% of Vm responses, caused by the CS or the US. Plot the onset timings over
% the course of the recordings. Generate and save figures.
% (c) R. Broersen, Erasmus MC, 2023

cd(Param.path_ephys)
mkdir('Onset_analysis_PSP')
cd([Param.path_ephys '\Onset_analysis_PSP'])

PSP_onset.onset_EPSP_CSperiod = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
H(1)=figure; figureFullScreen(H(1));
if Param.cell_resp == 1 %% For CS/US activated responses
    for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
        if Eyeblink_signal.GoTr_IDstim(ii)==1&&Eyeblink_signal.outlierindx_CSonly(ii)==1
            ii
            index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
            index = movmedian(index,0.01*Spkdata.fs);
            plot(index,'r'); hold on;
            ylim([-10 10])
            line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
            refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

            title('Select 2 timepoints around EPSP_CSperiod onset')
            [xindex_ginput y_ginput] = ginput(2);
            if xindex_ginput(1)>round(0.5*Spkdata.fs) && xindex_ginput(2)<round(0.75*Spkdata.fs)
                [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                PSP_onset.onset_EPSP_CSperiod(ii,1) = xindex+round(xindex_ginput(1));
                PSP_onset.onset_EPSP_CSperiod(ii,2) = y;
                plot(xindex+round(xindex_ginput(1)),y,'g*')
                pause;
                axis on

                figname = sprintf('EPSP_CSperiod_CSonly_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('EPSP_CSperiod_CSonly_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                print('-dpdf','-vector','-loose','-fillpage',figname)
                hold off;
            else
                PSP_onset.onset_EPSP_CSperiod(ii,1) =  NaN;
                PSP_onset.onset_EPSP_CSperiod(ii,2) = NaN;
            end

        elseif Eyeblink_signal.GoTr_IDstim(ii)==3&&Eyeblink_signal.outlierindx_paired(ii)==1

            index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
            index = movmedian(index,0.01*Spkdata.fs);
            plot(index,'r'); hold on;
            ylim([-10 10])
            line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
            refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

            title('Select 2 timepoints around EPSP_CSperiod onset')
            [xindex_ginput y_ginput] = ginput(2);
            if xindex_ginput(1)>round(0.5*Spkdata.fs) && xindex_ginput(2)<round(0.75*Spkdata.fs)
                [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                PSP_onset.onset_EPSP_CSperiod(ii,1) = xindex+round(xindex_ginput(1));
                PSP_onset.onset_EPSP_CSperiod(ii,2) = y;
                plot(xindex+round(xindex_ginput(1)),y,'g*')
                pause;
                axis on
                figname = sprintf('EPSP_CSperiod_paired_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('EPSP_CSperiodindOnset_paired_%s_%s.pdf',num2str(ii),Param.cellID)
                print('-dpdf','-vector','-loose','-fillpage',figname)


            else
                PSP_onset.onset_EPSP_CSperiod(ii,1) =  NaN;
                PSP_onset.onset_EPSP_CSperiod(ii,2) = NaN;
                                hold off;
            end
        end
            hold off; plot(NaN);

    end

close(H(1))
% Retrieve correct values
PSP_onset.onset_EPSP_CSperiod(:,1) = ((PSP_onset.onset_EPSP_CSperiod(:,1)/Spkdata.fs)-0.5)*1000;
% PSP_onset.onset_EPSP_CSperiod(:,1) = (PSP_onset.onset_EPSP_CSperiod(:,1)-0.5)*1000;


%% Determine PSP onset US period (if there is one) in paired and USonly
PSP_onset.onset_EPSP_USperiod = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
H(1)=figure; figureFullScreen(H(1));

for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around EPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_EPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_EPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('EPSP_USperiod_USonly_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('EPSP_USperiod_USonly_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_EPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_EPSP_USperiod(ii,2) = NaN;
        end

    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around EPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_EPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_EPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('EPSP_USperiod_paired_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('EPSP_USperiod_paired_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_EPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_EPSP_USperiod(ii,2) = NaN;
        end
    end
        hold off; plot(NaN);
end
close(H(1))
% Retrieve correct values
PSP_onset.onset_EPSP_USperiod(:,1) = ((PSP_onset.onset_EPSP_USperiod(:,1)/Spkdata.fs)-0.5)*1000;
% PSP_onset.onset_EPSP_USperiod(:,1) = (PSP_onset.onset_EPSP_USperiod(:,1)-0.5)*1000;

%% Plot onset time during CS period over trials
cd([Param.path_ephys '\Onset_analysis_PSP'])
H(1)=figure; figureFullScreen(H(1)); hold on;
plot(PSP_onset.onset_EPSP_CSperiod(:,1),'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(PSP_onset.onset_EPSP_CSperiod(:,1),1)
    h = plot(ii,PSP_onset.onset_EPSP_CSperiod(ii,1),'ko');
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
title('EPSP onset time CS period over trials (paired + CSonly)','fontsize',16); ylabel('Time after CS onset (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
% Calculate the correlation over trials
corr_index = PSP_onset.onset_EPSP_CSperiod(isnan(PSP_onset.onset_EPSP_CSperiod(:,1))==0,1);
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[PSP_onset.onset_EPSP_CSperiod_RHO,PSP_onset.onset_EPSP_CSperiod_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',PSP_onset.onset_EPSP_CSperiod_RHO,PSP_onset.onset_EPSP_CSperiod_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

figname = sprintf('EPSPonsetTime_CSperiod_OverTrials_%s.fig',Param.cellID)
saveas(gcf,figname,'fig');
figname = sprintf('EPSPonsetTime_CSperiod_OverTrials_%s.pdf',Param.cellID)
print('-dpdf','-vector','-loose','-fillpage',figname)

close(H(1))

%% Plot onset time during US period over trials
H(1)=figure; figureFullScreen(H(1)); hold on;
plot(PSP_onset.onset_EPSP_USperiod(:,1),'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(PSP_onset.onset_EPSP_USperiod(:,1),1)
    h = plot(ii,PSP_onset.onset_EPSP_USperiod(ii,1),'ko');
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
title('EPSP onset time US period over trials (paired + USonly)','fontsize',16); ylabel('Time after CS onset (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
% Calculate the correlation over trials
corr_index = PSP_onset.onset_EPSP_USperiod(isnan(PSP_onset.onset_EPSP_USperiod(:,1))==0,1);
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[PSP_onset.onset_EPSP_USperiod_RHO,PSP_onset.onset_EPSP_USperiod_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',PSP_onset.onset_EPSP_USperiod_RHO,PSP_onset.onset_EPSP_USperiod_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

figname = sprintf('EPSPonsetTime_USperiod_OverTrials_%s.fig',Param.cellID)
saveas(gcf,figname,'fig');
figname = sprintf('EPSPonsetTime_USperiod_OverTrials_%s.pdf',Param.cellID)
print('-dpdf','-vector','-loose','-fillpage',figname)

close(H(1))

elseif  Param.cell_resp == 2 %% For CS/US suppressed responses
     for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
        if Eyeblink_signal.GoTr_IDstim(ii)==1&&Eyeblink_signal.outlierindx_CSonly(ii)==1
            ii
            index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
            index = movmedian(index,0.01*Spkdata.fs);
            plot(index,'r'); hold on;
            ylim([-10 10])
            line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
            refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

            title('Select 2 timepoints around IPSP_CSperiod onset')
            [xindex_ginput y_ginput] = ginput(2);
            if xindex_ginput(1)>round(0.5*Spkdata.fs) && xindex_ginput(2)<round(0.75*Spkdata.fs)
                [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                PSP_onset.onset_IPSP_CSperiod(ii,1) = xindex+round(xindex_ginput(1));
                PSP_onset.onset_IPSP_CSperiod(ii,2) = y;
                plot(xindex+round(xindex_ginput(1)),y,'g*')
                pause;
                axis on
                figname = sprintf('IPSP_CSperiod_CSonly_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('IPSP_CSperiod_CSonly_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                print('-dpdf','-vector','-loose','-fillpage',figname)

            else
                PSP_onset.onset_IPSP_CSperiod(ii,1) =  NaN;
                PSP_onset.onset_IPSP_CSperiod(ii,2) = NaN;
            end

        elseif Eyeblink_signal.GoTr_IDstim(ii)==3&&Eyeblink_signal.outlierindx_paired(ii)==1

            index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
            index = movmedian(index,0.01*Spkdata.fs);
            plot(index,'r'); hold on;
            ylim([-10 10])
            line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
            refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

            title('Select 2 timepoints around IPSP_CSperiod onset')
            [xindex_ginput y_ginput] = ginput(2);
            if xindex_ginput(1)>round(0.5*Spkdata.fs) && xindex_ginput(2)<round(0.75*Spkdata.fs)
                [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                PSP_onset.onset_IPSP_CSperiod(ii,1) = xindex+round(xindex_ginput(1));
                PSP_onset.onset_IPSP_CSperiod(ii,2) = y;
                plot(xindex+round(xindex_ginput(1)),y,'g*')
                pause;
                axis on
                figname = sprintf('IPSP_CSperiod_paired_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('IPSP_CSperiodindOnset_paired_%s_%s.pdf',num2str(ii),Param.cellID)
                print('-dpdf','-vector','-loose','-fillpage',figname)


            else
                PSP_onset.onset_IPSP_CSperiod(ii,1) =  NaN;
                PSP_onset.onset_IPSP_CSperiod(ii,2) = NaN;
            end
        end
            hold off; plot(NaN);

    end

close(H(1))
% Retrieve correct values
PSP_onset.onset_IPSP_CSperiod(:,1) = ((PSP_onset.onset_IPSP_CSperiod(:,1)/Spkdata.fs)-0.5)*1000;
% PSP_onset.onset_IPSP_CSperiod(:,1) = (PSP_onset.onset_IPSP_CSperiod(:,1)-0.5)*1000;

%% Determine PSP onset US period (if there is one) in paired and USonly
PSP_onset.onset_IPSP_USperiod = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
H(1)=figure; figureFullScreen(H(1));

for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around IPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_IPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_IPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('IPSP_USperiod_USonly_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('IPSP_USperiod_USonly_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_IPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_IPSP_USperiod(ii,2) = NaN;
        end

    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around IPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_IPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_IPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('IPSP_USperiod_paired_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('IPSP_USperiod_paired_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_IPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_IPSP_USperiod(ii,2) = NaN;
        end
    end
        hold off; plot(NaN);

end
close(H(1))
% Retrieve correct values
PSP_onset.onset_IPSP_USperiod(:,1) = ((PSP_onset.onset_IPSP_USperiod(:,1)/Spkdata.fs)-0.5)*1000;
% PSP_onset.onset_IPSP_USperiod(:,1) = (PSP_onset.onset_IPSP_USperiod(:,1)-0.5)*1000;

%% Plot onset time during CS period over trials
cd([Param.path_ephys '\Onset_analysis_PSP'])
H(1)=figure; figureFullScreen(H(1)); hold on;
plot(PSP_onset.onset_IPSP_CSperiod(:,1),'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(PSP_onset.onset_IPSP_CSperiod(:,1),1)
    h = plot(ii,PSP_onset.onset_IPSP_CSperiod(ii,1),'ko');
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
title('IPSP onset time CS period over trials (paired + CSonly)','fontsize',16); ylabel('Time after CS onset (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
% Calculate the correlation over trials
corr_index = PSP_onset.onset_IPSP_CSperiod(isnan(PSP_onset.onset_IPSP_CSperiod(:,1))==0,1);
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[PSP_onset.onset_IPSP_CSperiod_RHO,PSP_onset.onset_IPSP_CSperiod_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',PSP_onset.onset_IPSP_CSperiod_RHO,PSP_onset.onset_IPSP_CSperiod_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

figname = sprintf('IPSPonsetTime_CSperiod_OverTrials_%s.fig',Param.cellID)
saveas(gcf,figname,'fig');
figname = sprintf('IPSPonsetTime_CSperiod_OverTrials_%s.pdf',Param.cellID)
print('-dpdf','-vector','-loose','-fillpage',figname)

close(H(1))
end
if Param.cell_resp == 0
    %% Determine PSP onset US period (if there is one) in paired and USonly
PSP_onset.onset_EPSP_USperiod = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2);
H(1)=figure; figureFullScreen(H(1));

for ii=1:size(Eyeblink_signal.GoTr_IDstim,2)
    if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around EPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_EPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_EPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('EPSP_USperiod_USonly_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('EPSP_USperiod_USonly_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_EPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_EPSP_USperiod(ii,2) = NaN;
        end

    elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
        ii
        index = Spkresults.ind_data(ii,:)-nanmean(Spkresults.ind_data(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
        index = movmedian(index,0.01*Spkdata.fs);
        plot(index,'b'); hold on;
        ylim([-10 10])
        line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.75*Spkdata.fs 0.75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        line([0.76*Spkdata.fs 0.76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
        refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
        refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))

        title('Select 2 timepoints around EPSP_USperiod onset')
        [xindex_ginput y_ginput] = ginput(2);
        if xindex_ginput(1)>round(0.75*Spkdata.fs) && xindex_ginput(2)<round(1*Spkdata.fs)
            [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
            PSP_onset.onset_EPSP_USperiod(ii,1) = xindex+round(xindex_ginput(1));
            PSP_onset.onset_EPSP_USperiod(ii,2) = y;
            plot(xindex+round(xindex_ginput(1)),y,'g*')
            pause;
            axis on
            figname = sprintf('EPSP_USperiod_paired_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
            saveas(gcf,figname,'fig');
            figname = sprintf('EPSP_USperiod_paired_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
            print('-dpdf','-vector','-loose','-fillpage',figname)

        else
            PSP_onset.onset_EPSP_USperiod(ii,1) =  NaN;
            PSP_onset.onset_EPSP_USperiod(ii,2) = NaN;
        end
    end
        hold off; plot(NaN);
end
close(H(1))
% Retrieve correct values
PSP_onset.onset_EPSP_USperiod(:,1) = ((PSP_onset.onset_EPSP_USperiod(:,1)/Spkdata.fs)-0.5)*1000;
% PSP_onset.onset_EPSP_USperiod(:,1) = (PSP_onset.onset_EPSP_USperiod(:,1)-0.5)*1000;


%% Plot onset time during US period over trials
H(1)=figure;figureFullScreen(H(1)); hold on;
plot(PSP_onset.onset_EPSP_USperiod(:,1),'ko');
h = lsline;
set(h,'LineWidth',1)
for ii=1:size(PSP_onset.onset_EPSP_USperiod(:,1),1)
    h = plot(ii,PSP_onset.onset_EPSP_USperiod(ii,1),'ko');
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
title('EPSP onset time US period over trials (paired + USonly)','fontsize',16); ylabel('Time after CS onset (ms)','fontsize',16); xlabel('Trialnumber','fontsize',16)
% Calculate the correlation over trials
corr_index = PSP_onset.onset_EPSP_USperiod(isnan(PSP_onset.onset_EPSP_USperiod(:,1))==0,1);
corr_index(1:length(corr_index),2) = 1:length(corr_index);
[PSP_onset.onset_EPSP_USperiod_RHO,PSP_onset.onset_EPSP_USperiod_PVAL] = corr(corr_index(:,1),corr_index(:,2));

% Print the values in the scatterplot
text_Ylim = get(gca,'Ylim');text_Xlim = get(gca,'Xlim');
text((text_Xlim(1)+0.05*(text_Xlim(2)-text_Xlim(1))),(text_Ylim(2)-0.05*(text_Ylim(2)-text_Ylim(1))),sprintf('r2 = %.3f \nP = %.3f',PSP_onset.onset_EPSP_USperiod_RHO,PSP_onset.onset_EPSP_USperiod_PVAL),'FontSize',14)
a = get(gca,'XTickLabel'); set(gca,'XTickLabel',a,'fontsize',14);

figname = sprintf('EPSPonsetTime_USperiod_OverTrials_%s.fig',Param.cellID)
saveas(gcf,figname,'fig');
figname = sprintf('EPSPonsetTime_USperiod_OverTrials_%s.pdf',Param.cellID)
print('-dpdf','-vector','-loose','-fillpage',figname)

close(H(1))
end

if Param.cell_resp == 1|| Param.cell_resp == 2|| Param.cell_resp == 0
%     if savedata==1;
        savename = sprintf('Results_PSPonset_%.f_%s',jj,Param.cellID);
        save(savename,'PSP_onset');
        %     save(savename,'PSP_AUC','PSP_amp');
%     end
end