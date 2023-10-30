%% Calculate statistics based on the behavioral data
% Calculate statistics based on the behavioral data and write to excel.
% (c) R. Broersen, Erasmus MC, 2023


% statistics if there are paired trials
if sum(Eyeblink_signal.GoTr_IDstim==3)>0
    S.BlinkRange_paired = [nanmean(R.trial_paired_range) nanstd(R.trial_paired_range)]; % puff-induced blink on trial basis
    S.N_BlinkRange_paired = sum(isfinite(R.trial_paired_range));

    % Time of HP paired
    S.HP_x_paired = [nanmean(R.HP_x_paired) nanstd(R.HP_x_paired)];
    % AUC paired
    S.AUC_paired = [nanmean(R.AUC_paired) nanstd(R.AUC_paired)];
    % Amp Time X paired
    S.ampTimeX_paired = [nanmean(R.ampTimeX_paired) nanstd(R.ampTimeX_paired)];

    %CR data
    S.CRperc_paired = sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1)/(sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==0)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4));
    % First column = N CRs, second column = N total paired (normal + CR + SEO)
    S.N_CRperc_paired = [sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1) (sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==0)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4))];

    S.CRamp_paired = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==1,2)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==1,2))]; % CR amplitude as percentage of avg US amp
    % N trials used to determine amp
    S.N_CRamp_paired = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==1,2)));

    S.CRonset_paired = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==1,3)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==1,3))]; % CR onset
    % N trials used to determine CR onset
    S.N_CRonset_paired = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==1,3)));

    S.CR_HP_x_paired = [nanmean(R.HP_x_paired(R.trial_CRs(:,1)==1)) nanstd(R.HP_x_paired(R.trial_CRs(:,1)==1))];
    % AUC paired
    S.CR_AUC_paired = [nanmean(R.AUC_paired(R.trial_CRs(:,1)==1)) nanstd(R.AUC_paired(R.trial_CRs(:,1)==1))];
    % Amp Time X paired
    S.CR_ampTimeX_paired = [nanmean(R.ampTimeX_paired(R.trial_CRs(:,1)==1)) nanstd(R.ampTimeX_paired(R.trial_CRs(:,1)==1))];

    %SEO data
    S.SEOperc_paired = sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4)/(sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==0)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4));
    % First column = N SEOs, second column = N total paired (normal + CR + SEO)
    S.N_SEOperc_paired = [sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4) (sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==0)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==1)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==3,1)==4))];

    S.SEOamp_paired = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==4,2)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==4,2))]; % SEO amplitude as percentage of avg US amp
    % N trials used to determine amp
    S.N_SEOamp_paired = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==4,2)));

    S.SEOonset_paired = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==4,3)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==4,3))]; % SEO onset
    % N trials used to determine SEO onset
    S.N_SEOonset_paired = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==4,3)));

    S.SEO_HP_x_paired = [nanmean(R.HP_x_paired(R.trial_CRs(:,1)==4)) nanstd(R.HP_x_paired(R.trial_CRs(:,1)==4))];
    % AUC paired
    S.SEO_AUC_paired = [nanmean(R.AUC_paired(R.trial_CRs(:,1)==4)) nanstd(R.AUC_paired(R.trial_CRs(:,1)==4))];
    % Amp Time X paired
    S.SEO_ampTimeX_paired = [nanmean(R.ampTimeX_paired(R.trial_CRs(:,1)==4)) nanstd(R.ampTimeX_paired(R.trial_CRs(:,1)==4))];

    paired_excel = [S.CRperc_paired(1)*100; S.CRamp_paired(1);S.CRonset_paired(1);S.CR_HP_x_paired(1);S.CR_AUC_paired(1);S.CR_ampTimeX_paired(1);S.SEOperc_paired(1)*100; S.SEOamp_paired(1);S.SEOonset_paired(1);S.SEO_HP_x_paired(1);S.SEO_AUC_paired(1);S.SEO_ampTimeX_paired(1);S.BlinkRange_paired(1);S.HP_x_paired(1);S.AUC_paired(1);S.ampTimeX_paired(1)]';

end

% statistics if there are US only trials
if sum(Eyeblink_signal.GoTr_IDstim==2)>0
    S.BlinkRange_USonly = [nanmean(R.trial_USonly_range) nanstd(R.trial_USonly_range)]; % puff-induced blink on trial basis
    S.N_BlinkRange_USonly = sum(isfinite(R.trial_USonly_range));

    USonly_excel = [S.BlinkRange_USonly(1)];

end

