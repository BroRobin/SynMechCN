%% Perform ROC analysis on CS/US responses
% Classify neurons based on CS and US responses. Perform ROC analysis on
% the amplitudes of Vm responses, comparing baseline and CS/US responses.
% Create summary variable.
% Adapted from script provided by Dr. S. Gharaei, ANU.
% (c) R. Broersen, Erasmus MC, 2023

classification = [];
%% CS trials - CS response
try     
    baseLine_EPSP = Spkresults.amp_CS_baseline(isnan(Spkresults.amp_CS_baseline)==0); % Baseline responses
    light_EPSP = Spkresults.amp_CS(isnan(Spkresults.amp_CS)==0); % CS-evoked responses responses

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_CS_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_CS_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_CS_trials)],[sprintf('P %.4f depression',classification.P_depression_CS_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_CStrials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_CStrials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification CS trials')
    classification.P_enhancement_CS_trials=NaN; 
    classification.P_depression_CS_trials =NaN;
end
%% CS trials - CR response
try
    baseLine_EPSP = Spkresults.amp_CS_CR_baseline(isnan(Spkresults.amp_CS_CR_baseline)==0);
    light_EPSP = Spkresults.amp_CS_CR(isnan(Spkresults.amp_CS_CR)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_CS_CR_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_CS_CR_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_CS_CR_trials)],[sprintf('P %.4f depression',classification.P_depression_CS_CR_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_CS_CR_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_CS_CR_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification CS_CR trials')
    classification.P_enhancement_CS_CR_trials = NaN;; % Find fraction of shuffled greater than observed
    classification.P_depression_CS_CR_trials = NaN;; % Find fraction of shuffled greater than observed
end

%% CS trials - normal response
try
    baseLine_EPSP = Spkresults.amp_CS_normal_baseline(isnan(Spkresults.amp_CS_normal_baseline)==0);
    light_EPSP = Spkresults.amp_CS_normal(isnan(Spkresults.amp_CS_normal)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_CS_normal_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_CS_normal_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_CS_normal_trials)],[sprintf('P %.4f depression',classification.P_depression_CS_normal_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_CS_normal_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_CS_normal_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification CS_normal trials')
    classification.P_enhancement_CS_normal_trials = NaN;
    classification.P_depression_CS_normal_trials = NaN;

end

%% CS trials - SEO response
try
    baseLine_EPSP = Spkresults.amp_CS_SEO_baseline(isnan(Spkresults.amp_CS_SEO_baseline)==0);
    light_EPSP = Spkresults.amp_CS_SEO(isnan(Spkresults.amp_CS_SEO)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_CS_SEO_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_CS_SEO_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_CS_SEO_trials)],[sprintf('P %.4f depression',classification.P_depression_CS_SEO_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_CS_SEO_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_CS_SEO_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification CS_SEO trials')
    classification.P_enhancement_CS_SEO_trials=NaN;
    classification.P_depression_CS_SEO_trials=NaN;
end

%% US trials - US response
try
    baseLine_EPSP = Spkresults.amp_US_baseline(isnan(Spkresults.amp_US_baseline)==0);
    light_EPSP = Spkresults.amp_US(isnan(Spkresults.amp_US)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_US_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_US_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_US_trials)],[sprintf('P %.4f depression',classification.P_depression_US_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_UStrials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_UStrials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification USonly trials')
    classification.P_enhancement_US_trials=NaN;
    classification.P_depression_US_trials =NaN;
end

%% US trials - paired CR
try
    baseLine_EPSP = Spkresults.amp_US_CR_baseline(isnan(Spkresults.amp_US_CR_baseline)==0);
    light_EPSP = Spkresults.amp_US_CR(isnan(Spkresults.amp_US_CR)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_US_CR_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_US_CR_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_US_CR_trials)],[sprintf('P %.4f depression',classification.P_depression_US_CR_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_US_CR_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_US_CR_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification US_CR trials')
    classification.P_enhancement_US_CR_trials=NaN;
    classification.P_depression_US_CR_trials=NaN;
end

%% US trials - paired normal
try
    baseLine_EPSP = Spkresults.amp_US_normal_baseline(isnan(Spkresults.amp_US_normal_baseline)==0);
    light_EPSP = Spkresults.amp_US_normal(isnan(Spkresults.amp_US_normal)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_US_normal_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_US_normal_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_US_normal_trials)],[sprintf('P %.4f depression',classification.P_depression_US_normal_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_US_normal_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_US_normal_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification US_normal trials')
    classification.P_enhancement_US_normal_trials=NaN;
    classification.P_depression_US_normal_trials=NaN;
end

%% US trials - paired SEO
try
    baseLine_EPSP = Spkresults.amp_US_SEO_baseline(isnan(Spkresults.amp_US_SEO_baseline)==0);
    light_EPSP = Spkresults.amp_US_SEO(isnan(Spkresults.amp_US_SEO)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_US_SEO_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_US_SEO_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_US_SEO_trials)],[sprintf('P %.4f depression',classification.P_depression_US_SEO_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_US_SEO_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_US_SEO_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification US_SEO trials')
    classification.P_enhancement_US_SEO_trials=NaN;
    classification.P_depression_US_SEO_trials=NaN;
end
%% US trials - USonly
try
    baseLine_EPSP = Spkresults.amp_USonly_baseline(isnan(Spkresults.amp_USonly_baseline)==0);
    light_EPSP = Spkresults.amp_USonly(isnan(Spkresults.amp_USonly)==0);

    [lightFA,lightHit,lightAUROC] = calcAUROC(baseLine_EPSP,light_EPSP);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([baseLine_EPSP light_EPSP]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    classification.P_enhancement_USonly_trials = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    classification.P_depression_USonly_trials = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P %.4f enhancement',classification.P_enhancement_USonly_trials)],[sprintf('P %.4f depression',classification.P_depression_USonly_trials)]);
    if Param.savefig==1
        figname = sprintf('Classification_%s_USonly_trials.fig',Param.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('Classification_%s_USonly_trials.pdf',Param.cellID);
        print('-dpdf','-vector','-loose',figname);
    end
catch
    disp('Error in classification USonly trials')
    classification.P_enhancement_USonly_trials=NaN;
    classification.P_depression_USonly_trials=NaN;
end

%% Compile excel variable
classification.excelOutput = [classification.P_enhancement_CS_trials classification.P_depression_CS_trials...
    classification.P_enhancement_CS_CR_trials classification.P_depression_CS_CR_trials...
    classification.P_enhancement_CS_normal_trials classification.P_depression_CS_normal_trials...
    classification.P_enhancement_CS_SEO_trials classification.P_depression_CS_SEO_trials...
    classification.P_enhancement_US_trials classification.P_depression_US_trials...
    classification.P_enhancement_US_CR_trials classification.P_depression_US_CR_trials...
    classification.P_enhancement_US_normal_trials classification.P_depression_US_normal_trials...
    classification.P_enhancement_US_SEO_trials classification.P_depression_US_SEO_trials...
    classification.P_enhancement_USonly_trials classification.P_depression_USonly_trials];

%% Save file
if Param.savefile==1
    Spkdata.data=[];
    savename = sprintf('Results_classification_CSandUS_%s',Param.mouseID);
    save(savename,'classification');
end
close all;

