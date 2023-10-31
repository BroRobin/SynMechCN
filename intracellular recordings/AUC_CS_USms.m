%% Calculate the area under the curve (AUC) during the last 40ms before the US
% Distinguishing between CR/NR/EO (SEO) trials
% (c) R. Broersen, Erasmus MC, 2023

% AUC 40ms before US onset
Spkresults.AUC_CS_last40=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_mdn,1)
    if isnan(Spkresults.CS_trials_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_last40(ii)=nansum(Spkresults.CS_trials_mdn_norm(ii,0.71*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_last40(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_last40 = nanmean(Spkresults.AUC_CS_last40);
Spkresults.mdn_AUC_CS_last40 = nanmedian(Spkresults.AUC_CS_last40);

% normal
Spkresults.AUC_CS_normal_last40=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_normal_mdn,1)
    if isnan(Spkresults.CS_trials_normal_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_normal_last40(ii)=nansum(Spkresults.CS_trials_normal_mdn_norm(ii,0.71*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_normal_last40(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_normal_last40 = nanmean(Spkresults.AUC_CS_normal_last40);
Spkresults.mdn_AUC_CS_normal_last40 = nanmedian(Spkresults.AUC_CS_normal_last40);

% CR
Spkresults.AUC_CS_CR_last40=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_CR_mdn,1)
    if isnan(Spkresults.CS_trials_CR_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_CR_last40(ii)=nansum(Spkresults.CS_trials_CR_mdn_norm(ii,0.71*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_CR_last40(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_CR_last40 = nanmean(Spkresults.AUC_CS_CR_last40);
Spkresults.mdn_AUC_CS_CR_last40 = nanmedian(Spkresults.AUC_CS_CR_last40);

% SEO
Spkresults.AUC_CS_SEO_last40=[];
AUCidx=[];
for ii=1:size(Spkresults.CS_trials_SEO_mdn,1)
    if isnan(Spkresults.CS_trials_SEO_mdn_norm(ii,1))==0
        Spkresults.AUC_CS_SEO_last40(ii)=nansum(Spkresults.CS_trials_SEO_mdn_norm(ii,0.71*Spkdata.fs:0.75*Spkdata.fs));
    else
        Spkresults.AUC_CS_SEO_last40(ii) = NaN;
    end
end
Spkresults.avg_AUC_CS_SEO_last40 = nanmean(Spkresults.AUC_CS_SEO_last40);
Spkresults.mdn_AUC_CS_SEO_last40 = nanmedian(Spkresults.AUC_CS_SEO_last40);

excel_new = [Spkresults.avg_AUC_CS_last40 Spkresults.avg_AUC_CS_normal_last40 Spkresults.avg_AUC_CS_CR_last40 Spkresults.avg_AUC_CS_SEO_last40 Spkresults.mdn_AUC_CS_last40 Spkresults.mdn_AUC_CS_normal_last40 Spkresults.mdn_AUC_CS_CR_last40 Spkresults.mdn_AUC_CS_SEO_last40];

% save('Results_AUC_CSUSwindows.mat','Spkresults','excel_new','-v7.3');

