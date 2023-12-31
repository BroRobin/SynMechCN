%% Prepare variables for correlation analyses
% (c) R. Broersen, Erasmus MC, 2023

correlation.ephys_amp_CSperiod_CS = Spkresults.amp_CS';
correlation.ephys_amp_CSperiod_CS_CR = Spkresults.amp_CS_CR';
correlation.ephys_amp_CSperiod_CS_normal = Spkresults.amp_CS_normal';
correlation.ephys_amp_CSperiod_CS_SEO = Spkresults.amp_CS_SEO';

correlation.ephys_AUC_CSperiod_CS_last200 = Spkresults.AUC_CS_last200';
correlation.ephys_AUC_CSperiod_CS_CR_last200 = Spkresults.AUC_CS_CR_last200';
correlation.ephys_AUC_CSperiod_CS_normal_last200 = Spkresults.AUC_CS_normal_last200';
correlation.ephys_AUC_CSperiod_CS_SEO_last200 = Spkresults.AUC_CS_SEO_last200';

correlation.ephys_AUC_CSperiod_CS_last100 = Spkresults.AUC_CS_last100';
correlation.ephys_AUC_CSperiod_CS_CR_last100 = Spkresults.AUC_CS_CR_last100';
correlation.ephys_AUC_CSperiod_CS_normal_last100 = Spkresults.AUC_CS_normal_last100';
correlation.ephys_AUC_CSperiod_CS_SEO_last100 = Spkresults.AUC_CS_SEO_last100';

correlation.ephys_AUC_CSperiod_CS_last50 = Spkresults.AUC_CS_last50';
correlation.ephys_AUC_CSperiod_CS_CR_last50 = Spkresults.AUC_CS_CR_last50';
correlation.ephys_AUC_CSperiod_CS_normal_last50 = Spkresults.AUC_CS_normal_last50';
correlation.ephys_AUC_CSperiod_CS_SEO_last50 = Spkresults.AUC_CS_SEO_last50';

correlation.ephys_amp_USperiod_US = Spkresults.amp_US';
correlation.ephys_amp_USperiod_USonly = Spkresults.amp_USonly';
correlation.ephys_amp_USperiod_US_CR = Spkresults.amp_US_CR';
correlation.ephys_amp_USperiod_US_normal = Spkresults.amp_US_normal';
correlation.ephys_amp_USperiod_US_SEO = Spkresults.amp_US_SEO';

correlation.ephys_AUC_USperiod_US = Spkresults.AUC_US';
correlation.ephys_AUC_USperiod_USonly = Spkresults.AUC_USonly';
correlation.ephys_AUC_USperiod_US_CR = Spkresults.AUC_US_CR';
correlation.ephys_AUC_USperiod_US_normal = Spkresults.AUC_US_normal';
correlation.ephys_AUC_USperiod_US_SEO = Spkresults.AUC_US_SEO';

% normalize to the maximum (activated cells)
correlation.ephys_amp_CSperiod_CS_normMax = correlation.ephys_amp_CSperiod_CS/nanmax(correlation.ephys_amp_CSperiod_CS);
correlation.ephys_amp_CSperiod_CS_CR_normMax = correlation.ephys_amp_CSperiod_CS_CR/nanmax(correlation.ephys_amp_CSperiod_CS_CR);
correlation.ephys_amp_CSperiod_CS_normal_normMax = correlation.ephys_amp_CSperiod_CS_normal/nanmax(correlation.ephys_amp_CSperiod_CS_normal);
correlation.ephys_amp_CSperiod_CS_SEO_normMax = correlation.ephys_amp_CSperiod_CS_SEO/nanmax(correlation.ephys_amp_CSperiod_CS_SEO);

