%% Determine spontaneous spike parameters
% (c) R. Broersen, Erasmus MC, 2023

Spont.spiketimes = [];
Spont.NEpisodes = 0;
if sum(isnan(signal.GoTr_IDstim)==0)>=3
    % gather the spikes
    for kk=1:length(signal.GoTr_IDstim)
        Spont.spiketimes = [Spont.spiketimes; Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(kk) & Spks.spiketimes<=Spkdata.ind_GoTrTTLdata(kk)+0.5)];
        if length(Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(kk) & Spks.spiketimes<=Spkdata.ind_GoTrTTLdata(kk)+0.5))>0
            Spont.NEpisodes = Spont.NEpisodes+1;
        end
    end

    % Calculate spike characteristics
    Spont.frequency = (sum(Spont.spiketimes>0)-1)/(Spont.NEpisodes*0.5); % 0.5 = duration of baseline
    Spont.ISI_list = diff(Spont.spiketimes);
    Spont.ISI_list = Spont.ISI_list(Spont.ISI_list<0.5);
    Spont.ISI = [nanmean(Spont.ISI_list) nanstd(Spont.ISI_list) (nanstd(Spont.ISI_list)/sqrt(sum(Spont.spiketimes>0)))];
    Spont.CV = Spont.ISI(2)/nanmean(Spont.ISI_list);
    for ii = 1:(size(Spont.ISI_list,1)-1)
        Spont.CV2_list(ii) = 2*abs(Spont.ISI_list(ii+1)-Spont.ISI_list(ii))/(Spont.ISI_list(ii+1)+Spont.ISI_list(ii));
    end
    Spont.CV2 = [nanmean(Spont.CV2_list) nanstd(Spont.CV2_list) (nanstd(Spont.CV2_list)/sqrt(length(Spont.CV2_list)))];
    Spont.excel = [Spont.frequency Spont.ISI Spont.CV Spont.CV2];
else
    sprintf('There are less than 3 sweeps (1.5 sec) to calculate the spont spike chars!!!')
end
