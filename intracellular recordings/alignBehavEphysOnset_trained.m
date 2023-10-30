%% Generate figures showing behavior and ephys data aligned to eyelid onset or ephys onset
% Create and figures and save them.
% (c) R. Broersen, Erasmus MC, 2023

% Manually load the following files files:
% Results_PSPonset
% Results_ephys_CSandUS
% Results_behavior_advanced

Eyeblink_signal.ind_trials = ((Eyeblink_signal.ind_trials-behav.range(1))/behav.range(3))*100; % Normalize the values to max eyeopening

%% Choose the CS response
CS.resp = 1; % CS-activated
% CS.resp = 2; % CS-suppressed

%% before and after

xtimes_behav = [-0.1:(1/Param.fs):0.3];
xtimes_Vm = [-0.1:(1/100000):0.3];

%Align to eyelid onset
Onsetnorm.eyelidOnset_eyelid_trials = NaN(500,2442);
Onsetnorm.eyelidOnset_Vm_trials = NaN(500,100001);
try
    for ii=1:size(Eyeblink_signal.ind_trials,1)
        idx=[];
        idx_Vm=[];
        if CS.resp==1
            if isnan(PSP_onset.onset_EPSP_CSperiod(ii,1))==0 && isnan(behav.onset_CR(ii,1))==0
                idx = round(((behav.onset_CR(ii,1)+500)*10^-3)*Param.fs);
                Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Eyeblink_signal.ind_trials(ii,idx-(0.5*Param.fs):idx+(0.5*Param.fs));
                Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Onsetnorm.eyelidOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_eyelid_trials(ii,1:0.25*Param.fs));
                idx = round(((behav.onset_CR(ii,1)+500)*10^-3)*100000);
                idx_Vm = movmedian(Spkresults.ind_data(ii,:),0.01*Spkdata.fs);
                Onsetnorm.eyelidOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.5*100000):idx+(0.5*100000));
                Onsetnorm.eyelidOnset_Vm_trials(ii,:)=Onsetnorm.eyelidOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_Vm_trials(ii,1:0.25*100000));
            end
        elseif CS.resp==2
            if isnan(PSP_onset.onset_IPSP_CSperiod(ii,1))==0 && isnan(behav.onset_CR(ii,1))==0
                idx = round(((behav.onset_CR(ii,1)+500)*10^-3)*Param.fs);
                Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Eyeblink_signal.ind_trials(ii,idx-(0.5*Param.fs):idx+(0.5*Param.fs));
                Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Onsetnorm.eyelidOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_eyelid_trials(ii,1:0.25*Param.fs));
                idx = round(((behav.onset_CR(ii,1)+500)*10^-3)*100000);
                idx_Vm = movmedian(Spkresults.ind_data(ii,:),0.01*Spkdata.fs);
                Onsetnorm.eyelidOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.5*100000):idx+(0.5*100000));
                Onsetnorm.eyelidOnset_Vm_trials(ii,:)=Onsetnorm.eyelidOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_Vm_trials(ii,1:0.25*100000));
            end
        end
    end
end

figure; subplot(2,1,1); plot(xtimes_behav,nanmean(Onsetnorm.eyelidOnset_eyelid_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.1 0.3])

subplot(2,1,2); plot(xtimes_Vm,nanmean(Onsetnorm.eyelidOnset_Vm_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.1 0.3])


%Align to Vm onset
Onsetnorm.VmOnset_eyelid_trials = NaN(500,2442);
Onsetnorm.VmOnset_Vm_trials = NaN(500,100001);
try
    for ii=1:size(Eyeblink_signal.ind_trials,1)
        idx=[];
        idx_Vm=[];
        if CS.resp==1
            if isnan(PSP_onset.onset_EPSP_CSperiod(ii,1))==0 && isnan(behav.onset_CR(ii,1))==0
                idx = round(((PSP_onset.onset_EPSP_CSperiod(ii,1)+500)*10^-3)*Param.fs);
                Onsetnorm.VmOnset_eyelid_trials(ii,:)=Eyeblink_signal.ind_trials(ii,idx-(0.5*Param.fs):idx+(0.5*Param.fs));
                Onsetnorm.VmOnset_eyelid_trials(ii,:)=Onsetnorm.VmOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.VmOnset_eyelid_trials(ii,1:0.25*Param.fs));
                idx = round(((PSP_onset.onset_EPSP_CSperiod(ii,1)+500)*10^-3)*100000);
                idx_Vm = movmedian(Spkresults.ind_data(ii,:),0.01*Spkdata.fs);
                Onsetnorm.VmOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.5*100000):idx+(0.5*100000));
                Onsetnorm.VmOnset_Vm_trials(ii,:)=Onsetnorm.VmOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.VmOnset_Vm_trials(ii,1:0.25*100000));
            end
        elseif CS.resp==2
            if isnan(PSP_onset.onset_IPSP_CSperiod(ii,1))==0 && isnan(behav.onset_CR(ii,1))==0
                idx = round(((PSP_onset.onset_IPSP_CSperiod(ii,1)+500)*10^-3)*Param.fs);
                Onsetnorm.VmOnset_eyelid_trials(ii,:)=Eyeblink_signal.ind_trials(ii,idx-(0.5*Param.fs):idx+(0.5*Param.fs));
                Onsetnorm.VmOnset_eyelid_trials(ii,:)=Onsetnorm.VmOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.VmOnset_eyelid_trials(ii,1:0.25*Param.fs));
                idx = round(((PSP_onset.onset_IPSP_CSperiod(ii,1)+500)*10^-3)*100000);
                idx_Vm = movmedian(Spkresults.ind_data(ii,:),0.01*Spkdata.fs);
                Onsetnorm.VmOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.5*100000):idx+(0.5*100000));
                Onsetnorm.VmOnset_Vm_trials(ii,:)=Onsetnorm.VmOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.VmOnset_Vm_trials(ii,1:0.25*100000));
            end
        end
    end
end
figure; subplot(2,1,1); plot(xtimes_behav,nanmean(Onsetnorm.VmOnset_eyelid_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.1 0.25])

subplot(2,1,2); plot(xtimes_Vm,nanmean(Onsetnorm.VmOnset_Vm_trials));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.1 0.25])

%% Calculate averages

Onsetnorm.eyelidOnset_eyelid_trials_AVG = nanmean(Onsetnorm.eyelidOnset_eyelid_trials,1);
Onsetnorm.eyelidOnset_Vm_trials_AVG = nanmean(Onsetnorm.eyelidOnset_Vm_trials,1);
Onsetnorm.VmOnset_eyelid_trials_AVG = nanmean(Onsetnorm.VmOnset_eyelid_trials,1);
Onsetnorm.VmOnset_Vm_trials_AVG = nanmean(Onsetnorm.VmOnset_Vm_trials,1);

cd('[path]\OnsetAlignment')
savename = sprintf('Results_onsetalignedtraces_%s',Param.cellID);
save(savename,'Onsetnorm','xtimes_Vm','xtimes_behav');


figname = sprintf('Vmaligned_xlimadjust.fig');
saveas(gcf,figname,'fig');
figname = sprintf('Vmaligned_xlimadjust.pdf');
print('-dpdf','-painters','-loose',figname);


figname = sprintf('eyelidaligned_xlimadjust.fig');
saveas(gcf,figname,'fig');
figname = sprintf('eyelidaligned_xlimadjust.pdf');
print('-dpdf','-painters','-loose',figname);