correlation.ephys_AUC_CSperiod_CS_last200_normMax = correlation.ephys_AUC_CSperiod_CS_last200/nanmax(correlation.ephys_AUC_CSperiod_CS_last200);
correlation.ephys_AUC_CSperiod_CS_CR_last200_normMax = correlation.ephys_AUC_CSperiod_CS_CR_last200/nanmax(correlation.ephys_AUC_CSperiod_CS_CR_last200);
correlation.ephys_AUC_CSperiod_CS_normal_last200_normMax = correlation.ephys_AUC_CSperiod_CS_normal_last200/nanmax(correlation.ephys_AUC_CSperiod_CS_normal_last200);
correlation.ephys_AUC_CSperiod_CS_SEO_last200_normMax = correlation.ephys_AUC_CSperiod_CS_SEO_last200/nanmax(correlation.ephys_AUC_CSperiod_CS_SEO_last200);

correlation.ephys_AUC_CSperiod_CS_last100_normMax = correlation.ephys_AUC_CSperiod_CS_last100/nanmax(correlation.ephys_AUC_CSperiod_CS_last100);
correlation.ephys_AUC_CSperiod_CS_CR_last100_normMax = correlation.ephys_AUC_CSperiod_CS_CR_last100/nanmax(correlation.ephys_AUC_CSperiod_CS_CR_last100);
correlation.ephys_AUC_CSperiod_CS_normal_last100_normMax = correlation.ephys_AUC_CSperiod_CS_normal_last100/nanmax(correlation.ephys_AUC_CSperiod_CS_normal_last100);
correlation.ephys_AUC_CSperiod_CS_SEO_last100_normMax = correlation.ephys_AUC_CSperiod_CS_SEO_last100/nanmax(correlation.ephys_AUC_CSperiod_CS_SEO_last100);

correlation.ephys_AUC_CSperiod_CS_last50_normMax = correlation.ephys_AUC_CSperiod_CS_last50/nanmax(correlation.ephys_AUC_CSperiod_CS_last50);
correlation.ephys_AUC_CSperiod_CS_CR_last50_normMax = correlation.ephys_AUC_CSperiod_CS_CR_last50/nanmax(correlation.ephys_AUC_CSperiod_CS_CR_last50);
correlation.ephys_AUC_CSperiod_CS_normal_last50_normMax = correlation.ephys_AUC_CSperiod_CS_normal_last50/nanmax(correlation.ephys_AUC_CSperiod_CS_normal_last50);
correlation.ephys_AUC_CSperiod_CS_SEO_last50_normMax = correlation.ephys_AUC_CSperiod_CS_SEO_last50/nanmax(correlation.ephys_AUC_CSperiod_CS_SEO_last50);

correlation.ephys_amp_USperiod_US_normMax = correlation.ephys_amp_USperiod_US/nanmax(correlation.ephys_amp_USperiod_US);
correlation.ephys_amp_USperiod_USonly_normMax = correlation.ephys_amp_USperiod_USonly/nanmax(correlation.ephys_amp_USperiod_USonly);
correlation.ephys_amp_USperiod_US_CR_normMax = correlation.ephys_amp_USperiod_US_CR/nanmax(correlation.ephys_amp_USperiod_US_CR);
correlation.ephys_amp_USperiod_US_normal_normMax = correlation.ephys_amp_USperiod_US_normal/nanmax(correlation.ephys_amp_USperiod_US_normal);
correlation.ephys_amp_USperiod_US_SEO_normMax = correlation.ephys_amp_USperiod_US_SEO/nanmax(correlation.ephys_amp_USperiod_US_SEO);

correlation.ephys_AUC_USperiod_US_normMax = correlation.ephys_AUC_USperiod_US/nanmax(correlation.ephys_AUC_USperiod_US);
correlation.ephys_AUC_USperiod_USonly_normMax = correlation.ephys_AUC_USperiod_USonly/nanmax(correlation.ephys_AUC_USperiod_USonly);
correlation.ephys_AUC_USperiod_US_CR_normMax = correlation.ephys_AUC_USperiod_US_CR/nanmax(correlation.ephys_AUC_USperiod_US_CR);
correlation.ephys_AUC_USperiod_US_normal_normMax = correlation.ephys_AUC_USperiod_US_normal/nanmax(correlation.ephys_AUC_USperiod_US_normal);
correlation.ephys_AUC_USperiod_US_SEO_normMax = correlation.ephys_AUC_USperiod_US_SEO/nanmax(correlation.ephys_AUC_USperiod_US_SEO);