% statistics in case of CS only trials
if sum(Eyeblink_signal.GoTr_IDstim==1)>0
    S.BlinkRange_CSonly = [nanmean(R.trial_CSonly_range) nanstd(R.trial_paired_range)]; % puff-induced blink on trial basis
    S.N_BlinkRange_CSonly = sum(isfinite(R.trial_CSonly_range));

    % Time of HP CSonly
    S.HP_x_CSonly = [nanmean(R.HP_x_CSonly) nanstd(R.HP_x_CSonly)];
    % AUC CSonly
    S.AUC_CSonly = [nanmean(R.AUC_CSonly) nanstd(R.AUC_CSonly)];
    % Amp Time X CSonly
    S.ampTimeX_CSonly = [nanmean(R.ampTimeX_CSonly) nanstd(R.ampTimeX_CSonly)];

    %CR data
    S.CRperc_CSonly = sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2)/(sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==3)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5));
    % First column = N CRs, second column = N total CSonly (normal + CR + SEO)
    S.N_CRperc_CSonly = [sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2) (sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==3)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5))];

    S.CRamp_CSonly = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==2,2)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==2,2))]; % CR amplitude as percentage of avg US amp
    % N trials used to determine amp
    S.N_CRamp_CSonly = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==2,2)));

    S.CRonset_CSonly = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==2,3)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==2,3))]; % CR onset
    % N trials used to determine CR onset
    S.N_CRonset_CSonly = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==2,3)));

    S.CR_HP_x_CSonly = [nanmean(R.HP_x_CSonly(R.trial_CRs(:,1)==2)) nanstd(R.HP_x_CSonly(R.trial_CRs(:,1)==2))];
    % AUC CSonly
    S.CR_AUC_CSonly = [nanmean(R.AUC_CSonly(R.trial_CRs(:,1)==2)) nanstd(R.AUC_CSonly(R.trial_CRs(:,1)==2))];
    % Amp Time X CSonly
    S.CR_ampTimeX_CSonly = [nanmean(R.ampTimeX_CSonly(R.trial_CRs(:,1)==2)) nanstd(R.ampTimeX_CSonly(R.trial_CRs(:,1)==2))];

    %SEO data
    S.SEOperc_CSonly = sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5)/(sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==3)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5));
    % First column = N SEOs, second column = N total CSonly (normal + CR + SEO)
    S.N_SEOperc_CSonly = [sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5) (sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==3)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==2)+sum(R.trial_CRs(Eyeblink_signal.GoTr_IDstim==1,1)==5))];

    S.SEOamp_CSonly = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==5,2)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==5,2))]; % SEO amplitude as percentage of avg US amp
    % N trials used to determine amp
    S.N_SEOamp_CSonly = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==5,2)));

    S.SEOonset_CSonly = [nanmean(R.trial_CRs(R.trial_CRs(:,1)==5,3)) nanstd(R.trial_CRs(R.trial_CRs(:,1)==5,3))]; % SEO onset
    % N trials used to determine SEO onset
    S.N_SEOonset_CSonly = sum(isfinite(R.trial_CRs(R.trial_CRs(:,1)==5,3)));

    S.SEO_HP_x_CSonly = [nanmean(R.HP_x_CSonly(R.trial_CRs(:,1)==5)) nanstd(R.HP_x_CSonly(R.trial_CRs(:,1)==5))];
    % AUC CSonly
    S.SEO_AUC_CSonly = [nanmean(R.AUC_CSonly(R.trial_CRs(:,1)==5)) nanstd(R.AUC_CSonly(R.trial_CRs(:,1)==5))];
    % Amp Time X CSonly
    S.SEO_ampTimeX_CSonly = [nanmean(R.ampTimeX_CSonly(R.trial_CRs(:,1)==5)) nanstd(R.ampTimeX_CSonly(R.trial_CRs(:,1)==5))];

    CSonly_excel = [S.CRperc_CSonly(1)*100; S.CRamp_CSonly(1);S.CRonset_CSonly(1);S.CR_HP_x_CSonly(1);S.CR_AUC_CSonly(1);S.CR_ampTimeX_CSonly(1);S.SEOperc_CSonly(1)*100; S.SEOamp_CSonly(1);S.SEOonset_CSonly(1);S.SEO_HP_x_CSonly(1);S.SEO_AUC_CSonly(1);S.SEO_ampTimeX_CSonly(1);S.BlinkRange_CSonly(1);S.HP_x_CSonly(1);S.AUC_CSonly(1);S.ampTimeX_CSonly(1)]';

end

%% Write and save excel sheet per mouse
if Param.savefile ==1
    sheetdata={};
    if sum(Eyeblink_signal.GoTr_IDstim==3)>0
        sheetdata(2,:) = {'S.CRperc_paired' 'S.CRamp_paired' 'S.CRonset_paired' 'S.CR_HP_x_paired' 'S.CR_AUC_paired' 'S.CR_ampTimeX_paired' 'S.SEOperc_paired' 'S.SEOamp_paired' 'S.SEOonset_paired' 'S.SEO_HP_x_paired' 'S.SEO_AUC_paired(1)' 'S.SEO_ampTimeX_paired' 'S.BlinkRange_paired' 'S.HP_x_paired' 'S.AUC_paired' 'S.ampTimeX_paired'};
        sheetdata(3,:) = num2cell(paired_excel)';
        sheetdata(1,1) = {'Paired trials'};
    end

    if sum(Eyeblink_signal.GoTr_IDstim==1)>0
        sheetdata(6,:) = {'S.CRperc_CSonly' 'S.CRamp_CSonly' 'S.CRonset_CSonly' 'S.CR_HP_x_CSonly' 'S.CR_AUC_CSonly' 'S.CR_ampTimeX_CSonly' 'S.SEOperc_CSonly' 'S.SEOamp_CSonly' 'S.SEOonset_CSonly' 'S.SEO_HP_x_CSonly' 'S.SEO_AUC_CSonly' 'S.SEO_ampTimeX_CSonly' 'S.BlinkRange_CSonly' 'S.HP_x_CSonly' 'S.AUC_CSonly' 'S.ampTimeX_CSonly'};
        sheetdata(7,:) = num2cell(CSonly_excel)';
        sheetdata(5,1) = {'CS only trials'};
    end

    if sum(Eyeblink_signal.GoTr_IDstim==2)>0

        sheetdata(10,:) = {'S.BlinkRange_USonly'};
        sheetdata(11,:) = num2cell(USonly_excel)';
        sheetdata(9,1) = {'US only trials'};
    end


    %% Save data

    savename = sprintf('Behavior_stats_%s_%s',Param.mouseID,Param.block);
    xlswrite(savename,sheetdata)
end









