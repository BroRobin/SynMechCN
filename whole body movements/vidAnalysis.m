%% Analysis of whole-body movements
% This script is used to analyze camera recordings from mice conditioned or
% pseudo-conditioned to quantify whole-body movements. Specifically, it
% analyses videos acquired at day 1 and day 10 of (pseudo-)conditioning.

% (c) R. Broersen, Erasmus MC, 2023

clear all; close all

for zz=1 % Define which movie to analyze
    if zz==1
        % 730 D1
        P.filepath = ['[path]\Acq\D1\' '730_D1.avi'];
        P.startFrame = 569;
        P.mouseID = '730_D1';
    elseif zz==2
        % 731 D1
        P.filepath = ['[path]\Acq\D1\' '731_D1.avi'];
        P.startFrame = 1164;
        P.mouseID = '731_D1';
    elseif zz==3
        %         732 D1
        P.filepath = ['[path]\Acq\D1\' '732_D1.avi'];
        P.startFrame = NaN;
        P.mouseID = '732_D1';
    elseif zz==4
        % 733 D1
        P.filepath = ['[path]\Acq\D1\' '733_D1.avi'];
        P.startFrame = 569;
        P.mouseID = '733_D1';
    elseif zz==5
        % 736 D1
        P.filepath = ['[path]\Acq\D1\' '736_D1.avi'];
        P.startFrame = NaN;
        P.mouseID = '736_D1';
    elseif zz==6
        % 739 D1
        P.filepath = ['[path]\Acq\D1\' '739_D1.avi'];
        P.startFrame = 605;
        P.mouseID = '739_D1';
    elseif zz==7
        % 740 D1
        P.filepath = ['[path]\Acq\D1\' '740_D1.avi'];
        P.startFrame = 970;
        P.mouseID = '740_D1';
    elseif zz==8
        % 741 D1
        P.filepath = ['[path]\Acq\D1\' '741_D1.avi'];
        P.startFrame = 603;
        P.mouseID = '741_D1';
    elseif zz==9
        % 742 D1
        P.filepath = ['[path]\Acq\D1\' '742_D1.avi'];
        P.startFrame = 798;
        P.mouseID = '742_D1';
        %
    elseif zz==10
        % 743 D1
        P.filepath = ['[path]\Acq\D1\' '743_D1.avi'];
        P.startFrame = NaN;
        P.mouseID = '743_D1';

    elseif zz==11
        % 744 D1
        P.filepath = ['[path]\Acq\D1\' '744_D1.avi'];
        P.startFrame = 555;
        P.mouseID = '744_D1';
    elseif zz==12
        % 745 D1
        P.filepath = ['[path]\Acq\D1\' '745_D1.avi'];
        P.startFrame = 926;
        P.mouseID = '745_D1';
    elseif zz==13
        % 746 D1
        P.filepath = ['[path]\Acq\D1\' '746_D1.avi'];
        P.startFrame = NaN;
        P.mouseID = '746_D1';
    elseif zz==14
        % 748 D1
        P.filepath = ['[path]\Acq\D1\' '748_D1.avi'];
        P.startFrame = 774;
        P.mouseID = '748_D1';
    elseif zz==15
        % 749 D1
        P.filepath = ['[path]\Acq\D1\' '749_D1.avi'];
        P.startFrame = NaN;
        P.mouseID = '749_D1';
    elseif zz==16
        % 750 D1
        P.filepath = ['[path]\Acq\D1\' '750_D1.avi'];
        P.startFrame = 729;
        P.mouseID = '750_D1';
    elseif zz==17
        % 751 D1
        P.filepath = ['[path]\Acq\D1\' '751_D1.avi'];
        P.startFrame = 1000;
        P.mouseID = '751_D1';

        %% Day 10
    elseif zz==18
        % 730 D10
        P.filepath = ['[path]\Acq\D10\' '730_D10.avi'];
        P.startFrame = 684;
        P.mouseID = '730_D10';
    elseif zz==19
        % 731 D9
        P.filepath = ['[path]\Acq\D9\' '731_D9.avi'];
        P.startFrame = 664;
        P.mouseID = '731_D9';
    elseif zz==20
        %         732 D10
        P.filepath = ['[path]\Acq\D10\' '732_D10.avi'];
        P.startFrame = NaN;
        P.mouseID = '732_D10';
    elseif zz==21
        % 733 D10
        P.filepath = ['[path]\Acq\D10\' '733_D10.avi'];
        P.startFrame = 504;
        P.mouseID = '733_D10';
    elseif zz==22
        % 736 D10
        P.filepath = ['[path]\Acq\D10\' '736_D10.avi'];
        P.startFrame = NaN;
        P.mouseID = '736_D10';
    elseif zz==23
        % 739 D10
        P.filepath = ['[path]\Acq\D10\' '739_D10.avi'];
        P.startFrame = 514;
        P.mouseID = '739_D10';
    elseif zz==24
        % 740 D10
        P.filepath = ['[path]\Acq\D10\' '740_D10.avi'];
        P.startFrame = 851;
        P.mouseID = '740_D10';
    elseif zz==25
        % 741 D10
        P.filepath = ['[path]\Acq\D10\' '741_D10.avi'];
        P.startFrame = 603;
        P.mouseID = '741_D10';
    elseif zz==26
        % 742 D10
        P.filepath = ['[path]\Acq\D10\' '742_D10.avi'];
        P.startFrame = 800;
        P.mouseID = '742_D10';
        %
    elseif zz==27
        % 743 D10
        P.filepath = ['[path]\Acq\D10\' '743_D10.avi'];
        P.startFrame = NaN;
        P.mouseID = '743_D10';

    elseif zz==28
        % 744 D9
        P.filepath = ['[path]\Acq\D9\' '744_D9.avi'];
        P.startFrame = 463;
        P.mouseID = '744_D9';
    elseif zz==29
        % 745 D10
        P.filepath = ['[path]\Acq\D10\' '745_D10.avi'];
        P.startFrame = 716;
        P.mouseID = '745_D10';
    elseif zz==30
        % 746 D10
        P.filepath = ['[path]\Acq\D10\' '746_D10.avi'];
        P.startFrame = NaN;
        P.mouseID = '746_D10';
    elseif zz==31
        % 748 D10
        P.filepath = ['[path]\Acq\D10\' '748_D10.avi'];
        P.startFrame = 563;
        P.mouseID = '748_D10';
    elseif zz==32
        % 749 D10
        P.filepath = ['[path]\Acq\D10\' '749_D10(1).avi'];
        P.startFrame = NaN;
        P.mouseID = '749_D10';
    elseif zz==33
        % 750 D10
        P.filepath = ['[path]\Acq\D10\' '750_D10.avi'];
        P.startFrame = 729;
        P.mouseID = '750_D10';
    elseif zz==34
        % 751 D10
        P.filepath = ['[path]\Acq\D10\' '751_D10.avi'];
        P.startFrame = 988;
        P.mouseID = '751_D10';


    end

    % Play the movie
    implay(P.filepath);

    %% Load the movie per 10,000 frames
    P.vidObj = VideoReader(P.filepath);
    P.nFrames=P.vidObj.NumberOfFrames;
    P.framerate = P.vidObj.FrameRate;
    P.M=P.vidObj.Height; % no of rows
    P.N=P.vidObj.Width; % no of columns
    P.nLoadFrames = [10000];
    P.nLoadRounds = ceil(P.nFrames/P.nLoadFrames);
    idx_sum = [];
    idx_CS_sum = [];

    %     for ii = 2:P.nLoadRounds
    for ii = 1:P.nLoadRounds
        ii
        video=zeros(P.M,P.N,P.nLoadFrames,'uint8'); % creating a video 3d matrix
        if ii==1
            P.loadFrames = [1 ii*P.nLoadFrames];
        elseif ii>1 && ii<P.nLoadRounds
            P.loadFrames = [ii*P.nLoadFrames-(P.nLoadFrames-1) ii*P.nLoadFrames];
        elseif ii==P.nLoadRounds
            P.loadFrames = [ii*P.nLoadFrames-(P.nLoadFrames-1) P.nFrames];
        end
        counter=0;
        for k=P.loadFrames(1):P.loadFrames(2)
            k
            counter=counter+1;
            im= read(P.vidObj,k);
            im=im(:,:,1);           % all three layers will have same image
            video(:,:,counter)=im;
            if k ==1 && ii==1
                figure; imagesc(im)
                CS_coords = imfreehand(); %Lets me freehand draw to select the certain pixels I want
                pause;
                maskImg = CS_coords.createMask;
            end

            % Calculate the sum of the CS ROI
            idx_CS_sum = [idx_CS_sum; sum(im(maskImg))];

        end

        % Calculate the difference of the whole video
        idx = diff(video,1,3);
        idx_sum = [idx_sum; NaN; permute(sum(sum(idx)),[3,1,2])];
    end
    idx_sum = idx_sum(1:length(idx_CS_sum));

    R.rawMovement = idx_sum;
    R.rawCS = idx_CS_sum;

    figure; hold on; plot(R.rawMovement);
    figure; hold on; plot(R.rawCS);

    %% Filter the trace
    idx_CS_sum_norm_filt = gfilt(idx_CS_sum,P.vidObj.FrameRate,0.0075);
    figure; hold on; plot(idx_CS_sum,'k'); plot(idx_CS_sum_norm_filt,'r');

    %% Convert timings to timestamps
    CS_LED_idx = find(normMov>(6.48*10^5));
    idx_CS_sum_diff = diff(CS_LED_idx);
    CS_LED_idx_diff = find(idx_CS_sum_diff>200);
    R.rawCS_diff = diff(R.rawCS);

    %% Automatically detect the timings
    P.trial_timestamps = [];
    for ii=1:length(CS_LED_idx_diff)+1
        if ii==1
            P.trial_timestamps = CS_LED_idx(1);
        elseif ii>1
            P.trial_timestamps(ii) = CS_LED_idx(CS_LED_idx_diff(ii-1)+1);
        end
    end
    P.trial_timestamps = [P.startFrame P.trial_timestamps];

    % Conditioned
    P.trial_timestamps_USonly = P.trial_timestamps(1);
    idx = [1:220]; idx([1 12:11:220])=[];
    P.trial_timestamps_paired = P.trial_timestamps(idx)';
    idx = [12:11:length(P.trial_timestamps)];
    P.trial_timestamps_CSonly = P.trial_timestamps(idx)';

    %
    %     figure; hold on; plot(R.rawCS,'r'); plot(P.trial_timestamps,repmat(nanmean(R.rawCS),length(P.trial_timestamps)),'g*');
    %     pause;
    %     P.CStrial_idx = [2:220];
    %     P.USonly_idx = [1];
    %     P.pairedtrial_idx = [1:220]; P.pairedtrial_idx([1 12:11:220])=[];
    %     P.UStrial_idx = [1:220]; P.UStrial_idx(12:11:220)=[];
    %
    % % Cut the movement trace into epochs
    %
    %     R.CStrial_mov = [];
    %     figure; hold on;
    %     %CS trials (paired+CSonly)
    %     for ii = 1:size(P.CStrial_idx,2)
    %         R.CStrial_mov(ii,:)= R.normMov(P.trial_timestamps(P.CStrial_idx(ii)):(P.trial_timestamps(P.CStrial_idx(ii))+round(2*P.framerate)));
    %         R.CStrial_mov(ii,:)= R.CStrial_mov(ii,:)-nanmean(R.CStrial_mov(ii,1:(0.5*P.framerate)));
    %         plot(R.CStrial_mov(ii,:))
    %         % pause;
    %     end
    %     plot(nanmean(R.CStrial_mov),'k','LineWidth',2);
    %     line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     title('CS trials')
    %
    %     R.UStrial_mov = [];
    %     figure; hold on;
    %     %CS trials (paired+CSonly)
    %     for ii = 1:size(P.UStrial_idx,2)
    %         R.UStrial_mov(ii,:)= R.normMov(P.trial_timestamps(P.UStrial_idx(ii)):(P.trial_timestamps(P.UStrial_idx(ii))+round(2*P.framerate)));
    %         R.UStrial_mov(ii,:)= R.UStrial_mov(ii,:)-nanmean(R.UStrial_mov(ii,1:(0.5*P.framerate)));
    %         plot(R.UStrial_mov(ii,:))
    %         % pause;
    %     end
    %     plot(nanmean(R.UStrial_mov),'k','LineWidth',2);
    %     line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     title('US trials')
    %
    %     R.pairedtrial_mov = [];
    %     figure; hold on;
    %     %CS trials (paired+CSonly)
    %     for ii = 1:size(P.pairedtrial_idx,2)
    %         R.pairedtrial_mov(ii,:)= R.normMov(P.trial_timestamps(P.pairedtrial_idx(ii)):(P.trial_timestamps(P.pairedtrial_idx(ii))+round(2*P.framerate)));
    %         R.pairedtrial_mov(ii,:)= R.pairedtrial_mov(ii,:)-nanmean(R.pairedtrial_mov(ii,1:(0.5*P.framerate)));
    %         plot(R.pairedtrial_mov(ii,:))
    %         % pause;
    %     end
    %     plot(nanmean(R.pairedtrial_mov),'k','LineWidth',2);
    %     line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     title('paired trials')
    %
    %     R.USonly_mov = [];
    %     figure; hold on;
    %     %CS trials (paired+CSonly)
    %     for ii = 1:size(P.USonly_idx,2)
    %         R.USonly_mov(ii,:)= R.normMov(P.trial_timestamps(P.USonly_idx(ii)):(P.trial_timestamps(P.USonly_idx(ii))+round(2*P.framerate)));
    %         R.USonly_mov(ii,:)= R.USonly_mov(ii,:)-nanmean(R.USonly_mov(ii,1:(0.5*P.framerate)));
    %         plot(R.USonly_mov(ii,:))
    %         % pause;
    %     end
    %     plot(nanmean(R.USonly_mov),'k','LineWidth',2);
    %     line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     title('US only trials')

    %% Manually identify CS times

    P.trial_timestamps_paired = [];

    figure; ax(1)=subplot(2,1,1);hold on;  plot(R.rawCS,'r'); ax(2)=subplot(2,1,2); hold on; plot(R.rawCS_diff,'b'); linkaxes(ax,'x');
    for az=1:250
        zoom on;
        %         waitfor(gcf, 'CurrentCharacter', char(13))
        pause;
        zoom reset;
        zoom off;
        for aq = 1:5
            [X Y] = ginput(2)
            [Y_max X_max] = max(R.rawCS_diff(X(1):(X(2))))
            X_max = X_max+X(1)
            subplot(2,1,2); plot(X_max,Y_max,'g*');
            %  pause;
            P.trial_timestamps_paired = [P.trial_timestamps_paired; X_max];
        end
    end


    plot(P.trial_timestamps_paired,repmat(0.6*10^4,[1 length(P.trial_timestamps_paired)]),'k*')

    P.trial_timestamps_CSonly = [];
    for az=1:250
        zoom on;
        %         waitfor(gcf, 'CurrentCharacter', char(13))
        pause;
        zoom reset;
        zoom off;
        for aq = 1:2
            [X Y] = ginput(2)
            [Y_max X_max] = max(R.rawCS_diff(X(1):(X(2))))
            X_max = X_max+X(1)
            plot(X_max,Y_max,'b*');
            %  pause;
            P.trial_timestamps_CSonly = [P.trial_timestamps_CSonly; X_max];
        end
    end

    plot(P.trial_timestamps_CSonly,repmat(15000,[1 length(P.trial_timestamps_CSonly)]),'k*')
    plot(P.trial_timestamps_CSonly,repmat(15000,[1 length(P.trial_timestamps_CSonly)]),'r*')



    P.trial_timestamps_USonly = P.startFrame-round(0.75*P.framerate);
    % P.trial_timestamps_USonly = [];
    P.trial_timestamps_paired = P.trial_timestamps_paired-round(0.5*P.framerate);
    P.trial_timestamps_CSonly = P.trial_timestamps_CSonly-round(0.5*P.framerate);

    %% Normalize the movement trace to the median and maximum
    R.normMov = R.rawMovement-nanmedian(1:(2000*P.framerate));
    R.normMov = R.normMov/nanmax(R.normMov(1:(2000*P.framerate)));

    %% Cut the movement trace into epochs

    R.pairedtrial_mov = [];
    figure; hold on;
    %CS trials (paired)
    for ii = 1:size(P.trial_timestamps_paired,1)
        try
            R.pairedtrial_mov(ii,:)= R.normMov(P.trial_timestamps_paired(ii):P.trial_timestamps_paired(ii)+round(2*P.framerate));
            R.pairedtrial_mov(ii,:)= R.pairedtrial_mov(ii,:)-nanmean(R.pairedtrial_mov(ii,1:(0.5*P.framerate)));
            plot(R.pairedtrial_mov(ii,:))
        catch
            R.pairedtrial_mov(ii,:)=NaN;
        end
        % pause;
    end

    plot(nanmean(R.pairedtrial_mov),'k','LineWidth',2);
    plot(nanmedian(R.pairedtrial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    title('Paired trials')

    R.CSonlytrial_mov = [];
    figure; hold on;
    %CS trials (CSonly)
    %     for ii = 1:size(P.trial_timestamps_CSonly,2)
    for ii = 1:size(P.trial_timestamps_CSonly,1)
        try
            R.CSonlytrial_mov(ii,:)= R.normMov(P.trial_timestamps_CSonly(ii):P.trial_timestamps_CSonly(ii)+round(2*P.framerate));
            R.CSonlytrial_mov(ii,:)= R.CSonlytrial_mov(ii,:)-nanmean(R.CSonlytrial_mov(ii,1:(0.5*P.framerate)));
            plot(R.CSonlytrial_mov(ii,:))
        catch
            R.CSonlytrial_mov(ii,:)=NaN;
        end

        % pause;
    end

    plot(nanmean(R.CSonlytrial_mov),'k','LineWidth',2);
    plot(nanmedian(R.CSonlytrial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    title('CSonly trials')

    R.USonlytrial_mov = [];
    figure; hold on;
    %US trials (USonly)

    for ii = 1:size(P.trial_timestamps_USonly,1)
        try
            R.USonlytrial_mov(ii,:)= R.normMov(P.trial_timestamps_USonly(ii):P.trial_timestamps_USonly(ii)+round(2*P.framerate));
            R.USonlytrial_mov(ii,:)= R.USonlytrial_mov(ii,:)-nanmean(R.USonlytrial_mov(ii,1:(0.5*P.framerate)));
            plot(R.USonlytrial_mov(ii,:))
            % pause;
        catch
            R.USonlytrial_mov(ii,:)=NaN;
        end
    end

    plot(nanmean(R.USonlytrial_mov),'k','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    title('USonly trials')

    R.CStrial_mov = [R.pairedtrial_mov; R.CSonlytrial_mov];
    try
        R.UStrial_mov = [R.pairedtrial_mov; R.USonlytrial_mov];
    catch
        R.UStrial_mov = [R.pairedtrial_mov];
    end

    %% Calculate the averages

    S.CStrial_avg = nanmean(R.CStrial_mov);
    S.CSonlytrial_avg = nanmean(R.CSonlytrial_mov);
    S.UStrial_avg = nanmean(R.UStrial_mov);
    S.pairedtrial_avg = nanmean(R.pairedtrial_mov);
    S.USonly_avg = R.USonlytrial_mov;

    S.CStrial_sd = nanstd(R.CStrial_mov);
    S.UStrial_sd = nanstd(R.UStrial_mov);
    S.CSonlytrial_sd = nanstd(R.CSonlytrial_mov);
    S.pairedtrial_sd = nanstd(R.pairedtrial_mov);


    S.CStrial_sem = nanstd(R.CStrial_mov)/sqrt(size(R.CStrial_mov,1));
    S.UStrial_sem = nanstd(R.UStrial_mov)/sqrt(size(R.UStrial_mov,1));
    S.pairedtrial_sem = nanstd(R.pairedtrial_mov)/sqrt(size(R.pairedtrial_mov,1));
    S.CSonlytrial_sem = nanstd(R.CSonlytrial_mov)/sqrt(size(R.CSonlytrial_mov,1));

    S.CStrial_CSamp =[];
    S.CStrial_CSAUC =[];
    for ii=1:size(R.CStrial_mov,1)
        S.CStrial_CSamp(ii) = nanmax(R.CStrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
        S.CStrial_CSAUC(ii) = nansum(R.CStrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    end
    S.CStrial_CSamp_avg = nanmean(S.CStrial_CSamp);
    S.CStrial_CSAUC_avg = nanmean(S.CStrial_CSAUC);

    S.CSonlytrial_CSamp =[];
    S.CSonlytrial_CSAUC =[];
    for ii=1:size(R.CSonlytrial_mov,1)
        S.CSonlytrial_CSamp(ii) = nanmax(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
        S.CSonlytrial_CSAUC(ii) = nansum(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    end
    S.CSonlytrial_CSamp_avg = nanmean(S.CSonlytrial_CSamp);
    S.CSonlytrial_CSAUC_avg = nanmean(S.CSonlytrial_CSAUC);

    S.CSonlytrial_CSamp_longwindow =[];
    S.CSonlytrial_CSAUC_longwindow =[];
    for ii=1:size(R.CSonlytrial_mov,1)
        S.CSonlytrial_CSamp_longwindow(ii) = nanmax(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(1*P.framerate)));
        S.CSonlytrial_CSAUC_longwindow(ii) = nansum(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(1*P.framerate)));
    end
    S.CSonlytrial_CSamp_longwindow_avg = nanmean(S.CSonlytrial_CSamp_longwindow);
    S.CSonlytrial_CSAUC_longwindow_avg = nanmean(S.CSonlytrial_CSAUC_longwindow);

    S.UStrial_USamp =[];
    S.UStrial_USAUC =[];
    for ii=1:size(R.UStrial_mov,1)
        S.UStrial_USamp(ii) = nanmax(R.UStrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
        S.UStrial_USAUC(ii) = nansum(R.UStrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
    end
    S.UStrial_USamp_avg = nanmean(S.UStrial_USamp);
    S.UStrial_USAUC_avg = nanmean(S.UStrial_USAUC);
    %         S.UStrial_USamp_avg = NaN;
    %     S.UStrial_USAUC_avg = NaN;

    S.pairedtrial_CSamp =[];
    S.pairedtrial_CSAUC =[];
    for ii=1:size(R.pairedtrial_mov,1)
        S.pairedtrial_CSamp(ii) = nanmax(R.pairedtrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
        S.pairedtrial_CSAUC(ii) = nansum(R.pairedtrial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    end
    S.pairedtrial_CSamp_avg = nanmean(S.pairedtrial_CSamp);
    S.pairedtrial_CSAUC_avg = nanmean(S.pairedtrial_CSAUC);

    S.pairedtrial_USamp =[];
    S.pairedtrial_USAUC =[];
    for ii=1:size(R.pairedtrial_mov,1)
        S.pairedtrial_USamp(ii) = nanmax(R.pairedtrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
        S.pairedtrial_USAUC(ii) = nansum(R.pairedtrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
    end
    S.pairedtrial_USamp_avg = nanmean(S.pairedtrial_USamp);
    S.pairedtrial_USAUC_avg = nanmean(S.pairedtrial_USAUC);


    S.USonly_USamp =[];
    S.USonly_USAUC =[];
    try
        for ii=1:size(R.USonlytrial_mov,1)
            S.USonly_USamp(ii) = nanmax(R.USonlytrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
            S.USonly_USAUC(ii) = nansum(R.USonlytrial_mov(ii,round(0.75*P.framerate):round(1.25*P.framerate)));
        end
        S.USonly_USamp_avg = nanmean(S.USonly_USamp);
        S.USonly_USAUC_avg = nanmean(S.USonly_USAUC);
    end

    S.excel = [S.USonly_USamp S.USonly_USAUC S.CStrial_CSamp_avg S.CStrial_CSAUC_avg S.UStrial_USamp_avg S.UStrial_USAUC_avg S.CSonlytrial_CSamp_avg S.CSonlytrial_CSAUC_avg S.CSonlytrial_CSamp_longwindow_avg S.CSonlytrial_CSAUC_longwindow_avg];
    %% Save the data

    P.savename = sprintf('%s_data.mat',P.mouseID);
    save(P.savename,'P','S','R',"-v7.3");

end

%% Create examples for figure
xaxis=linspace((1/60),2,121)-0.5;

% CS only cond

% cd('[path]\Acq\D1')
% load('745_D1_data.mat'); figure; hold on; plot(xaxis,R.CSonlytrial_mov(4,:),'k')
% cd('[path]\Acq\D10')
% load('745_D10_data.mat'); plot(xaxis,R.CSonlytrial_mov(7,:),'g')

cd('[path]\Acq\D1')
load('745_D1_data.mat'); figure; hold on; plot(xaxis,S.CSonlytrial_avg,'k'); plot(xaxis,S.CSonlytrial_avg+S.CSonlytrial_sem,'k'); plot(xaxis,S.CSonlytrial_avg-S.CSonlytrial_sem,'k')

cd('[path]\Acq\D10')
load('745_D10_data.mat'); plot(xaxis,S.CSonlytrial_avg,'g');plot(xaxis,S.CSonlytrial_avg+S.CSonlytrial_sem,'g'); plot(xaxis,S.CSonlytrial_avg-S.CSonlytrial_sem,'g')

ylabel('Movement index'); xlabel('Time (s)')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlim([-0.15 1]); ylim([-0.04 0.1])

cd('[path]')
figname = sprintf('745_cond_CSonlyresponse.fig')
saveas(gcf,figname,'fig');
figname = sprintf('745_cond_CSonlyresponse.pdf')
print('-dpdf','-vector','-loose',figname)

% paired cond
cd('[path]\Acq\D1')
load('745_D1_data.mat'); figure; hold on; plot(xaxis,S.pairedtrial_avg,'k'); plot(xaxis,S.pairedtrial_avg+S.pairedtrial_sem,'k'); plot(xaxis,S.pairedtrial_avg-S.pairedtrial_sem,'k')

cd('[path]\Acq\D10')
load('745_D10_data.mat'); plot(xaxis,S.pairedtrial_avg,'g');plot(xaxis,S.pairedtrial_avg+S.pairedtrial_sem,'g'); plot(xaxis,S.pairedtrial_avg-S.pairedtrial_sem,'g')

ylabel('Movement index'); xlabel('Time (s)')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlim([-0.15 1]); ylim([-0.04 0.1])

cd('[path]')
figname = sprintf('742_cond_pairedresponse.fig')
saveas(gcf,figname,'fig');
figname = sprintf('742_cond_pairedresponse.pdf')
print('-dpdf','-vector','-loose',figname)
%
%          % USonly cond
%     cd('[path]\Acq\D1')
% load('745_D1_data.mat'); figure; hold on; plot(xaxis,S.USonly_avg,'k');
%
% cd('[path]\Acq\D10')
% load('745_D10_data.mat'); plot(xaxis,S.USonly_avg,'g');
%
% ylabel('Movement index'); xlabel('Time (s)')
%  line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%  line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%  xlim([-0.15 1]); ylim([-0.04 0.7])
%
%  cd('[path]')
%     figname = sprintf('745_cond_USonlyresponse.fig')
%     saveas(gcf,figname,'fig');
%     figname = sprintf('745_cond_USonlyresponse.pdf')
%     print('-dpdf','-vector','-loose',figname)






% CS only pseudo

cd('[path]\Acq\D1')
load('739_D1_data.mat'); figure; hold on; plot(xaxis,S.CSonlytrial_avg,'k'); plot(xaxis,S.CSonlytrial_avg+S.CSonlytrial_sem,'k'); plot(xaxis,S.CSonlytrial_avg-S.CSonlytrial_sem,'k')

cd('[path]\Acq\D10')
load('739_D10_data.mat'); plot(xaxis,S.CSonlytrial_avg,'g');plot(xaxis,S.CSonlytrial_avg+S.CSonlytrial_sem,'g'); plot(xaxis,S.CSonlytrial_avg-S.CSonlytrial_sem,'g')

ylabel('Movement index'); xlabel('Time (s)')
xlim([-0.15 1]); ylim([-0.04 0.1])
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');


cd('[path]')
figname = sprintf('739_pseudo_CSonlyresponse.fig')
saveas(gcf,figname,'fig');
figname = sprintf('739_pseudo_CSonlyresponse.pdf')
print('-dpdf','-vector','-loose',figname)

% paired pseudo
cd('[path]\Acq\D1')
load('739_D1_data.mat'); figure; hold on; plot(xaxis,S.pairedtrial_avg,'k'); plot(xaxis,S.pairedtrial_avg+S.pairedtrial_sem,'k'); plot(xaxis,S.pairedtrial_avg-S.pairedtrial_sem,'k')

cd('[path]\Acq\D10')
load('739_D10_data.mat'); plot(xaxis,S.pairedtrial_avg,'g');plot(xaxis,S.pairedtrial_avg+S.pairedtrial_sem,'g'); plot(xaxis,S.pairedtrial_avg-S.pairedtrial_sem,'g')

ylabel('Movement index'); xlabel('Time (s)')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlim([-0.15 1]); ylim([-0.04 0.1])

cd('[path]')
figname = sprintf('742_pseudo_pairedresponse.fig')
saveas(gcf,figname,'fig');
figname = sprintf('742_pseudo_pairedresponse.pdf')
print('-dpdf','-vector','-loose',figname)

%% Gather the individual group traces
allavgs.cond_CStrial=[];
allavgs.cond_CSonlytrial=[];
allavgs.cond_pairedtrial=[];
allavgs.cond_USonlytrial=[];

allavgs.pseudo_CStrial=[];
allavgs.pseudo_CSonlytrial=[];
allavgs.pseudo_USonlytrial=[];

%Cond
allavgs.cond_CStrial = [allavgs.cond_CStrial; S.CStrial_avg];
allavgs.cond_CSonlytrial = [allavgs.cond_CSonlytrial; S.CSonlytrial_avg];
try
    allavgs.cond_pairedtrial = [allavgs.cond_pairedtrial; S.pairedtrial_avg];
end
try
    allavgs.cond_USonlytrial = [allavgs.cond_USonlytrial; S.USonly_avg];
end
%
% %Cond
% allavgs.cond_CStrial(9,:) = S.CStrial_avg;
% allavgs.cond_CSonlytrial(9,:) = S.CSonlytrial_avg;
% allavgs.cond_pairedtrial(9,:) = S.pairedtrial_avg;
% allavgs.cond_USonlytrial(6,:) = S.USonly_avg;


%Pseudo
allavgs.pseudo_CStrial = [allavgs.pseudo_CStrial; S.CStrial_avg];
allavgs.pseudo_CSonlytrial = [allavgs.pseudo_CSonlytrial; S.CSonlytrial_avg];
try
    allavgs.pseudo_USonlytrial = [allavgs.pseudo_USonlytrial; S.USonly_avg];
end

% Create avgs/sem
allavgs.cond_CStrial_avg=nanmean(allavgs.cond_CStrial,1);
allavgs.cond_CSonlytrial_avg=nanmean(allavgs.cond_CSonlytrial,1);
allavgs.cond_pairedtrial_avg=nanmean(allavgs.cond_pairedtrial,1);
allavgs.cond_USonlytrial_avg=nanmean(allavgs.cond_USonlytrial,1);

allavgs.pseudo_CStrial_avg=nanmean(allavgs.pseudo_CStrial,1);
allavgs.pseudo_CSonlytrial_avg=nanmean(allavgs.pseudo_CSonlytrial,1);
allavgs.pseudo_USonlytrial_avg=nanmean(allavgs.pseudo_USonlytrial,1);

allavgs.cond_CStrial_sem=nanstd(allavgs.cond_CStrial,1)/sqrt(size(allavgs.cond_CStrial,1));
allavgs.cond_CSonlytrial_sem=nanstd(allavgs.cond_CSonlytrial,1)/sqrt(size(allavgs.cond_CSonlytrial,1));
allavgs.cond_pairedtrial_sem=nanstd(allavgs.cond_pairedtrial,1)/sqrt(size(allavgs.cond_pairedtrial,1));
allavgs.cond_USonlytrial_sem=nanstd(allavgs.cond_USonlytrial,1)/sqrt(size(allavgs.cond_USonlytrial,1));

allavgs.pseudo_CStrial_sem=nanstd(allavgs.pseudo_CStrial,1)/sqrt(size(allavgs.pseudo_CStrial,1));
allavgs.pseudo_CSonlytrial_sem=nanstd(allavgs.pseudo_CSonlytrial,1)/sqrt(size(allavgs.pseudo_CSonlytrial,1));
allavgs.pseudo_USonlytrial_sem=nanstd(allavgs.pseudo_USonlytrial,1)/sqrt(size(allavgs.pseudo_USonlytrial,1));


%% cond plots
%
% %CS trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.cond_CStrial_avg,'k'); plot(xaxis,allavgs.cond_CStrial_avg+allavgs.cond_CStrial_sem,'k'); plot(xaxis,allavgs.cond_CStrial_avg-allavgs.cond_CStrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.cond_CStrial_avg,'g'); plot(xaxis,allavgs.cond_CStrial_avg+allavgs.cond_CStrial_sem,'g'); plot(xaxis,allavgs.cond_CStrial_avg-allavgs.cond_CStrial_sem,'g')

xlim([-0.15 1]); ylim([-0.04 0.1])
ylabel('Movement index'); xlabel('Time (s)');  title('CS trials')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');


%cond plots - CSonly trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.cond_CSonlytrial_avg,'k'); plot(xaxis,allavgs.cond_CSonlytrial_avg+allavgs.cond_CSonlytrial_sem,'k'); plot(xaxis,allavgs.cond_CSonlytrial_avg-allavgs.cond_CSonlytrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.cond_CSonlytrial_avg,'g'); plot(xaxis,allavgs.cond_CSonlytrial_avg+allavgs.cond_CSonlytrial_sem,'g'); plot(xaxis,allavgs.cond_CSonlytrial_avg-allavgs.cond_CSonlytrial_sem,'g')

xlim([-0.15 1]); ylim([-0.04 0.1])
ylabel('Movement index'); xlabel('Time (s)'); title('CSonly')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

figname = sprintf('cond_CSonlytrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('cond_CSonlytrials.pdf')
print('-dpdf','-vector','-loose',figname)


%cond plots - USonly trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.cond_USonlytrial_avg,'k'); plot(xaxis,allavgs.cond_USonlytrial_avg+allavgs.cond_USonlytrial_sem,'k'); plot(xaxis,allavgs.cond_USonlytrial_avg-allavgs.cond_USonlytrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.cond_USonlytrial_avg,'g'); plot(xaxis,allavgs.cond_USonlytrial_avg+allavgs.cond_USonlytrial_sem,'g'); plot(xaxis,allavgs.cond_USonlytrial_avg-allavgs.cond_USonlytrial_sem,'g')

xlim([-0.15 1]); ylim([-0.1 0.4]); title('USonly')
ylabel('Movement index'); xlabel('Time (s)')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

figname = sprintf('cond_USonlytrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('cond_USonlytrials.pdf')
print('-dpdf','-vector','-loose',figname)

%% pseudo
%CS trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.pseudo_CStrial_avg,'k'); plot(xaxis,allavgs.pseudo_CStrial_avg+allavgs.pseudo_CStrial_sem,'k'); plot(xaxis,allavgs.pseudo_CStrial_avg-allavgs.pseudo_CStrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.pseudo_CStrial_avg,'g'); plot(xaxis,allavgs.pseudo_CStrial_avg+allavgs.pseudo_CStrial_sem,'g'); plot(xaxis,allavgs.pseudo_CStrial_avg-allavgs.pseudo_CStrial_sem,'g')

xlim([-0.15 1]); ylim([-0.04 0.1])
ylabel('Movement index'); xlabel('Time (s)');  title('CS trials')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');


%pseudo plots - CSonly trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.pseudo_CSonlytrial_avg,'k'); plot(xaxis,allavgs.pseudo_CSonlytrial_avg+allavgs.pseudo_CSonlytrial_sem,'k'); plot(xaxis,allavgs.pseudo_CSonlytrial_avg-allavgs.pseudo_CSonlytrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.pseudo_CSonlytrial_avg,'g'); plot(xaxis,allavgs.pseudo_CSonlytrial_avg+allavgs.pseudo_CSonlytrial_sem,'g'); plot(xaxis,allavgs.pseudo_CSonlytrial_avg-allavgs.pseudo_CSonlytrial_sem,'g')

xlim([-0.15 1]); ylim([-0.04 0.1])

ylabel('Movement index'); xlabel('Time (s)'); title('CSonly')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

figname = sprintf('pseudo_CSonlytrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('pseudo_CSonlytrials.pdf')
print('-dpdf','-vector','-loose',figname)

%pseudo plots - USonly trials
xaxis=linspace((1/60),2,121)-0.5;
cd('[path]')
load('allavgs_D1.mat'); figure; hold on; plot(xaxis,allavgs.pseudo_USonlytrial_avg,'k'); plot(xaxis,allavgs.pseudo_USonlytrial_avg+allavgs.pseudo_USonlytrial_sem,'k'); plot(xaxis,allavgs.pseudo_USonlytrial_avg-allavgs.pseudo_USonlytrial_sem,'k')

cd('[path]')
load('allavgs_D10.mat'); plot(xaxis,allavgs.pseudo_USonlytrial_avg,'g'); plot(xaxis,allavgs.pseudo_USonlytrial_avg+allavgs.pseudo_USonlytrial_sem,'g'); plot(xaxis,allavgs.pseudo_USonlytrial_avg-allavgs.pseudo_USonlytrial_sem,'g')

xlim([-0.15 1]); ylim([-0.1 0.4]); title('USonly')
ylabel('Movement index'); xlabel('Time (s)')
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.28 0.28],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

figname = sprintf('pseudo_USonlytrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('pseudo_USonlytrials.pdf')
print('-dpdf','-vector','-loose',figname)


%% Amplitude first 50ms after CS

S.CSonlytrial_CSamp_startle =[];
S.CSonlytrial_CSAUC_startle =[];
for ii=1:size(R.CSonlytrial_mov,1)
    S.CSonlytrial_CSamp_startle(ii) = nanmax(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.55*P.framerate)));
    S.CSonlytrial_CSAUC_startle(ii) = nansum(R.CSonlytrial_mov(ii,round(0.5*P.framerate):round(0.55*P.framerate)));
end
S.CSonlytrial_CSamp_startle_avg = nanmean(S.CSonlytrial_CSamp_startle);
S.CSonlytrial_CSAUC_startle_avg = nanmean(S.CSonlytrial_CSAUC_startle);



%% Skewness and CV of movement trace
S.CSonlytrial_skewness =[];
S.CSonlytrial_CV =[];
for ii=1:size(R.CSonlytrial_mov,1)
    S.CSonlytrial_skewness(ii) = skewness(R.CSonlytrial_mov(ii,1:round(0.5*P.framerate)));
    S.CSonlytrial_SD(ii) = nanstd(R.CSonlytrial_mov(ii,1:round(0.5*P.framerate)));
end

S.CSonlytrial_skewness_avg = nanmean(S.CSonlytrial_skewness);
S.CSonlytrial_SD_avg = nanmean(S.CSonlytrial_SD);

S.excel_addition = [S.CSonlytrial_CSamp_startle_avg S.CSonlytrial_CSAUC_startle_avg S.CSonlytrial_skewness_avg S.CSonlytrial_SD_avg];


%% resave the data
P.savename = sprintf('%s_data.mat',P.mouseID);
save(P.savename,'P','S','R',"-v7.3");