% normalize to the minimum (suppressed cells)
correlation.ephys_amp_CSperiod_CS_normMin = correlation.ephys_amp_CSperiod_CS/nanmin(correlation.ephys_amp_CSperiod_CS);
correlation.ephys_amp_CSperiod_CS_CR_normMin = correlation.ephys_amp_CSperiod_CS_CR/nanmin(correlation.ephys_amp_CSperiod_CS_CR);
correlation.ephys_amp_CSperiod_CS_normal_normMin = correlation.ephys_amp_CSperiod_CS_normal/nanmin(correlation.ephys_amp_CSperiod_CS_normal);
correlation.ephys_amp_CSperiod_CS_SEO_normMin = correlation.ephys_amp_CSperiod_CS_SEO/nanmin(correlation.ephys_amp_CSperiod_CS_SEO);

correlation.ephys_AUC_CSperiod_CS_last200_normMin = correlation.ephys_AUC_CSperiod_CS_last200/nanmin(correlation.ephys_AUC_CSperiod_CS_last200);
correlation.ephys_AUC_CSperiod_CS_CR_last200_normMin = correlation.ephys_AUC_CSperiod_CS_CR_last200/nanmin(correlation.ephys_AUC_CSperiod_CS_CR_last200);
correlation.ephys_AUC_CSperiod_CS_normal_last200_normMin = correlation.ephys_AUC_CSperiod_CS_normal_last200/nanmin(correlation.ephys_AUC_CSperiod_CS_normal_last200);
correlation.ephys_AUC_CSperiod_CS_SEO_last200_normMin = correlation.ephys_AUC_CSperiod_CS_SEO_last200/nanmin(correlation.ephys_AUC_CSperiod_CS_SEO_last200);

correlation.ephys_AUC_CSperiod_CS_last100_normMin = correlation.ephys_AUC_CSperiod_CS_last100/nanmin(correlation.ephys_AUC_CSperiod_CS_last100);
correlation.ephys_AUC_CSperiod_CS_CR_last100_normMin = correlation.ephys_AUC_CSperiod_CS_CR_last100/nanmin(correlation.ephys_AUC_CSperiod_CS_CR_last100);
correlation.ephys_AUC_CSperiod_CS_normal_last100_normMin = correlation.ephys_AUC_CSperiod_CS_normal_last100/nanmin(correlation.ephys_AUC_CSperiod_CS_normal_last100);
correlation.ephys_AUC_CSperiod_CS_SEO_last100_normMin = correlation.ephys_AUC_CSperiod_CS_SEO_last100/nanmin(correlation.ephys_AUC_CSperiod_CS_SEO_last100);

correlation.ephys_AUC_CSperiod_CS_last50_normMin = correlation.ephys_AUC_CSperiod_CS_last50/nanmin(correlation.ephys_AUC_CSperiod_CS_last50);
correlation.ephys_AUC_CSperiod_CS_CR_last50_normMin = correlation.ephys_AUC_CSperiod_CS_CR_last50/nanmin(correlation.ephys_AUC_CSperiod_CS_CR_last50);
correlation.ephys_AUC_CSperiod_CS_normal_last50_normMin = correlation.ephys_AUC_CSperiod_CS_normal_last50/nanmin(correlation.ephys_AUC_CSperiod_CS_normal_last50);
correlation.ephys_AUC_CSperiod_CS_SEO_last50_normMin = correlation.ephys_AUC_CSperiod_CS_SEO_last50/nanmin(correlation.ephys_AUC_CSperiod_CS_SEO_last50);

