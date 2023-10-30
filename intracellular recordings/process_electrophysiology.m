%% Process the raw electrophysiology files
% Load electrophysiology files into MATLAB. Determine the timings of the
% start of the trial, the CS and the US. Remove the excluded trials from
% the dataset. Generate figures.
% (c) R. Broersen, Erasmus MC, 2023

%% Load the ephys data
[Spkdata.d,Spkdata.si,Spkdata.h]=abf2load([Param.path_ephys '\' Param.EphysdataFile],'channels',{['IN ' num2str(Param.inputChannel)]});
Spkdata.data = Spkdata.d;
Spkdata.fs = 10^6/Spkdata.si; % Calculate the sampling frequency.
Spkdata.recLength = length(Spkdata.data)/Spkdata.fs;
Spkdata.Ts = 1/Spkdata.fs;
Spkdata.ind_data_timestamps = [Spkdata.Ts:Spkdata.Ts:2];


%% Load the GoTr data
[Spkdata.d]=abf2load([Param.path_ephys '\' Param.EphysdataFile],'channels',{['IN ' num2str(Param.GoTrChannel)]});
Spkdata.GoTr_data =Spkdata.d;

% Detect where the TTL pulse is on and register those datapoints
TTLindex = find(Spkdata.GoTr_data>Param.TTLthreshold);
index = find(diff(TTLindex)>1.5);

% Gather timestamps within each trial period
for ii=1:length(index)+1
    if ii==1
        Spkdata.ind_GoTrTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
    elseif 1<ii && ii<length(index)+1
        Spkdata.ind_GoTrTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
    elseif ii==length(index)+1
        Spkdata.ind_GoTrTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
    end
end

%% Load the LtOn data
[Spkdata.d]=abf2load([Param.path_ephys '\' Param.EphysdataFile],'channels',{['IN ' num2str(Param.LtOnChannel)]});
Spkdata.LtOn_data =Spkdata.d;

% Detect where the TTL pulse is on and register those datapoints
TTLindex = find(Spkdata.LtOn_data>Param.TTLthreshold);
index = find(diff(TTLindex)>1.5);

% Gather timestamps within each trial period
for ii=1:length(index)+1
    if ii==1
        Spkdata.ind_LtOnTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
    elseif 1<ii && ii<length(index)+1
        Spkdata.ind_LtOnTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
    elseif ii==length(index)+1
        Spkdata.ind_LtOnTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
    end
end

%% Load the PfOn data
[Spkdata.d]=abf2load([Param.path_ephys '\' Param.EphysdataFile],'channels',{['IN ' num2str(Param.PfOnChannel)]});
Spkdata.PfOn_data =Spkdata.d;

% Detect where the TTL pulse is on and register those datapoints
TTLindex = find(Spkdata.PfOn_data>Param.TTLthreshold);
index = find(diff(TTLindex)>1.5);

% Gather timestamps within each trial period
for ii=1:length(index)+1
    if ii==1
        Spkdata.ind_PfOnTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
    elseif 1<ii && ii<length(index)+1
        Spkdata.ind_PfOnTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
    elseif ii==length(index)+1
        Spkdata.ind_PfOnTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
    end
end

%% Remove the loaded variables to free memory
Spkdata.d =[];
Spkdata.GoTr_data =[];
Spkdata.LtOn_data =[];
Spkdata.PfOn_data =[];

%% Cut the datatraces into epochs, based on the GoTr timestamps
Spkdata.ind_GoTrTTLdata(Spkdata.ind_GoTrTTLdata==0)=NaN; %Remove 0s

for ii=1:length(Eyeblink_signal.GoTr_IDstim)
    Spkresults.ind_data(ii,1:2*Spkdata.fs) = Spkdata.data(min(Spkdata.ind_GoTrTTLdata(ii,:)):(min(Spkdata.ind_GoTrTTLdata(ii,:))+((2-Spkdata.Ts)*Spkdata.fs)));
end

%% Exclude ephys trials

if numel(Param.exclude_trials)>0
    Spkresults.ind_data(Param.exclude_trials,:) = NaN; % Exclude based on quality of ephys recording

    Eyeblink_signal.ind_trials(Param.exclude_trials,:) = NaN; % Exclude based on quality of eyelid recording

    Eyeblink_signal.GoTr_TimeStamps(Param.exclude_trials) = NaN;
    Eyeblink_signal.GoTr_IDstim(Param.exclude_trials) = NaN;

    Eyeblink_signal.outlierindx_paired(Param.exclude_trials) = NaN;
    Eyeblink_signal.outlierfree_paired(Param.exclude_trials,:) = NaN;

    Eyeblink_signal.outlierindx_USonly(Param.exclude_trials) = NaN;
    Eyeblink_signal.outlierfree_USonly(Param.exclude_trials,:) = NaN;

    Eyeblink_signal.outlierindx_CSonly(Param.exclude_trials) = NaN;
    Eyeblink_signal.outlierfree_CSonly(Param.exclude_trials,:) = NaN;
end

if sum(Eyeblink_signal.outlierindx_paired==0)>0
    Spkresults.ind_data(Eyeblink_signal.outlierindx_paired==0,:) = NaN;

    Eyeblink_signal.ind_trials(Eyeblink_signal.outlierindx_paired==0,:) = NaN;

    Eyeblink_signal.GoTr_TimeStamps(Eyeblink_signal.outlierindx_paired==0) = NaN;
    Eyeblink_signal.GoTr_IDstim(Eyeblink_signal.outlierindx_paired==0) = NaN;
end


if sum(Eyeblink_signal.outlierindx_CSonly==0)>0
    Spkresults.ind_data(Eyeblink_signal.outlierindx_CSonly==0,:) = NaN;

    Eyeblink_signal.ind_trials(Eyeblink_signal.outlierindx_CSonly==0,:) = NaN;

    Eyeblink_signal.GoTr_TimeStamps(Eyeblink_signal.outlierindx_CSonly==0) = NaN;
    Eyeblink_signal.GoTr_IDstim(Eyeblink_signal.outlierindx_CSonly==0) = NaN;
end

if sum(Eyeblink_signal.outlierindx_USonly==0)>0
    Spkresults.ind_data(Eyeblink_signal.outlierindx_USonly==0,:) = NaN;

    Eyeblink_signal.ind_trials(Eyeblink_signal.outlierindx_USonly==0,:) = NaN;

    Eyeblink_signal.GoTr_TimeStamps(Eyeblink_signal.outlierindx_USonly==0) = NaN;
    Eyeblink_signal.GoTr_IDstim(Eyeblink_signal.outlierindx_USonly==0) = NaN;
end


%% Predefine variables

Spkresults.ind_data_USonly = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % all USonly trials
Spkresults.ind_data_USonly_error = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % Excluded USonly trials

Spkresults.ind_data_CSonly = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % All CSonly trials
Spkresults.ind_data_CSonly_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_CSonly_normal = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_CSonly_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_CSonly_error = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % Excluded CSonly trials

Spkresults.ind_data_paired = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % All paired trials
Spkresults.ind_data_paired_CR = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_paired_normal = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_paired_SEO = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs);
Spkresults.ind_data_paired_error = NaN(size(Eyeblink_signal.GoTr_IDstim,2),2*Spkdata.fs); % Excluded paired trials

H(1) = figure; figureFullScreen(H(1))
% Gather stimuli (US only normal and error)
if sum(Eyeblink_signal.GoTr_IDstim==2)>0
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==1
            Spkresults.ind_data_USonly(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'k');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_USonly_normal_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_USonly_normal_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==2 && Eyeblink_signal.outlierindx_USonly(ii)==0
            Spkresults.ind_data_USonly_error(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'r');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_USonly_error_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_USonly_error_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        end
    end
end

% Gather stimuli (CS only CR, normal, SEO and error)
if sum(Eyeblink_signal.GoTr_IDstim==1)>0
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1
            Spkresults.ind_data_CSonly(ii,:) = Spkresults.ind_data(ii,:);
        end
    end

    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==2 % CR
            Spkresults.ind_data_CSonly_CR(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'g');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_CSonly_CR_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_CSonly_CR_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==3 % normal
            Spkresults.ind_data_CSonly_normal(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'b');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_CSonly_normal_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_CSonly_normal_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==1 && R.trial_CRs(ii,1)==5 % SEO
            Spkresults.ind_data_CSonly_SEO(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'k');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_CSonly_SEO_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_CSonly_SEO_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==1 && Eyeblink_signal.outlierindx_CSonly(ii)==0 % error
            Spkresults.ind_data_CSonly_error(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'r');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_CSonly_error_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_CSonly_error_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        end
    end
end

% Gather stimuli (paired CR, normal, SEO and error)
if sum(Eyeblink_signal.GoTr_IDstim==3)>0
    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1
            Spkresults.ind_data_paired(ii,:) = Spkresults.ind_data(ii,:);
        end
    end

    for ii=1:length(Eyeblink_signal.GoTr_IDstim)
        if Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==1 % CR
            Spkresults.ind_data_paired_CR(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'g');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_paired_CR_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_paired_CR_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==0 % normal
            Spkresults.ind_data_paired_normal(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'b');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_paired_normal_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_paired_normal_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==1 && R.trial_CRs(ii,1)==4 % SEO
            Spkresults.ind_data_paired_SEO(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'k');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_paired_SEO_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_paired_SEO_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        elseif Eyeblink_signal.GoTr_IDstim(ii)==3 && Eyeblink_signal.outlierindx_paired(ii)==0 % error
            Spkresults.ind_data_paired_error(ii,:) = Spkresults.ind_data(ii,:);
            figure(H(1));
            plotaxishandle(ii) = plot(Spkresults.ind_data(ii,:),'r');
            set(plotaxishandle(ii), 'LineWidth', [1]);
            axis on
            line([.5*Spkdata.fs .5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.75*Spkdata.fs .75*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            line([.76*Spkdata.fs .76*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
            %             %Save the figure
            if Param.savefig==1
                figname = sprintf('%.f_paired_error_ephys_%s.fig',ii,Param.cellID)
                saveas(gcf,figname,'fig');
                figname = sprintf('%.f_paired_error_ephys_%s.pdf',ii,Param.cellID)
                print('-dpdf','-vector','-loose',figname)
            end
        end
    end
end

%% Filter to remove spikes

% CS trials
Spkresults.CS_trials = [Spkresults.ind_data_CSonly;Spkresults.ind_data_paired];
Spkresults.CS_trials_SEO = [Spkresults.ind_data_CSonly_SEO;Spkresults.ind_data_paired_SEO];
Spkresults.CS_trials_normal = [Spkresults.ind_data_CSonly_normal; Spkresults.ind_data_paired_normal];
Spkresults.CS_trials_CR = [Spkresults.ind_data_CSonly_CR;Spkresults.ind_data_paired_CR];

for ii=1:size(Spkresults.CS_trials,1)
    Spkresults.CS_trials_mdn(ii,:) = movmedian(Spkresults.CS_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end

for ii=1:size(Spkresults.CS_trials_normal,1)
    Spkresults.CS_trials_normal_mdn(ii,:) = movmedian(Spkresults.CS_trials_normal(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end

for ii=1:size(Spkresults.CS_trials_CR,1)
    Spkresults.CS_trials_CR_mdn(ii,:) = movmedian(Spkresults.CS_trials_CR(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end

for ii=1:size(Spkresults.CS_trials_SEO,1)
    Spkresults.CS_trials_SEO_mdn(ii,:) = movmedian(Spkresults.CS_trials_SEO(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end

% US trials
Spkresults.US_trials = [Spkresults.ind_data_USonly; Spkresults.ind_data_paired];
Spkresults.US_trials_normal = [Spkresults.ind_data_paired_normal];
Spkresults.US_trials_CR = [Spkresults.ind_data_paired_CR];
Spkresults.US_trials_SEO = [Spkresults.ind_data_paired_SEO];
Spkresults.USonly_trials = [Spkresults.ind_data_USonly];

for ii=1:size(Spkresults.US_trials,1)
    Spkresults.US_trials_mdn(ii,:) = movmedian(Spkresults.US_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_normal,1)
    Spkresults.US_trials_normal_mdn(ii,:) = movmedian(Spkresults.US_trials_normal(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_CR,1)
    Spkresults.US_trials_CR_mdn(ii,:) = movmedian(Spkresults.US_trials_CR(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.US_trials_SEO,1)
    Spkresults.US_trials_SEO_mdn(ii,:) = movmedian(Spkresults.US_trials_SEO(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end
for ii=1:size(Spkresults.USonly_trials,1)
    Spkresults.USonly_trials_mdn(ii,:) = movmedian(Spkresults.USonly_trials(ii,:),0.01*Spkdata.fs); % Median filter of 10ms
end

% figure; hold on; plot(Spkresults.CS_trials(11,:),'k'); plot(Spkresults.CS_trials_mdn(11,:),'b');

%% Normalize to 250 ms before CS onset

% CS trials
for ii=1:size(Spkresults.CS_trials_mdn,1)
    Spkresults.CS_trials_mdn_norm(ii,:) = Spkresults.CS_trials_mdn(ii,:)-nanmean(Spkresults.CS_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.CS_trials_normal_mdn,1)
    Spkresults.CS_trials_normal_mdn_norm(ii,:) = Spkresults.CS_trials_normal_mdn(ii,:)-nanmean(Spkresults.CS_trials_normal_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.CS_trials_CR_mdn,1)
    Spkresults.CS_trials_CR_mdn_norm(ii,:) = Spkresults.CS_trials_CR_mdn(ii,:)-nanmean(Spkresults.CS_trials_CR_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.CS_trials_SEO_mdn,1)
    Spkresults.CS_trials_SEO_mdn_norm(ii,:) = Spkresults.CS_trials_SEO_mdn(ii,:)-nanmean(Spkresults.CS_trials_SEO_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

% US trials
for ii=1:size(Spkresults.US_trials_mdn,1)
    Spkresults.US_trials_mdn_norm(ii,:) = Spkresults.US_trials_mdn(ii,:)-nanmean(Spkresults.US_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.US_trials_normal_mdn,1)
    Spkresults.US_trials_normal_mdn_norm(ii,:) = Spkresults.US_trials_normal_mdn(ii,:)-nanmean(Spkresults.US_trials_normal_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.US_trials_CR_mdn,1)
    Spkresults.US_trials_CR_mdn_norm(ii,:) = Spkresults.US_trials_CR_mdn(ii,:)-nanmean(Spkresults.US_trials_CR_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end
for ii=1:size(Spkresults.US_trials_SEO_mdn,1)
    Spkresults.US_trials_SEO_mdn_norm(ii,:) = Spkresults.US_trials_SEO_mdn(ii,:)-nanmean(Spkresults.US_trials_SEO_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end

for ii=1:size(Spkresults.USonly_trials_mdn,1)
    Spkresults.USonly_trials_mdn_norm(ii,:) = Spkresults.USonly_trials_mdn(ii,:)-nanmean(Spkresults.USonly_trials_mdn(ii,0.25*Spkdata.fs:0.5*Spkdata.fs));
end


%  figure; hold on; plot(nanmean(Spkresults.CS_trials_CR_mdn_norm,1),'g'); plot(nanmean(Spkresults.CS_trials_normal_mdn_norm,1),'b');
%  figure; hold on; plot(nanmean(Spkresults.US_trials_CR_mdn_norm,1),'g'); plot(nanmean(Spkresults.US_trials_normal_mdn_norm,1),'b');











