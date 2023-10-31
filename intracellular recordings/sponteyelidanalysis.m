%% Analyze the spontaneous eyelid movements occurring between CS/US trials
% (c) R. Broersen, Erasmus MC, 2023

close; clear all;
for jj=1:31
    if jj==1
        %% Trained
        %%Define the following variables per mouse
        Param.cellID =  '121115_1';
        Param.mouseID = '16987';
        Param.path   = '[path]\Trained\01-121115_1\behavior\16987';
        Param.block = 'Block-16'; % patching block
        Param.range = [1:66]; % Define range of trials to analyse
        Param.path_ephys   = '[path]\Trained\01-121115_1';
        Param.EphysdataFile = '15n12007.abf'; % name of the ephys file
        Param.exclude_trials = [63:67];
        Param.cell_resp =2;

    elseif jj==2
        Param.cellID =  '280116_1';
        Param.mouseID = '0801162';
        Param.path   = '[path]\Trained\02-280116_1\behavior\0801162';
        Param.block = 'Block-14'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\02-280116_1';
        Param.EphysdataFile = '16128006.abf'; % name of the ephys file
        Param.exclude_trials = [63:65];
        Param.cell_resp =1;

    elseif jj==3
        Param.cellID =  '181016_1';
        Param.mouseID = '2009163';
        Param.path   = '[path]\Trained\03-181016_1\behavior\2009163';
        Param.block = 'Block-13'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\03-181016_1';
        Param.EphysdataFile = '16o18006.abf'; % name of the ephys file
        Param.exclude_trials = [47:48];
        Param.cell_resp =1;

    elseif jj==4
        Param.cellID =  '201216_1';
        Param.mouseID = '2211163';
        Param.path   = '[path]\Trained\04-201216_1\behavior\2211163';
        Param.block = 'Block-7'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\04-201216_1';
        Param.EphysdataFile = '16d20003.abf'; % name of the ephys file
        Param.exclude_trials = [21];
        Param.cell_resp =1;

    elseif jj==5
        Param.cellID =  '160317_2';
        Param.mouseID = '1302173';
        Param.path   = '[path]\Trained\05-160317_2\behavior\1302173';
        Param.block = 'Block-11'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\05-160317_2';
        Param.EphysdataFile = '17316005.abf'; % name of the ephys file
        Param.exclude_trials = [33];
        Param.cell_resp =1;

    elseif jj==6
        Param.cellID =  '110417_1';
        Param.mouseID = '2103171';
        Param.path   = '[path]\Trained\06-110417_1\behavior\2103171';
        Param.block = 'Block-8'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\06-110417_1';
        Param.EphysdataFile = '17411003.abf'; % name of the ephys file
        Param.exclude_trials = [9:10];
        Param.cell_resp =1;

    elseif jj==7
        Param.cellID =  '190417_2';
        Param.mouseID = '2103172';
        Param.path   = '[path]\Trained\07-190417_2\behavior\2103172';
        Param.block = 'Block-15'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\07-190417_2';
        Param.EphysdataFile = '17419008.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =2;

    elseif jj==8
        Param.cellID =  '110517_2';
        Param.mouseID = '2404172';
        Param.path   = '[path]\Trained\08-110517_2\behavior\2404172';
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\08-110517_2';
        Param.EphysdataFile = '17511008.abf'; % name of the ephys file
        Param.exclude_trials = [1:2];
        Param.cell_resp =1;

    elseif jj==9
        Param.cellID =  '170517_1';
        Param.mouseID = '2404171';
        Param.path   = '[path]\Trained\09-170517_1\behavior\2404171';
        Param.block = 'Block-13'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\09-170517_1';
        Param.EphysdataFile = '17517003.abf'; % name of the ephys file
        Param.exclude_trials = [9];
        Param.cell_resp =0;

    elseif jj==10
        Param.cellID =  '110517_1';
        Param.mouseID = '2404172';
        Param.path   = '[path]\Trained\10-110517_1\behavior\2404172';
        Param.block = 'Block-9'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\10-110517_1';
        Param.EphysdataFile = '17511004.abf'; % name of the ephys file
        Param.exclude_trials = [2:4 31];
        Param.cell_resp =1;

    elseif jj==11
        Param.cellID =  '211216_1';
        Param.mouseID = '2211164';
        Param.path   = '[path]\Trained\11-211216_1\behavior\2211164';
        Param.block = 'Block-9'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\11-211216_1';
        Param.EphysdataFile = '16d21008.abf'; % name of the ephys file
        Param.exclude_trials = [24:26]; % patching block
        Param.cell_resp =1;

    elseif jj==12
        Param.cellID =  '211216_2';
        Param.mouseID = '2211164';
        Param.path   = '[path]\Trained\12-211216_2\behavior\2211164';
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\12-211216_2';
        Param.EphysdataFile = '16d21012.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =1;

    elseif jj==13
        Param.cellID =  '220217_3';
        Param.mouseID = '1701171';
        Param.path   = '[path]\Trained\13-220217_3\behavior\1701171';
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\13-220217_3';
        Param.EphysdataFile = '17222011.abf'; % name of the ephys file
        Param.exclude_trials = [12:13];
        Param.cell_resp =2;

    elseif jj==14
        Param.cellID =  '010317_2';
        Param.mouseID = '1701173';
        Param.path   = '[path]\Trained\14-010317_2\behavior\1701173';
        % Param.block = 'Block-14'; % patching block
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\14-010317_2';
        Param.EphysdataFile = '17301005.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =2;

    elseif jj==15
        Param.cellID =  '110417_3';
        Param.mouseID = '2103171';
        Param.path   = '[path]\Trained\15-110417_3\behavior\2103171';
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\15-110417_3';
        Param.EphysdataFile = '17411012.abf'; % name of the ephys file
        Param.exclude_trials = [9];
        Param.cell_resp =1;

        % elseif jj==16 % Excluded neuron
        % Param.cellID =  '190417_1';
        % Param.mouseID = '2103172';
        % Param.path   = '[path]\Trained\16-190417_1\behavior\2103172';
        % Param.block = 'Block-11'; % patching block
        % Param.range = [0]; % Define range of trials to analyse. '0' if analyse all

    elseif jj==17
        %% NAIVE
        Param.cellID =  '020516_1';
        Param.mouseID = '2104161';
        Param.path   = '[path]\Naive\01-020516_1\behavior\2104161';
        Param.block = 'Block-4'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\01-020516_1';
        Param.EphysdataFile = '16502004.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =1;

    elseif jj==18
        Param.cellID =  '020516_2';
        Param.mouseID = '2104161';
        Param.path   = '[path]\Naive\02-020516_2\behavior\2104161';
        Param.block = 'Block-5'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\02-020516_2';
        Param.EphysdataFile = '16502012.abf'; % name of the ephys file
        Param.exclude_trials = [6];
        Param.cell_resp =1;

    elseif jj==19
        Param.cellID =  '120516_2';
        Param.mouseID = '2804162';
        Param.path   = '[path]\Naive\03-120516_2\behavior\2804162';
        Param.block = 'Block-4'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\03-120516_2';
        Param.EphysdataFile = '16512006.abf'; % name of the ephys file
        Param.exclude_trials = [5:6];
        Param.cell_resp =0;

    elseif jj==20
        Param.cellID =  '300516_3';
        Param.mouseID = '2804163';
        Param.path   = '[path]\Naive\04-300516_3\behavior\2804163';
        Param.block = 'Block-5'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\04-300516_3';
        Param.EphysdataFile = '16530008.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =2;

    elseif jj==21
        Param.cellID =  '010616_5';
        Param.mouseID = '0505161';
        Param.path   = '[path]\Naive\05-010616_5\behavior\0505161';
        Param.block = 'Block-6'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\05-010616_5';
        Param.EphysdataFile = '16601019.abf'; % name of the ephys file
        Param.exclude_trials = [10:11];
        Param.cell_resp =1;

    elseif jj==22
        Param.cellID =  '130716_1';
        Param.mouseID = '0407163';
        Param.path   = '[path]\Naive\06-130716_1\behavior\0407163';
        Param.block = 'Block-5'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\06-130716_1';
        Param.EphysdataFile = '16713004.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =0;

    elseif jj==23
        Param.cellID =  '230716_3';
        Param.mouseID = '0807162';
        Param.path   = '[path]\Naive\07-230716_3\behavior\0807162'
        Param.block = 'Block-8'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\07-230716_3';
        Param.EphysdataFile = '16723006.abf'; % name of the ephys file
        Param.exclude_trials = [14:20];
        Param.cell_resp =0;

    elseif jj==24
        Param.cellID =  '210317_2';
        Param.mouseID = '1403172';
        Param.path   = '[path]\Naive\08-210317_2\behavior\1403172';
        Param.block = 'Block-4'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\08-210317_2';
        Param.EphysdataFile = '17321010.abf'; % name of the ephys file
        Param.exclude_trials = [19];
        Param.cell_resp =2;

    elseif jj==25
        Param.cellID =  '070917_1';
        Param.mouseID = '2108172';
        Param.path   = '[path]\Naive\09-070917_1\behavior\2108172';
        Param.block = 'Block-1'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\09-070917_1';
        Param.EphysdataFile = '17907003.abf'; % name of the ephys file
        Param.exclude_trials = [34:36];
        Param.cell_resp =1;

    elseif jj==26
        Param.cellID =  '070917_2';
        Param.mouseID = '2108172';
        Param.path   = '[path]\Naive\10-070917_2\behavior\2108172';
        Param.block = 'Block-2'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\10-070917_2';
        Param.EphysdataFile = '17907007.abf'; % name of the ephys file
        Param.exclude_trials = [55:56];
        Param.cell_resp =0;

    elseif jj==27
        Param.cellID =  '060417_3';
        Param.mouseID = '2003171';
        Param.path   = '[path]\Naive\11-060417_3\behavior\2003171';
        Param.block = 'Block-13'; % patching block - current clamp file 1
        % Param.block = 'Block-16'; % patching block - current clamp file 2
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\11-060417_3';
        Param.EphysdataFile = '17406011.abf'; % name of the ephys file - current clamp file 1
        % Param.EphysdataFile = '17406015.abf'; % name of the ephys file - current clamp file 2
        Param.exclude_trials = [];
        Param.cell_resp =2;

    elseif jj==28
        Param.cellID =  '060417_1';
        Param.mouseID = '2003171';
        Param.path   = '[path]\Naive\12-060417_1\behavior\2003171';
        Param.block = 'Block-10'; % patching block
        Param.range = [1:21]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\12-060417_1';
        Param.EphysdataFile = '17406003.abf'; % name of the ephys file - current clamp file 1
        Param.exclude_trials = [19:21];
        Param.cell_resp =1;

    elseif jj==29
        Param.cellID =  '230716_4';
        Param.mouseID = '0807162';
        Param.path   = '[path]\Naive\13-230716_4\behavior\0807162';
        Param.block = 'Block-9'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\13-230716_4';
        Param.EphysdataFile = '16723013.abf'; % name of the ephys file - current clamp file 1
        Param.exclude_trials = [15:16];
        Param.cell_resp =1;

    elseif jj==30
        Param.cellID =  '250417_2';
        Param.mouseID = '2003174';
        Param.path   = '[path]\Naive\14-250417_2\behavior\2003174';
        Param.block = 'Block-19'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\14-250417_2';
        Param.EphysdataFile = '17425010.abf'; % name of the ephys file
        Param.exclude_trials = [];
        Param.cell_resp =1;

    elseif jj==31
        Param.cellID =  '260117_2';
        Param.mouseID = '0201173';
        Param.path   = '[path]\Naive\15-260117_2\behavior\0201173';
        Param.block = 'Block-12'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Naive\15-260117_2';
        Param.EphysdataFile = '17126009.abf'; % name of the ephys file
        Param.exclude_trials = [17];
        Param.cell_resp =1;
    end

    %% Define variables
    Param.inputChannel =1;
    Param.cmdChannel = 11;
    Param.GoTrChannel = 4;
    Param.LtOnChannel = 5;
    Param.PfOnChannel = 6;
    if sum(Param.cellID=='070917_1')==8 || sum(Param.cellID=='070917_2')==8
        Param.TTLthreshold = 1500;
    else
        Param.TTLthreshold = 0.5;
    end
    Param.baselineThreshold = [-1 1];    % Define the baseline threshold pos/neg in volt for exclusion of traces
    Param.baselineMaxDiff = 5;              % Define the maximal difference between min/max baseline values to be included in analysis
    Param.TrialsToAnalyse = 0; % Select if you want to analyse all trials
    Param.amp_norm = 1;                     % Define the factor used to normalize the amplitude of the CR to US peak to
    Param.CR_SDthreshold = 5;               % Define the CR detection threshold
    Param.CRthreshold_UR = 0.1;               % Define the CR detection threshold
    Param.savefig = 0; % 1=save figures; 0 = don't save figures
    Param.savefile = 0; %1 = save datafile, 0 = don't save datafile

    cd(Param.path);
    %   mkdir(['behavior_' Param.block]); % Only first time
    %% Load file
    Eyeblink_signal = TDTbin2mat([Param.path '\' Param.block '\' ]);
    Param.fs = Eyeblink_signal.streams.mdmt.fs;
    Eyeblink_signal.adc = Eyeblink_signal.streams.mdmt.data;
    Eyeblink_signal.GoTr_TimeStamps = Eyeblink_signal.epocs.GoTr.onset';
    Eyeblink_signal.GoTr_IDstim = Eyeblink_signal.epocs.GoTr.data';
    Eyeblink_signal.NGoTr = size(Eyeblink_signal.GoTr_IDstim,1);
    Eyeblink_signal.LtOn_TimeStamps = Eyeblink_signal.epocs.LtOn.onset';
    Eyeblink_signal.NLtOn = size(Eyeblink_signal.LtOn_TimeStamps,1);
    Eyeblink_signal.PfOn_TimeStamps = Eyeblink_signal.epocs.PfOn.onset';
    Eyeblink_signal.NPfOn = size(Eyeblink_signal.PfOn_TimeStamps,1);

    % limit the GoTr to the defined range
    if Param.range>0
        Eyeblink_signal.GoTr_TimeStamps = Eyeblink_signal.GoTr_TimeStamps(Param.range);
        Eyeblink_signal.GoTr_IDstim = Eyeblink_signal.GoTr_IDstim(Param.range);
    end



    %% Load the ephys data
    [Spkdata.d,Spkdata.si,Spkdata.h]=abf2load([Param.path_ephys '\' Param.EphysdataFile],'channels',{['IN ' num2str(Param.inputChannel)]});
    Spkdata.data = Spkdata.d;
    Spkdata.fs = 10^6/Spkdata.si; % Calculate the sampling frequency
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

    %% Filter ephys

    Spkdata.data_lowfilt= movmedian(Spkdata.data,0.01*Spkdata.fs);

    %% Define variables
    SpontEM.plotwidth=1;
    peakprominance = 0.1*10^-4; % define the minimum peak prominance
    peakdistance = 0.5*Param.fs;
    SpontEM.fsratio = Spkdata.fs/Param.fs;


    % Normalize the eyelid data to min and max opening/closure
    Eyeblink_signal.adc_norm = (Eyeblink_signal.adc-nanmin(Eyeblink_signal.adc));
    Eyeblink_signal.adc_norm =  Eyeblink_signal.adc_norm/nanmax(Eyeblink_signal.adc_norm)*100;

    % Select periods of traces where there is no trial going on
    SpontEM.adc_filtered_exclTrials = Eyeblink_signal.adc_norm;
    SpontEM.t_exclTrials = [1/Param.fs:1/Param.fs:length(Eyeblink_signal.adc)/Param.fs];
    Eyeblink_signal.t = [1/Param.fs:1/Param.fs:length(Eyeblink_signal.adc)/Param.fs];
    % Filter the signal to detect slow eyemovements
    cd(Param.path_ephys);
    mkdir('SpontEM');
    cd([Param.path_ephys '\SpontEM']);
    % Eyeblink_signal.adc_filtered_exclTrials = gfilt(Eyeblink_signal.adc_filtered_exclTrials',Param.fs,0.0375)'; % 5Hz cutoff frequency
    % SpontEM.adc_filtered_exclTrials = gfilt(SpontEM.adc_filtered_exclTrials',Param.fs,0.1874)'; % 1Hz cutoff frequency
    SpontEM.adc_filtered_exclTrials = gfilt(SpontEM.adc_filtered_exclTrials',Param.fs,0.0375)'; % 5Hz cutoff frequency
    % SpontEM.adc_filtered_exclTrials = gfilt(SpontEM.adc_filtered_exclTrials',Param.fs,0.3748)'; % 0.5Hz cutoff frequency
    % Eyeblink_signal.adc_filtered_exclTrials = gfilt(Eyeblink_signal.adc_filtered_exclTrials',Param.fs,0.7496)'; % 0.25Hz cutoff frequency
    % Eyeblink_signal.adc_filtered_exclTrials = gfilt(Eyeblink_signal.adc_filtered_exclTrials',Param.fs,1.8739)'; % 0.1Hz cutoff frequency


    %% Remove timestamps of trial periods and after last trial signal
    for ii=1:length(Eyeblink_signal.GoTr_TimeStamps)
        index=find(Eyeblink_signal.t >= Eyeblink_signal.GoTr_TimeStamps(ii), 1, 'first')+round(Param.fs*0):find(Eyeblink_signal.t >= Eyeblink_signal.GoTr_TimeStamps(ii), 1, 'first')+round(Param.fs*2);
        SpontEM.t_exclTrials(index)=NaN;
        SpontEM.adc_filtered_exclTrials(index)=NaN;
        if ii==length(Eyeblink_signal.GoTr_TimeStamps)
            index=find(Eyeblink_signal.t >= Eyeblink_signal.GoTr_TimeStamps(ii), 1, 'first')+round(Param.fs*0);
            SpontEM.t_exclTrials(index:end)=NaN;
            SpontEM.adc_filtered_exclTrials(index:end)=NaN;
        end
    end


    %% Differentiate the signal
    SpontEM.adc_filtered_exclTrials_diff = diff(SpontEM.adc_filtered_exclTrials);
    SpontEM.adc_filtered_exclTrials_diffdiff = diff(diff(SpontEM.adc_filtered_exclTrials));

    h=figure; ha(1)=subplot(3,1,1); hold on;
    plot(SpontEM.adc_filtered_exclTrials,'r');
    plot([SpontEM.adc_filtered_exclTrials_diff*5000 NaN],'b');
    plot([SpontEM.adc_filtered_exclTrials_diffdiff*50000 NaN NaN],'g');
    legend('Raw','Velocity','Acceleration')


    %% Detect and plot low peaks (eye openings)
    SpontEM.det_lowthreshold = -3*nanstd(SpontEM.adc_filtered_exclTrials_diff);
    SpontEM.det_highthreshold = 3*nanstd(SpontEM.adc_filtered_exclTrials_diff);

    % modify so that eyelid changes are detected with SD
    index=find(SpontEM.adc_filtered_exclTrials_diff>(SpontEM.det_lowthreshold));

    SpontEM.adc_filtered_exclTrials_diff_lowPeaks = SpontEM.adc_filtered_exclTrials_diff;
    SpontEM.adc_filtered_exclTrials_diff_lowPeaks(index) = NaN;
    ha(2)=subplot(3,1,2); hold on; title('Eye openings')
    plot(SpontEM.adc_filtered_exclTrials,'r');
    plot(SpontEM.adc_filtered_exclTrials_diff*10000,'b');
    % plot(repmat(SpontEM.det_lowthreshold*10000,length(SpontEM.adc_filtered_exclTrials_diff),'b'))

    [SpontEM.lowPeak_pks,SpontEM.lowPeak_locs] = findpeaks(SpontEM.adc_filtered_exclTrials_diff_lowPeaks*-1,'MinPeakProminence',peakprominance,'MinPeakDistance',peakdistance);
    plot(SpontEM.lowPeak_locs,SpontEM.lowPeak_pks*-1,'m*');

    %% Detect and plot high peaks (eye closures)
    index=find(SpontEM.adc_filtered_exclTrials_diff<(SpontEM.det_highthreshold));

    SpontEM.adc_filtered_exclTrials_diff_highPeaks = SpontEM.adc_filtered_exclTrials_diff;
    SpontEM.adc_filtered_exclTrials_diff_highPeaks(index) = NaN;

    ha(3)=subplot(3,1,3); hold on; title('Eye closures')
    plot(SpontEM.adc_filtered_exclTrials,'r');
    plot(SpontEM.adc_filtered_exclTrials_diff*10000,'b');
    % plot(repmat(SpontEM.det_highthreshold*10000,length(SpontEM.adc_filtered_exclTrials_diff),'b'))

    [SpontEM.highPeak_pks,SpontEM.highPeak_locs] = findpeaks(SpontEM.adc_filtered_exclTrials_diff_highPeaks,'MinPeakProminence',peakprominance,'MinPeakDistance',peakdistance);
    plot(SpontEM.highPeak_locs,SpontEM.highPeak_pks,'k*');

    linkaxes([ha(1),ha(2),ha(3)],'x');
    % linkaxes([ha(1),ha(2),ha(3)],'y');

    % for ii=1:length(SpontEM.highPeak_locs)
    % line([SpontEM.highPeak_locs(ii) SpontEM.highPeak_locs(ii)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    % end
    %
    %     figname = sprintf('SpontEM_peaksDetect_%s', Param.cellID);
    %     saveas(gcf,figname);
    %     print('-dpdf','-painters','-loose',figname)

    %% Find isolated closures/openings

    %closures without opening preceding
    SpontEM.highPeak_locs_isolated=[];
    SpontEM.highPeak_pks_isolated=[];
    for zz=1:length(SpontEM.highPeak_locs)
        if sum(round(SpontEM.highPeak_locs(zz)-peakdistance)<SpontEM.lowPeak_locs&SpontEM.lowPeak_locs<SpontEM.highPeak_locs(zz))==0 % if there is an opening preceding a given closure, exclude. if not, include
            SpontEM.highPeak_locs_isolated = [SpontEM.highPeak_locs_isolated; SpontEM.highPeak_locs(zz)];
            SpontEM.highPeak_pks_isolated = [SpontEM.highPeak_pks_isolated; SpontEM.highPeak_pks(zz)];
        end
    end
    subplot(3,1,3); plot(SpontEM.highPeak_locs_isolated,SpontEM.highPeak_pks_isolated+1,'r*');

    %openings without closures preceding
    SpontEM.lowPeak_locs_isolated=[];
    SpontEM.lowPeak_pks_isolated=[];
    for zz=1:length(SpontEM.lowPeak_locs)
        if sum(round(SpontEM.lowPeak_locs(zz)-peakdistance)<SpontEM.highPeak_locs&SpontEM.highPeak_locs<SpontEM.lowPeak_locs(zz))==0 % if there is an closure preceding a given opening, exclude. if not, include
            SpontEM.lowPeak_locs_isolated = [SpontEM.lowPeak_locs_isolated; SpontEM.lowPeak_locs(zz)];
            SpontEM.lowPeak_pks_isolated = [SpontEM.lowPeak_pks_isolated; SpontEM.lowPeak_pks(zz)];
        end
    end
    subplot(3,1,2); plot(SpontEM.lowPeak_locs_isolated,SpontEM.lowPeak_pks_isolated+1,'r*');

    SpontEM.lowPeak_locs = SpontEM.lowPeak_locs_isolated;
    SpontEM.lowPeak_pks = SpontEM.lowPeak_pks_isolated;
    SpontEM.highPeak_locs = SpontEM.highPeak_locs_isolated;
    SpontEM.highPeak_pks = SpontEM.highPeak_pks_isolated;

    %% plot the signal + peaks from the filtered eye signal

    % List the signal with the low peak
    SpontEM.lowPeak_Ylist = [];
    SpontEM.lowPeak_Xlist = [];
    figure; subplot(3,2,3); hold on ;title('Eyelid movements (position)');
    for ii=1:length(SpontEM.lowPeak_pks)

        SpontEM.lowPeak_Ylist = [SpontEM.lowPeak_Ylist; SpontEM.adc_filtered_exclTrials(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))-nanmean(SpontEM.adc_filtered_exclTrials(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs)))];
        SpontEM.lowPeak_Xlist = [SpontEM.lowPeak_Xlist; Eyeblink_signal.t(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.lowPeak_Ylist(ii,:),'m');
        ii
    end

    SpontEM.lowPeak_Ylist_mean = nanmean(SpontEM.lowPeak_Ylist);
    SpontEM.lowPeak_Ylist_SD = nanstd(SpontEM.lowPeak_Ylist);
    subplot(3,2,3); hold on; plot(SpontEM.lowPeak_Ylist_mean,'k');


    % List the signal with the high peak
    SpontEM.highPeak_Ylist = [];
    SpontEM.highPeak_Xlist = [];
    for ii=1:length(SpontEM.highPeak_pks)
        SpontEM.highPeak_Ylist = [SpontEM.highPeak_Ylist; SpontEM.adc_filtered_exclTrials(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))-nanmean(SpontEM.adc_filtered_exclTrials(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs)))];
        SpontEM.highPeak_Xlist = [SpontEM.highPeak_Xlist; Eyeblink_signal.t(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.highPeak_Ylist(ii,:),'c');
        ii
    end

    SpontEM.highPeak_Ylist_mean = nanmean(SpontEM.highPeak_Ylist);
    SpontEM.highPeak_Ylist_SD = nanstd(SpontEM.highPeak_Ylist);
    subplot(3,2,3); hold on; plot(SpontEM.highPeak_Ylist_mean,'k');



    % Line to indicate middle
    xlim([0 size(SpontEM.lowPeak_Ylist,2)])
    line([size(SpontEM.lowPeak_Ylist,2)*0.5 size(SpontEM.lowPeak_Ylist,2)*0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');

    %% plot the signal + peaks from the differentiated eye signal

    % List the signal with the low peak (eye openings)
    SpontEM.lowPeak_Ylist_diff = [];
    SpontEM.lowPeak_Xlist_diff = [];
    subplot(3,2,4); hold on; title('Eyelid movements (velocity)');
    for ii=1:length(SpontEM.lowPeak_pks)
        SpontEM.lowPeak_Ylist_diff = [SpontEM.lowPeak_Ylist_diff; SpontEM.adc_filtered_exclTrials_diff(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        SpontEM.lowPeak_Xlist_diff = [SpontEM.lowPeak_Xlist_diff; Eyeblink_signal.t(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.lowPeak_Ylist_diff(ii,:),'m');
    end

    SpontEM.lowPeak_Ylist_diff_mean = nanmean(SpontEM.lowPeak_Ylist_diff);
    SpontEM.lowPeak_Ylist_diff_SD = nanstd(SpontEM.lowPeak_Ylist_diff);
    subplot(3,2,4); hold on; plot(SpontEM.lowPeak_Ylist_diff_mean,'k');

    % List the signal with the high peak (eye opening)
    SpontEM.highPeak_Ylist_diff = [];
    SpontEM.highPeak_Xlist_diff = [];
    for ii=1:length(SpontEM.highPeak_pks)
        SpontEM.highPeak_Ylist_diff = [SpontEM.highPeak_Ylist_diff; SpontEM.adc_filtered_exclTrials_diff(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        SpontEM.highPeak_Xlist_diff = [SpontEM.highPeak_Xlist_diff; Eyeblink_signal.t(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.highPeak_Ylist_diff(ii,:),'c');
    end
    % Line to indicate middle
    xlim([0 size(SpontEM.lowPeak_Ylist,2)])
    line([size(SpontEM.lowPeak_Ylist,2)*0.5 size(SpontEM.lowPeak_Ylist,2)*0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');

    %% plot the signal + peaks from the 2 x differentiated eye signal (acceleration)

    % List the signal with the low peak (eye openings)
    SpontEM.lowPeak_Ylist_diffdiff = [];
    SpontEM.lowPeak_Xlist_diffdiff = [];
    subplot(3,2,5); hold on; title('Eyelid movements (acceleration)');
    for ii=1:length(SpontEM.lowPeak_pks)
        SpontEM.lowPeak_Ylist_diffdiff = [SpontEM.lowPeak_Ylist_diffdiff; SpontEM.adc_filtered_exclTrials_diffdiff(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        SpontEM.lowPeak_Xlist_diffdiff = [SpontEM.lowPeak_Xlist_diffdiff; Eyeblink_signal.t(SpontEM.lowPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.lowPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.lowPeak_Ylist_diffdiff(ii,:),'m');
    end

    SpontEM.lowPeak_Ylist_diffdiff_mean = nanmean(SpontEM.lowPeak_Ylist_diffdiff);
    SpontEM.lowPeak_Ylist_diffdiff_SD = nanstd(SpontEM.lowPeak_Ylist_diffdiff);
    subplot(3,2,5); hold on; plot(SpontEM.lowPeak_Ylist_diffdiff_mean,'k');

    % List the signal with the high peak (eye opening)
    SpontEM.highPeak_Ylist_diffdiff = [];
    SpontEM.highPeak_Xlist_diffdiff = [];
    for ii=1:length(SpontEM.highPeak_pks)
        SpontEM.highPeak_Ylist_diffdiff = [SpontEM.highPeak_Ylist_diffdiff; SpontEM.adc_filtered_exclTrials_diffdiff(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        SpontEM.highPeak_Xlist_diffdiff = [SpontEM.highPeak_Xlist_diffdiff; Eyeblink_signal.t(SpontEM.highPeak_locs(ii)-round(SpontEM.plotwidth*Param.fs):SpontEM.highPeak_locs(ii)+round(SpontEM.plotwidth*Param.fs))];
        plot(SpontEM.highPeak_Ylist_diffdiff(ii,:),'c');
    end

    % Line to indicate middle
    xlim([0 size(SpontEM.lowPeak_Ylist,2)])
    line([size(SpontEM.lowPeak_Ylist,2)*0.5 size(SpontEM.lowPeak_Ylist,2)*0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');


    %% Synchronize the ephys trace with the start of the eye trace

    SpontEM.data_sync = Spkdata.data_lowfilt(Spkdata.ind_GoTrTTLdata(1,1)-round(Eyeblink_signal.GoTr_TimeStamps(1)*Param.fs*SpontEM.fsratio):end);
    SpontEM.data_sync_spikes = Spkdata.data(Spkdata.ind_GoTrTTLdata(1,1)-round(Eyeblink_signal.GoTr_TimeStamps(1)*Param.fs*SpontEM.fsratio):end);

    %% plot the ephys trace for lowPeak traces (eye openings)

    SpontEM.lowPeak_Ylist_ephys = [];
    for kk=1:size(SpontEM.lowPeak_Xlist,1)
        SpontEM.lowPeak_Ylist_ephys = [SpontEM.lowPeak_Ylist_ephys; ((SpontEM.data_sync(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'-nanmean((SpontEM.data_sync(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'))];
    end

    SpontEM.lowPeak_Ylist_ephys_spikes = [];
    for kk=1:size(SpontEM.lowPeak_Xlist,1)
        SpontEM.lowPeak_Ylist_ephys_spikes = [SpontEM.lowPeak_Ylist_ephys_spikes; ((SpontEM.data_sync_spikes(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'-nanmean((SpontEM.data_sync(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.lowPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'))];
    end

    SpontEM.lowPeak_Ylist_ephys_mean = nanmean(SpontEM.lowPeak_Ylist_ephys);
    SpontEM.lowPeak_Ylist_ephys_SD = nanstd(SpontEM.lowPeak_Ylist_ephys);

    % Calculate the min-max difference
    SpontEM.lowPeak_minmaxdiff = [nanmin(SpontEM.lowPeak_Ylist,[],2) nanmax(SpontEM.lowPeak_Ylist,[],2)];
    SpontEM.lowPeak_minmaxdiff = [SpontEM.lowPeak_minmaxdiff abs(SpontEM.lowPeak_minmaxdiff(:,1)-SpontEM.lowPeak_minmaxdiff(:,2))];

    [B_amp,IX_amp] = sort(SpontEM.lowPeak_minmaxdiff(:,3),'descend');

    for kk=1:size(SpontEM.lowPeak_Xlist,1)
        ii = IX_amp(kk);
        subplot(3,2,1);
        hold on
        plot(SpontEM.lowPeak_Ylist_ephys(ii,:));
        xlim([0 (SpontEM.plotwidth*2*Spkdata.fs)]);
        % pause
    end

    subplot(3,2,1); hold on; plot(SpontEM.lowPeak_Ylist_ephys_mean,'r'); title('Eye openings')
    plot(SpontEM.lowPeak_Ylist_ephys_mean+SpontEM.lowPeak_Ylist_ephys_SD,'k')
    plot(SpontEM.lowPeak_Ylist_ephys_mean-SpontEM.lowPeak_Ylist_ephys_SD,'k')
    % Line to indicate middle
    xlim([0 size(SpontEM.lowPeak_Ylist_ephys_mean,2)]); ylim([-20 20]);
    line([size(SpontEM.lowPeak_Ylist_ephys_mean,2)*0.5 size(SpontEM.lowPeak_Ylist_ephys_mean,2)*0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');

    %% plot the ephys trace for high peak traces (eye closures)

    % Sort based on the max speed of change
    SpontEM.highPeak_Ylist_ephys = [];

    for kk=1:size(SpontEM.highPeak_Xlist,1)
        SpontEM.highPeak_Ylist_ephys = [SpontEM.highPeak_Ylist_ephys; ((SpontEM.data_sync(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'-nanmean((SpontEM.data_sync(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'))];
    end

    SpontEM.highPeak_Ylist_ephys_spikes = [];
    for kk=1:size(SpontEM.highPeak_Xlist,1)
        SpontEM.highPeak_Ylist_ephys_spikes = [SpontEM.highPeak_Ylist_ephys_spikes; ((SpontEM.data_sync_spikes(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'-nanmean((SpontEM.data_sync(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs):(round(SpontEM.highPeak_Xlist(kk,1)*Spkdata.fs)+SpontEM.plotwidth*2*Spkdata.fs)))'))];
    end

    SpontEM.highPeak_Ylist_ephys_mean = nanmean(SpontEM.highPeak_Ylist_ephys);
    SpontEM.highPeak_Ylist_ephys_SD = nanstd(SpontEM.highPeak_Ylist_ephys);

    % Calculate the min-max difference
    SpontEM.highPeak_minmaxdiff = [min(SpontEM.highPeak_Ylist,[],2) max(SpontEM.highPeak_Ylist,[],2)];
    SpontEM.highPeak_minmaxdiff = [SpontEM.highPeak_minmaxdiff abs(SpontEM.highPeak_minmaxdiff(:,1)-SpontEM.highPeak_minmaxdiff(:,2))];

    [B_amp,IX_amp] = sort(SpontEM.highPeak_minmaxdiff(:,3),'descend');
    subplot(3,2,2); hold on;
    for kk=1:size(SpontEM.highPeak_Xlist,1)
        ii = IX_amp(kk);
        plot(SpontEM.highPeak_Ylist_ephys(ii,:));
        xlim([0 (SpontEM.plotwidth*2*Spkdata.fs)]);
    end

    subplot(3,2,2); hold on; plot(SpontEM.highPeak_Ylist_ephys_mean,'r'); title('Eye closure')
    plot(SpontEM.highPeak_Ylist_ephys_mean+SpontEM.highPeak_Ylist_ephys_SD,'k')
    plot(SpontEM.highPeak_Ylist_ephys_mean-SpontEM.highPeak_Ylist_ephys_SD,'k')
    % Line to indicate middle
    xlim([0 size(SpontEM.highPeak_Ylist_ephys_mean,2)]); ylim([-20 20]);
    line([size(SpontEM.highPeak_Ylist_ephys_mean,2)*0.5 size(SpontEM.highPeak_Ylist_ephys_mean,2)*0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');


    figname = sprintf('SpontEM_all_%s', Param.cellID);
    saveas(gcf,figname);
    print('-dpdf','-painters','-loose',figname)

    
    %%  Correlations between ephys amplitudes and eyelid movements
    %lowpeak (opening)
    [SpontEM.lowPeak_Ylist_ephys_Ymin SpontEM.lowPeak_Ylist_ephys_Xmin] = nanmin(SpontEM.lowPeak_Ylist_ephys,[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymin = abs(SpontEM.lowPeak_Ylist_ephys_Ymin);
    [SpontEM.lowPeak_Ylist_ephys_Ymax SpontEM.lowPeak_Ylist_ephys_Xmax] = nanmax(SpontEM.lowPeak_Ylist_ephys,[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymax = abs(SpontEM.lowPeak_Ylist_ephys_Ymax);

    figureFullScreen; subplot(2,4,1); hold on; title('Minimum ephys vs eyelid opening');
    scatter(SpontEM.lowPeak_minmaxdiff(:,3),SpontEM.lowPeak_Ylist_ephys_Ymin); xlabel('Amplitude of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.lowPeak_R SpontEM.lowPeak_P] = corrcoef(SpontEM.lowPeak_minmaxdiff(:,3),SpontEM.lowPeak_Ylist_ephys_Ymin);
    subplot(2,4,2); hold on; plot(SpontEM.lowPeak_pks',SpontEM.lowPeak_Ylist_ephys_Ymin,'bo'); xlabel('Maximum velocity of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.lowPeak_min_R SpontEM.lowPeak_min_P] = corrcoef(SpontEM.lowPeak_pks',SpontEM.lowPeak_Ylist_ephys_Ymin);

    subplot(2,4,3); hold on; title('Maximum ephys vs eyelid opening');
    scatter(SpontEM.lowPeak_minmaxdiff(:,3),SpontEM.lowPeak_Ylist_ephys_Ymax); xlabel('Amplitude of eyelid movement'); ylabel('Amplitude of EPSP');
    lsline; [SpontEM.lowPeak_R SpontEM.lowPeak_P] = corrcoef(SpontEM.lowPeak_minmaxdiff(:,3),SpontEM.lowPeak_Ylist_ephys_Ymax);
    subplot(2,4,4); hold on; plot(SpontEM.lowPeak_pks',SpontEM.lowPeak_Ylist_ephys_Ymax,'bo'); xlabel('Maximum velocity of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.lowPeak_R SpontEM.lowPeak_P] = corrcoef(SpontEM.lowPeak_pks',SpontEM.lowPeak_Ylist_ephys_Ymax);

    % Highpeak (closure)
    [SpontEM.highPeak_Ylist_ephys_Ymin SpontEM.highPeak_Ylist_ephys_Xmin] = nanmin(SpontEM.highPeak_Ylist_ephys,[],2);
    SpontEM.highPeak_Ylist_ephys_Ymin = abs(SpontEM.highPeak_Ylist_ephys_Ymin);
    [SpontEM.highPeak_Ylist_ephys_Ymax SpontEM.highPeak_Ylist_ephys_Xmax] = nanmax(SpontEM.highPeak_Ylist_ephys,[],2);
    SpontEM.highPeak_Ylist_ephys_Ymax = abs(SpontEM.highPeak_Ylist_ephys_Ymax);

    subplot(2,4,5); hold on; title('Minimum ephys vs eyelid closure');
    scatter(SpontEM.highPeak_minmaxdiff(:,3),SpontEM.highPeak_Ylist_ephys_Ymin); xlabel('Amplitude of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.highPeak_R SpontEM.highPeak_P] = corrcoef(SpontEM.highPeak_minmaxdiff(:,3),SpontEM.highPeak_Ylist_ephys_Ymin);
    subplot(2,4,6); hold on; plot(SpontEM.highPeak_pks',SpontEM.highPeak_Ylist_ephys_Ymin,'bo'); xlabel('Maximum velocity of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.highPeak_min_R SpontEM.highPeak_min_P] = corrcoef(SpontEM.highPeak_pks',SpontEM.highPeak_Ylist_ephys_Ymin);

    subplot(2,4,7); hold on; title('Maximum ephys vs eyelid closure');
    scatter(SpontEM.highPeak_minmaxdiff(:,3),SpontEM.highPeak_Ylist_ephys_Ymax); xlabel('Amplitude of eyelid movement'); ylabel('Amplitude of EPSP');
    lsline; [SpontEM.highPeak_R SpontEM.highPeak_P] = corrcoef(SpontEM.highPeak_minmaxdiff(:,3),SpontEM.highPeak_Ylist_ephys_Ymax);
    subplot(2,4,8); hold on; plot(SpontEM.highPeak_pks',SpontEM.highPeak_Ylist_ephys_Ymax,'bo'); xlabel('Maximum velocity of eyelid movement'); ylabel('Amplitude of IPSP');
    lsline; [SpontEM.highPeak_R SpontEM.highPeak_P] = corrcoef(SpontEM.highPeak_pks',SpontEM.highPeak_Ylist_ephys_Ymax);


    figname = sprintf('Correlation_ephysAmp-EM', Param.cellID);
    saveas(gcf,figname);
    print('-dpdf','-painters','-loose',figname)

    %% Correlate onset eyelid movement and ephys amplitude

    % opening
    % Determine max acceleration opening as onset
    for ii=1:size(SpontEM.lowPeak_Ylist_diffdiff,1)
        if sum(isnan(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))==0
            [SpontEM.lowPeak_diffdiff_Ytop(ii) SpontEM.lowPeak_diffdiff_Xtop(ii)] = nanmin(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs)));

        elseif sum(isnan(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))>0
            SpontEM.lowPeak_diffdiff_Ytop(ii) = NaN;
            SpontEM.lowPeak_diffdiff_Xtop(ii) = NaN;
        end
    end
    % Determine max acceleration closing
    for ii=1:size(SpontEM.highPeak_Ylist_diffdiff,1)
        if sum(isnan(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))==0
            [SpontEM.highPeak_diffdiff_Ytop(ii) SpontEM.highPeak_diffdiff_Xtop(ii)] = nanmax(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs)));

        elseif sum(isnan(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))>0
            SpontEM.highPeak_diffdiff_Ytop(ii) = NaN;
            SpontEM.highPeak_diffdiff_Xtop(ii) = NaN;
        end
    end

    % Time of amplitude IPSP vs time max acceleration
    figureFullScreen; subplot(2,2,1); hold on; title('Amplitude time IPSP vs onset eyelid opening');
    scatter(SpontEM.lowPeak_diffdiff_Xtop',SpontEM.lowPeak_Ylist_ephys_Xmin); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (IPSP)'); xlabel('Time of max acceleration eyelid opening');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude EPSP vs time max acceleration opening eyelid
    subplot(2,2,2); hold on; title('Amplitude time EPSP vs onset eyelid  opening');
    scatter(SpontEM.lowPeak_diffdiff_Xtop',SpontEM.lowPeak_Ylist_ephys_Xmax); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (EPSP)'); xlabel('Time of max acceleration eyelid opening');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude IPSP vs time max acceleration
    subplot(2,2,3); hold on; title('Amplitude time IPSP vs onset eyelid closing');
    scatter(SpontEM.highPeak_diffdiff_Xtop',SpontEM.highPeak_Ylist_ephys_Xmin); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (IPSP)'); xlabel('Time of max acceleration eyelid closing');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude EPSP vs time max acceleration closing eyelid
    subplot(2,2,4); hold on; title('Amplitude time EPSP vs onset eyelid closing');
    scatter(SpontEM.highPeak_diffdiff_Xtop',SpontEM.highPeak_Ylist_ephys_Xmax); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (EPSP)'); xlabel('Time of max acceleration eyelid closing');
    hline = refline([SpontEM.fsratio 0]);

    figname = sprintf('Correlation_ephysOnset-EMOnset', Param.cellID);
    saveas(gcf,figname);
    print('-dpdf','-painters','-loose',figname)


    %% Determine ephys onsets eyelid openings
    SpontEM.reftime_ephys = [-1:1/Spkdata.fs:1];
    SpontEM.reftime_behav = [-1:1/Param.fs:1];

    SpontEM.onset_EPSP_lowPeak = NaN(size(SpontEM.lowPeak_Ylist_ephys_Ymin,2),2);
    SpontEM.onset_EPSP_highPeak = NaN(size(SpontEM.lowPeak_Ylist_ephys_Ymin,2),2);
    SpontEM.onset_behav_lowPeak = NaN(size(SpontEM.lowPeak_Ylist_ephys_Ymin,2),2);
    SpontEM.onset_behav_highPeak = NaN(size(SpontEM.lowPeak_Ylist_ephys_Ymin,2),2);
    
    H(1)=figure; figureFullScreen(H(1));
    
    % EPSP cells
    if Param.cell_resp == 1
        for ii=1:size(SpontEM.lowPeak_Ylist_ephys_Ymin,1)
            if isnan(SpontEM.lowPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.lowPeak_Ylist_ephys(ii,0.5*Spkdata.fs:1.2*Spkdata.fs);
                plot(index,'r'); hold on;
                ylim([-10 10])
                line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Spkdata.fs 0.1*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    
                refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
                refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))
    
                title('Select 2 timepoints around EPSP onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Spkdata.fs) && xindex_ginput(2)<round(0.7*Spkdata.fs)
                    [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    SpontEM.onset_EPSP_lowPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_EPSP_lowPeak(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
    
                    figname = sprintf('EPSP_lowPeak_opening_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('EPSP_lowPeak_opening_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_EPSP_lowPeak(ii,1) =  NaN;
                    SpontEM.onset_EPSP_lowPeak(ii,2) = NaN;
                end
                    hold off; plot(NaN);
            end
    
                if isnan(SpontEM.lowPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.lowPeak_Ylist_diffdiff(ii,0.5*Param.fs:1.2*Param.fs);
                plot(index,'r'); hold on;
                index(isnan(index))=0;
                index=gfilt(index',Param.fs,0.0037);
                plot(index,'k');
    %             ylim([-10 10])
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Param.fs 0.1*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                         refline(0, 2*nanstd(index(1:round(0.25*Param.fs))))
                refline(0, -2*nanstd(index(1:round(0.25*Param.fs))))
    
                title('Select 2 timepoints around eyelid acceleration intersecting with lower SD line')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Param.fs) && xindex_ginput(2)<round(0.7*Param.fs)
                    try
                    [xindex y] = find(index(round(xindex_ginput(1)):round(xindex_ginput(2)))<-2*nanstd(index(1:round(0.25*Param.fs))),1,'first')
                    catch
                        [y xindex] = nanmean(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    end
                    SpontEM.onset_behav_lowPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_behav_lowPeak(ii,2) = index(SpontEM.onset_behav_lowPeak(ii,1));
                    plot(xindex+round(xindex_ginput(1)),SpontEM.onset_behav_lowPeak(ii,2),'g*')
                    pause;
                    axis on
    
                    figname = sprintf('Behav_lowPeak_opening_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Behav_lowPeak_opening_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_behav_lowPeak(ii,1) =  NaN;
                    SpontEM.onset_behav_lowPeak(ii,2) = NaN;
                end
    
                    hold off; plot(NaN);
            end
    
    
        end
    
    close(H(1))
    % Retrieve correct values
    SpontEM.onset_EPSP_lowPeak(:,1) = ((SpontEM.onset_EPSP_lowPeak(:,1)/Spkdata.fs))*1000;
    SpontEM.onset_behav_lowPeak(:,1) = ((SpontEM.onset_behav_lowPeak(:,1)/Param.fs))*1000;
    % SpontEM.onset_EPSP(:,1) = (SpontEM.onset_EPSP(:,1)-0.5)*1000;
    end
    
    % IPSP cells
    if Param.cell_resp == 2
        for ii=1:size(SpontEM.lowPeak_Ylist_ephys_Ymin,1)
            if isnan(SpontEM.lowPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.lowPeak_Ylist_ephys(ii,0.5*Spkdata.fs:1.2*Spkdata.fs);
                plot(index,'r'); hold on;
                ylim([-10 10])
                line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Spkdata.fs 0.1*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    
                refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
                refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))
    
                title('Select 2 timepoints around EPSP onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Spkdata.fs) && xindex_ginput(2)<round(0.7*Spkdata.fs)
                    [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    SpontEM.onset_EPSP_lowPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_EPSP_lowPeak(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
    
                    figname = sprintf('EPSP_lowPeak_opening_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('EPSP_lowPeak_opening_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_EPSP_lowPeak(ii,1) =  NaN;
                    SpontEM.onset_EPSP_lowPeak(ii,2) = NaN;
                end
                    hold off; plot(NaN);
            end
    
                if isnan(SpontEM.lowPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.lowPeak_Ylist_diffdiff(ii,0.5*Param.fs:1.2*Param.fs);
                plot(index,'r'); hold on;
                index(isnan(index))=0;
                index=gfilt(index',Param.fs,0.0037);
                plot(index,'k');
    %             ylim([-10 10])
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Param.fs 0.1*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                         refline(0, 2*nanstd(index(1:round(0.25*Param.fs))))
                refline(0, -2*nanstd(index(1:round(0.25*Param.fs))))
    
                title('Select 2 timepoints around eyelid acceleration intersecting with lower SD line')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Param.fs) && xindex_ginput(2)<round(0.7*Param.fs)
                    try
                    [xindex y] = find(index(round(xindex_ginput(1)):round(xindex_ginput(2)))<-2*nanstd(index(1:round(0.25*Param.fs))),1,'first')
                    catch
                        [y xindex] = nanmean(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    end
                    SpontEM.onset_behav_lowPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_behav_lowPeak(ii,2) = index(SpontEM.onset_behav_lowPeak(ii,1));
                    plot(xindex+round(xindex_ginput(1)),SpontEM.onset_behav_lowPeak(ii,2),'g*')
                    pause;
                    axis on
    
                    figname = sprintf('Behav_lowPeak_opening_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Behav_lowPeak_opening_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_behav_lowPeak(ii,1) =  NaN;
                    SpontEM.onset_behav_lowPeak(ii,2) = NaN;
                end
    
                    hold off; plot(NaN);
            end
    
    
        end
    
    close(H(1))
    % Retrieve correct values
    SpontEM.onset_EPSP_lowPeak(:,1) = ((SpontEM.onset_EPSP_lowPeak(:,1)/Spkdata.fs))*1000;
    SpontEM.onset_behav_lowPeak(:,1) = ((SpontEM.onset_behav_lowPeak(:,1)/Param.fs))*1000;
    % SpontEM.onset_EPSP(:,1) = (SpontEM.onset_EPSP(:,1)-0.5)*1000;
    end
    
    %% Onsets ephys during Eyelid closures
    
    H(1)=figure; figureFullScreen(H(1));
    
    % EPSP cells
    if Param.cell_resp == 1
        for ii=1:size(SpontEM.highPeak_Ylist_ephys_Ymin,1)
            if isnan(SpontEM.highPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.highPeak_Ylist_ephys(ii,0.5*Spkdata.fs:1.2*Spkdata.fs);
                plot(index,'r'); hold on;
                ylim([-10 10])
                line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Spkdata.fs 0.1*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    
                refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
                refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))
    
                title('Select 2 timepoints around EPSP onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Spkdata.fs) && xindex_ginput(2)<round(0.7*Spkdata.fs)
                    [y xindex] = nanmin(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    SpontEM.onset_EPSP_highPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_EPSP_highPeak(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
    
                    figname = sprintf('EPSP_highPeak_closure_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('EPSP_highPeak_closure_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_EPSP_highPeak(ii,1) =  NaN;
                    SpontEM.onset_EPSP_highPeak(ii,2) = NaN;
                end
                    hold off; plot(NaN);
            end
    
                if isnan(SpontEM.highPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.highPeak_Ylist_diffdiff(ii,0.5*Param.fs:1.2*Param.fs);
                plot(index,'r'); hold on;
                index(isnan(index))=0;
                index=gfilt(index',Param.fs,0.0037);
                plot(index,'k');
    %             ylim([-10 10])
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Param.fs 0.1*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                         refline(0, 2*nanstd(index(1:round(0.25*Param.fs))))
                refline(0, -2*nanstd(index(1:round(0.25*Param.fs))))
    
                title('Select 2 timepoints around eyelid acceleration intersecting with lower SD line')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Param.fs) && xindex_ginput(2)<round(0.7*Param.fs)
                    try
                    [xindex y] = find(index(round(xindex_ginput(1)):round(xindex_ginput(2)))>2*nanstd(index(1:round(0.25*Param.fs))),1,'first')
                    catch
                        [y xindex] = nanmean(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    end
                    SpontEM.onset_behav_highPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_behav_highPeak(ii,2) = index(SpontEM.onset_behav_highPeak(ii,1));
                    plot(xindex+round(xindex_ginput(1)),SpontEM.onset_behav_highPeak(ii,2),'g*')
                    pause;
                    axis on
    
                    figname = sprintf('Behav_highPeak_closure_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Behav_highPeak_closure_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_behav_highPeak(ii,1) =  NaN;
                    SpontEM.onset_behav_highPeak(ii,2) = NaN;
                end
    
                    hold off; plot(NaN);
            end
    
    
        end
    
    close(H(1))
    % Retrieve correct values
    SpontEM.onset_EPSP_highPeak(:,1) = ((SpontEM.onset_EPSP_highPeak(:,1)/Spkdata.fs))*1000;
    SpontEM.onset_behav_highPeak(:,1) = ((SpontEM.onset_behav_highPeak(:,1)/Param.fs))*1000;
    % SpontEM.onset_EPSP(:,1) = (SpontEM.onset_EPSP(:,1)-0.5)*1000;
    end
    
    % IPSP cells
    if Param.cell_resp == 2
        for ii=1:size(SpontEM.highPeak_Ylist_ephys_Ymin,1)
            if isnan(SpontEM.highPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.highPeak_Ylist_ephys(ii,0.5*Spkdata.fs:1.2*Spkdata.fs);
                plot(index,'r'); hold on;
                ylim([-10 10])
                line([0.5*Spkdata.fs 0.5*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Spkdata.fs 0.1*Spkdata.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
    
                refline(0, 2*nanstd(index(1:0.5*Spkdata.fs)))
                refline(0, -2*nanstd(index(1:0.5*Spkdata.fs)))
    
                title('Select 2 timepoints around EPSP onset')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Spkdata.fs) && xindex_ginput(2)<round(0.7*Spkdata.fs)
                    [y xindex] = nanmax(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    SpontEM.onset_EPSP_highPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_EPSP_highPeak(ii,2) = y;
                    plot(xindex+round(xindex_ginput(1)),y,'g*')
                    pause;
                    axis on
    
                    figname = sprintf('EPSP_highPeak_closure_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('EPSP_highPeak_closure_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_EPSP_highPeak(ii,1) =  NaN;
                    SpontEM.onset_EPSP_highPeak(ii,2) = NaN;
                end
                    hold off; plot(NaN);
            end
    
                if isnan(SpontEM.highPeak_Ylist_ephys_Ymin(1,1))==0
                ii
                index = SpontEM.highPeak_Ylist_diffdiff(ii,0.5*Param.fs:1.2*Param.fs);
                plot(index,'r'); hold on;
                index(isnan(index))=0;
                index=gfilt(index',Param.fs,0.0037);
                plot(index,'k');
    %             ylim([-10 10])
                line([0.5*Param.fs 0.5*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                            line([0.1*Param.fs 0.1*Param.fs],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
                         refline(0, 2*nanstd(index(1:round(0.25*Param.fs))))
                refline(0, -2*nanstd(index(1:round(0.25*Param.fs))))
    
                title('Select 2 timepoints around eyelid acceleration intersecting with lower SD line')
                [xindex_ginput y_ginput] = ginput(2);
                if xindex_ginput(1)>round(0.1*Param.fs) && xindex_ginput(2)<round(0.7*Param.fs)
                    try
                    [xindex y] = find(index(round(xindex_ginput(1)):round(xindex_ginput(2)))>2*nanstd(index(1:round(0.25*Param.fs))),1,'first')
                    catch
                        [y xindex] = nanmean(index(round(xindex_ginput(1)):round(xindex_ginput(2))));
                    end
                    SpontEM.onset_behav_highPeak(ii,1) = xindex+round(xindex_ginput(1));
                    SpontEM.onset_behav_highPeak(ii,2) = index(SpontEM.onset_behav_highPeak(ii,1));
                    plot(xindex+round(xindex_ginput(1)),SpontEM.onset_behav_highPeak(ii,2),'g*')
                    pause;
                    axis on
    
                    figname = sprintf('Behav_highPeak_closure_indOnset_%s_%s.fig',num2str(ii),Param.cellID)
                    saveas(gcf,figname,'fig');
                    figname = sprintf('Behav_highPeak_closure_indOnset_%s_%s.pdf',num2str(ii),Param.cellID)
                    print('-dpdf','-vector','-loose','-fillpage',figname)
                    hold off;
                else
                    SpontEM.onset_behav_highPeak(ii,1) =  NaN;
                    SpontEM.onset_behav_highPeak(ii,2) = NaN;
                end
    
                    hold off; plot(NaN);
            end
    
    
        end
    
    close(H(1))
    % Retrieve correct values
    SpontEM.onset_EPSP_highPeak(:,1) = ((SpontEM.onset_EPSP_highPeak(:,1)/Spkdata.fs))*1000;
    SpontEM.onset_behav_highPeak(:,1) = ((SpontEM.onset_behav_highPeak(:,1)/Param.fs))*1000;
    % SpontEM.onset_EPSP(:,1) = (SpontEM.onset_EPSP(:,1)-0.5)*1000;
    end


    %% Correlate onset eyelid movement and ephys amplitude

    % opening
    % Determine max acceleration opening as onset
    for ii=1:size(SpontEM.lowPeak_Ylist_diffdiff,1)
        if sum(isnan(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))==0
            [SpontEM.lowPeak_diffdiff_Ytop(ii) SpontEM.lowPeak_diffdiff_Xtop(ii)] = nanmin(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs)));

        elseif sum(isnan(SpontEM.lowPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))>0
            SpontEM.lowPeak_diffdiff_Ytop(ii) = NaN;
            SpontEM.lowPeak_diffdiff_Xtop(ii) = NaN;
        end
    end
    % Determine max acceleration closing
    for ii=1:size(SpontEM.highPeak_Ylist_diffdiff,1)
        if sum(isnan(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))==0
            [SpontEM.highPeak_diffdiff_Ytop(ii) SpontEM.highPeak_diffdiff_Xtop(ii)] = nanmax(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs)));

        elseif sum(isnan(SpontEM.highPeak_Ylist_diffdiff(ii,1:round(SpontEM.plotwidth*Param.fs))))>0
            SpontEM.highPeak_diffdiff_Ytop(ii) = NaN;
            SpontEM.highPeak_diffdiff_Xtop(ii) = NaN;
        end
    end

    % Time of amplitude IPSP vs time max acceleration
    figureFullScreen; subplot(2,2,1); hold on; title('Amplitude time IPSP vs onset eyelid opening');
    scatter(SpontEM.lowPeak_diffdiff_Xtop',SpontEM.lowPeak_Ylist_ephys_Xmin); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (IPSP)'); xlabel('Time of max acceleration eyelid opening');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude EPSP vs time max acceleration opening eyelid
    subplot(2,2,2); hold on; title('Amplitude time EPSP vs onset eyelid  opening');
    scatter(SpontEM.lowPeak_diffdiff_Xtop',SpontEM.lowPeak_Ylist_ephys_Xmax); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (EPSP)'); xlabel('Time of max acceleration eyelid opening');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude IPSP vs time max acceleration
    subplot(2,2,3); hold on; title('Amplitude time IPSP vs onset eyelid closing');
    scatter(SpontEM.highPeak_diffdiff_Xtop',SpontEM.highPeak_Ylist_ephys_Xmin); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (IPSP)'); xlabel('Time of max acceleration eyelid closing');
    hline = refline([SpontEM.fsratio 0]);

    % Time of amplitude EPSP vs time max acceleration closing eyelid
    subplot(2,2,4); hold on; title('Amplitude time EPSP vs onset eyelid closing');
    scatter(SpontEM.highPeak_diffdiff_Xtop',SpontEM.highPeak_Ylist_ephys_Xmax); ylim([0 2*10^5]); xlim([0 4883]);
    ylabel('Time of max amplitude ephys (EPSP)'); xlabel('Time of max acceleration eyelid closing');
    hline = refline([SpontEM.fsratio 0]);

    figname = sprintf('Correlation_ephysOnset-EMOnset', Param.cellID);
    saveas(gcf,figname);
    print('-dpdf','-painters','-loose',figname)


    %% Save
    savename = sprintf('%s_SpontEM.mat',Param.EphysdataFile);
    save(savename,'SpontEM');
    %  ,'P.peakAmpSpike'
    disp('Finished saving spontEM data')

end


%% Run ROC analysis on amplitudes of eyelid closures and eyelid openings
% manually load the SpontEM file

% Determine amplitudes of baseline (0-500ms before the eyelid movement)

%lowpeak (opening)
Spkdata.fs = 100000;
for jj =1:size(SpontEM.lowPeak_Ylist_ephys,1)
    [SpontEM.lowPeak_Ylist_ephys_Ymin_baseline(jj,:) SpontEM.lowPeak_Ylist_ephys_Xmin_baseline(jj,:)] = nanmin(SpontEM.lowPeak_Ylist_ephys(jj,0.25*Spkdata.fs:0.75*Spkdata.fs),[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymin_baseline(jj,:) = abs(SpontEM.lowPeak_Ylist_ephys_Ymin_baseline(jj,:));
    [SpontEM.lowPeak_Ylist_ephys_Ymax_baseline(jj,:) SpontEM.lowPeak_Ylist_ephys_Xmax_baseline(jj,:)] = nanmax(SpontEM.lowPeak_Ylist_ephys(jj,0.25*Spkdata.fs:0.75*Spkdata.fs),[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymax_baseline(jj,:) = abs(SpontEM.lowPeak_Ylist_ephys_Ymax_baseline(jj,:));
end

for jj =1:size(SpontEM.highPeak_Ylist_ephys,1)
    % Highpeak (closure)
    [SpontEM.highPeak_Ylist_ephys_Ymin_baseline(jj,:) SpontEM.highPeak_Ylist_ephys_Xmin_baseline(jj,:)] = nanmin(SpontEM.highPeak_Ylist_ephys(jj,0.25*Spkdata.fs:0.75*Spkdata.fs),[],2);
    SpontEM.highPeak_Ylist_ephys_Ymin_baseline(jj,:) = abs(SpontEM.highPeak_Ylist_ephys_Ymin_baseline(jj,:));
    [SpontEM.highPeak_Ylist_ephys_Ymax_baseline(jj,:) SpontEM.highPeak_Ylist_ephys_Xmax_baseline(jj,:)] = nanmax(SpontEM.highPeak_Ylist_ephys(jj,0.25*Spkdata.fs:0.75*Spkdata.fs),[],2);
    SpontEM.highPeak_Ylist_ephys_Ymax_baseline(jj,:) = abs(SpontEM.highPeak_Ylist_ephys_Ymax_baseline(jj,:));
end

% Amplitude
%lowpeak (opening)
Spkdata.fs = 100000;
for jj =1:size(SpontEM.lowPeak_Ylist_ephys,1)
    [SpontEM.lowPeak_Ylist_ephys_Ymin_ROC(jj,:) SpontEM.lowPeak_Ylist_ephys_Xmin_ROC(jj,:)] = nanmin(SpontEM.lowPeak_Ylist_ephys(jj,0.75*Spkdata.fs:1.25*Spkdata.fs),[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymin_ROC(jj,:) = abs(SpontEM.lowPeak_Ylist_ephys_Ymin_ROC(jj,:));
    [SpontEM.lowPeak_Ylist_ephys_Ymax_ROC(jj,:) SpontEM.lowPeak_Ylist_ephys_Xmax_ROC(jj,:)] = nanmax(SpontEM.lowPeak_Ylist_ephys(jj,0.75*Spkdata.fs:1.25*Spkdata.fs),[],2);
    SpontEM.lowPeak_Ylist_ephys_Ymax_ROC(jj,:) = abs(SpontEM.lowPeak_Ylist_ephys_Ymax_ROC(jj,:));
end

for jj =1:size(SpontEM.highPeak_Ylist_ephys,1)
    % Highpeak (closure)
    [SpontEM.highPeak_Ylist_ephys_Ymin_ROC(jj,:) SpontEM.highPeak_Ylist_ephys_Xmin_ROC(jj,:)] = nanmin(SpontEM.highPeak_Ylist_ephys(jj,0.75*Spkdata.fs:1.25*Spkdata.fs),[],2);
    SpontEM.highPeak_Ylist_ephys_Ymin_ROC(jj,:) = abs(SpontEM.highPeak_Ylist_ephys_Ymin_ROC(jj,:));
    [SpontEM.highPeak_Ylist_ephys_Ymax_ROC(jj,:) SpontEM.highPeak_Ylist_ephys_Xmax_ROC(jj,:)] = nanmax(SpontEM.highPeak_Ylist_ephys(jj,0.75*Spkdata.fs:1.25*Spkdata.fs),[],2);
    SpontEM.highPeak_Ylist_ephys_Ymax_ROC(jj,:) = abs(SpontEM.highPeak_Ylist_ephys_Ymax_ROC(jj,:));
end


%% Classify the lowpeak amps
try
    baseLine_EPSP =[];
    light_EPSP =[];

    % Ymin ephys
    baseLine_EPSP = SpontEM.lowPeak_Ylist_ephys_Ymin_baseline(isnan(SpontEM.lowPeak_Ylist_ephys_Ymin_baseline)==0);
    light_EPSP = SpontEM.lowPeak_Ylist_ephys_Ymin_ROC(isnan(SpontEM.lowPeak_Ylist_ephys_Ymin_ROC)==0);

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
    SpontEM.lowPeak_Ylist_ephys_Ymin_P_ROC = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P ROC ephys Ymin',SpontEM.lowPeak_Ylist_ephys_Ymin_P_ROC)]);

    figname = sprintf('SpontEM_classification_ephys_lowPeak_Ymin.fig');
    saveas(gcf,figname,'fig');
    figname = sprintf('SpontEM_classification_ephys_lowPeak_Ymin.pdf');
    print('-dpdf','-vector','-loose',figname);

catch
    disp('Error in classification')
    SpontEM.lowPeak_Ylist_ephys_Ymin_P_ROC=NaN;
end

try
    baseLine_EPSP =[];
    light_EPSP =[];

    % Ymax ephys
    baseLine_EPSP = SpontEM.lowPeak_Ylist_ephys_Ymax_baseline(isnan(SpontEM.lowPeak_Ylist_ephys_Ymax_baseline)==0);
    light_EPSP = SpontEM.lowPeak_Ylist_ephys_Ymax_ROC(isnan(SpontEM.lowPeak_Ylist_ephys_Ymax_ROC)==0);

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
    SpontEM.lowPeak_Ylist_ephys_Ymax_P_ROC = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P ROC ephys Ymax',SpontEM.lowPeak_Ylist_ephys_Ymax_P_ROC)]);

    figname = sprintf('SpontEM_classification_lowPeak_ephys_Ymax.fig');
    saveas(gcf,figname,'fig');
    figname = sprintf('SpontEM_classification_lowPeak_ephys_Ymax.pdf');
    print('-dpdf','-vector','-loose',figname);

catch
    disp('Error in classification')
    SpontEM.lowPeak_Ylist_ephys_Ymax_P_ROC=NaN;
end

try
    baseLine_EPSP =[];
    light_EPSP =[];

    % Ymin ephys
    baseLine_EPSP = SpontEM.highPeak_Ylist_ephys_Ymin_baseline(isnan(SpontEM.highPeak_Ylist_ephys_Ymin_baseline)==0);
    light_EPSP = SpontEM.highPeak_Ylist_ephys_Ymin_ROC(isnan(SpontEM.highPeak_Ylist_ephys_Ymin_ROC)==0);

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
    SpontEM.highPeak_Ylist_ephys_Ymin_P_ROC = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P ROC ephys Ymin',SpontEM.highPeak_Ylist_ephys_Ymin_P_ROC)]);

    figname = sprintf('SpontEM_classification_ephys_highPeak_Ymin.fig');
    saveas(gcf,figname,'fig');
    figname = sprintf('SpontEM_classification_ephys_highPeak_Ymin.pdf');
    print('-dpdf','-vector','-loose',figname);

catch
    disp('Error in classification')
    SpontEM.highPeak_Ylist_ephys_Ymin_P_ROC=NaN;
end

try
    baseLine_EPSP =[];
    light_EPSP =[];

    % Ymax ephys
    baseLine_EPSP = SpontEM.highPeak_Ylist_ephys_Ymax_baseline(isnan(SpontEM.highPeak_Ylist_ephys_Ymax_baseline)==0);
    light_EPSP = SpontEM.highPeak_Ylist_ephys_Ymax_ROC(isnan(SpontEM.highPeak_Ylist_ephys_Ymax_ROC)==0);

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
    SpontEM.highPeak_Ylist_ephys_Ymax_P_ROC = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed

    legend([sprintf('P ROC ephys Ymax',SpontEM.highPeak_Ylist_ephys_Ymax_P_ROC)]);

    figname = sprintf('SpontEM_classification_ephys_highPeak_Ymax.fig');
    saveas(gcf,figname,'fig');
    figname = sprintf('SpontEM_classification_ephys_highPeak_Ymax.pdf');
    print('-dpdf','-vector','-loose',figname);

catch
    disp('Error in classification')
    SpontEM.highPeak_Ylist_ephys_Ymax_P_ROC=NaN;
end

savename = 'SpontEM_inclROC+amplitudes.mat';
save(savename,'SpontEM','-v7.3');
%  ,'P.peakAmpSpike'
disp('Finished saving spontEM data')