correlation.ephys_amp_USperiod_US_normMin = correlation.ephys_amp_USperiod_US/nanmin(correlation.ephys_amp_USperiod_US);
correlation.ephys_amp_USperiod_USonly_normMin = correlation.ephys_amp_USperiod_USonly/nanmin(correlation.ephys_amp_USperiod_USonly);
correlation.ephys_amp_USperiod_US_CR_normMin = correlation.ephys_amp_USperiod_US_CR/nanmin(correlation.ephys_amp_USperiod_US_CR);
correlation.ephys_amp_USperiod_US_normal_normMin = correlation.ephys_amp_USperiod_US_normal/nanmin(correlation.ephys_amp_USperiod_US_normal);
correlation.ephys_amp_USperiod_US_SEO_normMin = correlation.ephys_amp_USperiod_US_SEO/nanmin(correlation.ephys_amp_USperiod_US_SEO);

correlation.ephys_AUC_USperiod_US_normMin = correlation.ephys_AUC_USperiod_US/nanmin(correlation.ephys_AUC_USperiod_US);
correlation.ephys_AUC_USperiod_USonly_normMin = correlation.ephys_AUC_USperiod_USonly/nanmin(correlation.ephys_AUC_USperiod_USonly);
correlation.ephys_AUC_USperiod_US_CR_normMin = correlation.ephys_AUC_USperiod_US_CR/nanmin(correlation.ephys_AUC_USperiod_US_CR);
correlation.ephys_AUC_USperiod_US_normal_normMin = correlation.ephys_AUC_USperiod_US_normal/nanmin(correlation.ephys_AUC_USperiod_US_normal);
correlation.ephys_AUC_USperiod_US_SEO_normMin = correlation.ephys_AUC_USperiod_US_SEO/nanmin(correlation.ephys_AUC_USperiod_US_SEO);

%% Min norm behav
correlation.behav_amp_behav_CSperiod_CSonly_normMin = correlation.behav_amp_behav_CSperiod_CSonly/nanmin(correlation.behav_amp_behav_CSperiod_CSonly);
correlation.behav_amp_behav_CSperiod_paired_normMin = correlation.behav_amp_behav_CSperiod_paired/nanmin(correlation.behav_amp_behav_CSperiod_paired);
correlation.behav_amp_behav_CSperiod_CSonly_CR_normMin = correlation.behav_amp_behav_CSperiod_CSonly_CR/nanmin(correlation.behav_amp_behav_CSperiod_CSonly_CR);
correlation.behav_amp_behav_CSperiod_paired_CR_normMin = correlation.behav_amp_behav_CSperiod_paired_CR/nanmin(correlation.behav_amp_behav_CSperiod_paired_CR);
correlation.behav_amp_behav_CSperiod_CSonly_SEO_normMin = correlation.behav_amp_behav_CSperiod_CSonly_SEO/nanmin(correlation.behav_amp_behav_CSperiod_CSonly_SEO);
correlation.behav_amp_behav_CSperiod_paired_SEO_normMin = correlation.behav_amp_behav_CSperiod_paired_SEO/nanmin(correlation.behav_amp_behav_CSperiod_paired_SEO);
correlation.behav_amp_behav_CSperiod_CSonly_normal_normMin = correlation.behav_amp_behav_CSperiod_CSonly_normal/nanmin(correlation.behav_amp_behav_CSperiod_CSonly_normal);
correlation.behav_amp_behav_CSperiod_paired_normal_normMin = correlation.behav_amp_behav_CSperiod_paired/nanmin(correlation.behav_amp_behav_CSperiod_paired);
correlation.behav_amp_behav_CSperiod_CStrials_normMin = correlation.behav_amp_behav_CSperiod_CStrials/nanmin(correlation.behav_amp_behav_CSperiod_CStrials);



cd('[path]\correlation')
savename = sprintf('Results_correlation-behav+ephys_%.f_%s',jj,Param.cellID);
%     save(savename,'behav','OnsetAnalysis');
save(savename,'correlation');
