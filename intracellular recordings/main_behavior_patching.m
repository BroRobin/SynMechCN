%% Main intracellular data script
% This main script starts with defining the metadata for each cell to be
% analyzed. Then this script executes different other scripts that can be
% used to analyze different parts of the study. Often, these scripts
% require to be opened and edited before running them for each cell, as
% some parameters need to be adjusted for each cell. Some scripts are meant
% for an analysis at the group level. The order of scripts to run is a general
% guideline. Some scripts are dependent on the variables generated in preceding scripts.
% Most of these variables are also saved as various .mat files.

% (c) R. Broersen, Erasmus MC, 2023

clear all; close all;

for jj=1 % Define which cell will be analyzed
    if jj==1
        %% Trained
        %%Define the following variables per mouse
        Param.cellID =  '121115_1';
        Param.mouseID = '16987';
        Param.path   = '[path]\Trained\01-121115_1\behavior\16987'; % Define the path to the behavior files
        Param.block = 'Block-16'; % patching block
        Param.range = [1:66]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\01-121115_1'; % Define the path to the ephys files
        Param.EphysdataFile = '15n12007.abf'; % name of the ephys file
        Param.exclude_trials = [63:67]; % Define the range of trials to exclude
        Param.cell_resp =2; % Define the CS response (1 = CS activated, 2 = CS suppressed)

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
        Param.cell_resp =0;

    elseif jj==8
        Param.cellID =  '110517_2';
        Param.mouseID = '2404172';
        Param.path   = '[path]\Trained\08-110517_2\behavior\2404172';
        Param.block = 'Block-10'; % patching block
        Param.range = [0]; % Define range of trials to analyse. '0' if analyse all
        Param.path_ephys   = '[path]\Trained\08-110517_2';
        Param.EphysdataFile = '17511008.abf'; % name of the ephys file
        Param.exclude_trials = [1:2];
        Param.cell_resp =0;

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
        Param.cell_resp =1;

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
mkdir(['behavior_' Param.block]); % Only first time
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

% figure; hold on; plot(Eyeblink_signal.GoTr_TimeStamps,ones(size(Eyeblink_signal.GoTr_TimeStamps,1)),'k*'); plot(Eyeblink_signal.LtOn_TimeStamps,ones(size(Eyeblink_signal.LtOn_TimeStamps,1)),'g*'); plot(Eyeblink_signal.PfOn_TimeStamps,ones(size(Eyeblink_signal.PfOn_TimeStamps,1)),'b*')

%% Filter eyelid trace
Eyeblink_signal.adc_filt = gfilt(Eyeblink_signal.adc',Param.fs,0.0037)'; % 50Hz cutoff frequency

%% Process eyelid data
if jj==26 || jj==27 % 070917_2 and 060417_3
    process_eyelid_CRthresholdSDbaseline; % CR based on x*SD of baseline
else
    process_eyelid_CRthresholdURamp; % CR based on % of UR
end

%% Calculate parameters from the eyelid data
stats_behavior;

% cd([Param.path_ephys '\behavior']); mkdir('advanced'); % Only first time
cd([Param.path_ephys '\behavior\advanced'])
stats_behavior_advanced;
close all;

%% Process electrophysiology

% cd(Param.path_ephys);
% % mkdir('ephys'); % Only first time
cd([Param.path_ephys '\ephys'])
process_electrophysiology;

%% Calculate parameters CS
stats_CSelectrophysiology;
AUC_CS_USms;

%% Calculate parameters US
stats_USelectrophysiology;
close all;

%% Determine onsets from PSPs
process_onsetsephys;

%% Classify the CS and US responses
cd(Param.path_ephys);
mkdir('classification'); % Only first time
cd([Param.path_ephys '\classification']);
ROC_classification;

%% Generate average figures for Vm traces and eyelid traces
create_grandaverages;
create_cellresp_grandaverages;

%% Correlation PSP vs eyelid
process_correlation_prep;
population_correlation;

%% Generate timing figures (Vm aligned vs eyelid aligned)
% if trained mice:
alignBehavEphysOnset_trained;
% if naive mice:
alignBehavEphysOnset_naive;
% then:
alignBehavEphysOnset_groupcomparison;

%% Analyse spontaneous eyelid movements
sponteyelidanalysis;
alignBehavEphysOnset_spontEM;
alignBehavEphysOnset_spontEM_groupdata;

%% Analyse US traces
US_processing_naive;
US_processing_cond;
