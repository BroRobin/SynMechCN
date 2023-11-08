%% Determine spontaneous spike parameters
% Load spike times and calculate parameters of spike responses to CS and US
% stimuli. Also create graphs displaying spike activity as continuous
% traces.

% (c) R. Broersen, Erasmus MC, 2023

clear all;
allData.cellName={};
allData.excel_output=[];
allData.kde_10ms_CS_CR_norm = [];
allData.kde_10ms_CS_noCR_norm = [];
allData.kde_10ms_USonly_norm = [];
allData.kde_10ms_US_paired_CR_norm = [];
allData.kde_10ms_US_paired_noCR_norm = [];

allData.CS_noCR_avg = [];
allData.CS_CR_avg = [];
allData.US_paired_noCR_avg = [];
allData.US_paired_CR_avg = [];
allData.USonly_avg = [];

for LoopScript=15:192
    clearvars -except LoopScript allData
    close all
    if LoopScript==15
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-19';%Define the block number
        P.filename = '24-10-18_1';
        P.startEndSweep = [1 15];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==16
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-20';%Define the block number
        P.filename = '24-10-18_2';
        P.startEndSweep = [1 4];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==17
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-21';%Define the block number
        P.filename = '24-10-18_3a';
        P.startEndSweep = [1 67];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==21
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-28';%Define the block number
        P.filename = '24-10-18_7';
        P.startEndSweep = [1 80];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==23
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-30';%Define the block number
        P.filename = '24-10-18_9';
        P.startEndSweep = [1 49];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==24
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-31';%Define the block number
        P.filename = '24-10-18_10';
        P.startEndSweep = [1 31];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==26
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-34';%Define the block number
        P.filename = '24-10-18_12';
        P.startEndSweep = [1 108];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==27
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-35';%Define the block number
        P.filename = '24-10-18_13';
        P.startEndSweep = [1 103];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==28
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-36';%Define the block number
        P.filename = '24-10-18_14'
        P.startEndSweep = [1 10];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==29
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-37';%Define the block number
        P.filename = '24-10-18_15'
        P.startEndSweep = [1 50];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==30
        P.datatank = '1709181'; %Define the name of the datatank
        P.block = 'Block-38';%Define the block number
        P.filename = '24-10-18_16'
        P.startEndSweep = [1 7];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %
    elseif LoopScript==31
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-16';%Define the block number
        P.filename = '25-10-18_1'
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==32
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-17';%Define the block number
        P.filename = '25-10-18_2'
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==33
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-19';%Define the block number
        P.filename = '25-10-18_3'
        P.startEndSweep = [1 41];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==34
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-20';%Define the block number
        P.filename = '25-10-18_4'
        P.startEndSweep = [1 81];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
        %     elseif LoopScript==35
        %         P.datatank = '1709182'; %Define the name of the datatank
        %         P.block = 'Block-21';%Define the block number
        %         P.filename = '25-10-18_5'
        %         P.startEndSweep = [1 6];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'green';
        %%
    elseif LoopScript==36
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-22';%Define the block number
        P.filename = '25-10-18_6'
        P.startEndSweep = [1 6];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==37
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-25';%Define the block number
        P.filename = '25-10-18_7'
        P.startEndSweep = [1 20];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==38
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-26';%Define the block number
        P.filename = '25-10-18_8'
        P.startEndSweep = [1 19];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==39
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-28';%Define the block number
        P.filename = '25-10-18_9'
        P.startEndSweep = [1 8];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
        %     elseif LoopScript==40
        %         P.datatank = '1709182'; %Define the name of the datatank
        %         P.block = 'Block-29';%Define the block number
        %         P.filename = '25-10-18_10'
        %         P.startEndSweep = [1 33];
        %         P.excludeSweep = [1 2 3 4 5 6];
        %         P.LEDcolor = 'green';

        %%
    elseif LoopScript==41
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-30';%Define the block number
        P.filename = '25-10-18_11'
        P.startEndSweep = [1 10];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==42
        P.datatank = '1709182'; %Define the name of the datatank
        P.block = 'Block-32';%Define the block number
        P.filename = '25-10-18_12'
        P.startEndSweep = [1 19];
        P.excludeSweep = [15];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==43
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-15';%Define the block number
        P.filename = '25-10-18_1'
        P.startEndSweep = [1 56];
        P.excludeSweep = [];
        P.LEDcolor = 'green';

        %%
    elseif LoopScript==44
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-16';%Define the block number
        P.filename = '25-10-18_2'
        P.startEndSweep = [1 34];
        P.excludeSweep = [];
        P.LEDcolor = 'green';
        %%
    elseif LoopScript==45
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-18';%Define the block number
        P.filename = '27-10-18_1'
        P.startEndSweep = [1 76];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==46
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-19';%Define the block number
        P.filename = '27-10-18_2'
        P.startEndSweep = [1 9];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==47
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-22';%Define the block number
        P.filename = '27-10-18_3'
        P.startEndSweep = [1 213];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==48
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-23';%Define the block number
        P.filename = '27-10-18_4'
        P.startEndSweep = [1 10];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==49
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-24';%Define the block number
        P.filename = '27-10-18_5'
        P.startEndSweep = [1 36];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==50
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-25';%Define the block number
        P.filename = '29-10-18_1'
        P.startEndSweep = [1 77];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==51
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-27';%Define the block number
        P.filename = '29-10-18_2'
        P.startEndSweep = [1 49];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==52
        % P.datatank = '1709184'; %Define the name of the datatank
        % P.block = 'Block-28';%Define the block number
        % P.filename = '29-10-18_3'
        %%
    elseif LoopScript==53
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-29';%Define the block number
        P.filename = '29-10-18_4'
        P.startEndSweep = [1 10];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==54
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-31';%Define the block number
        P.filename = '29-10-18_5'
        P.startEndSweep = [1 24];
        P.excludeSweep = [1];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==55
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-32';%Define the block number
        P.filename = '29-10-18_6'
        P.startEndSweep = [1 73];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==56
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-33';%Define the block number
        P.filename = '29-10-18_7'
        P.startEndSweep = [1 55];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==57
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-34';%Define the block number
        P.filename = '29-10-18_8'
        P.startEndSweep = [1 29];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==58
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-35';%Define the block number
        P.filename = '29-10-18_9'
        P.startEndSweep = [1 4];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==59
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-38';%Define the block number
        P.filename = '29-10-18_10'
        P.startEndSweep = [1 6];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==60
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-16';%Define the block number
        P.filename = '30-10-18_1'
        P.startEndSweep = [1 7];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==61
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-17';%Define the block number
        P.filename = '30-10-18_2'
        P.startEndSweep = [1 28];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==62
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-18';%Define the block number
        P.filename = '30-10-18_3'
        P.startEndSweep = [1 13];
        P.excludeSweep = [1 2 3 4];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==63
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-19';%Define the block number
        P.filename = '30-10-18_4'
        P.startEndSweep = [1 13];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==64
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-22';%Define the block number
        P.filename = '30-10-18_5'
        P.startEndSweep = [1 4];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==65
        %         P.datatank = '2109182'; %Define the name of the datatank
        %         P.block = 'Block-23';%Define the block number
        %         P.filename = '30-10-18_6'
        %         P.startEndSweep = [1 3];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==66
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-24' %Define the block number
        P.filename = '30-10-18_7'
        P.startEndSweep = [1 14];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
        %     elseif LoopScript==67
        %         P.datatank = '1709184'; %Define the name of the datatank
        %         P.block = 'Block-39';%Define the block number
        %         P.filename = '30-10-18_1'
        %         P.startEndSweep = [1 8];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==68
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-40';%Define the block number
        P.filename = '30-10-18_2'
        P.startEndSweep = [1 16];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==69
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-41';%Define the block number
        P.filename = '30-10-18_3'
        P.startEndSweep = [1 45];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%

    elseif LoopScript==71
        P.datatank = '1709184'; %Define the name of the datatank
        P.block = 'Block-43';%Define the block number
        P.filename = '30-10-18_5'
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==72
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-27' %Define the block number
        P.filename = '31-10-18_1'
        P.startEndSweep = [1 18];
        P.excludeSweep = [4];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==73
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-28' %Define the block number
        P.filename = '31-10-18_2'
        P.startEndSweep = [1 34];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==74
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-29' %Define the block number
        P.filename = '31-10-18_3'
        P.startEndSweep = [1 77];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==75
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-30' %Define the block number
        P.filename = '31-10-18_4'
        P.startEndSweep = [1 129];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==76
        %         P.datatank = '2109182'; %Define the name of the datatank
        %         P.block = 'Block-31' %Define the block number
        %         P.filename = '31-10-18_5'
        %         P.startEndSweep = [1 3];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==77
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-32' %Define the block number
        P.filename = '31-10-18_6'
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==78
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-33' %Define the block number
        P.filename = '31-10-18_7'
        P.startEndSweep = [1 6];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==79
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-34' %Define the block number
        P.filename = '31-10-18_8'
        P.startEndSweep = [1 19];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==80
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-35' %Define the block number
        P.filename = '31-10-18_9'
        P.startEndSweep = [1 111];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==81
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-36' %Define the block number
        P.filename = '31-10-18_10'
        P.startEndSweep = [1 30];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==82
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-37' %Define the block number
        P.filename = '31-10-18_11'
        P.startEndSweep = [1 8];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==83
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-38' %Define the block number
        P.filename = '31-10-18_12'
        P.startEndSweep = [1 79];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==84
        P.datatank = '2109182'; %Define the name of the datatank
        P.block = 'Block-39' %Define the block number
        P.filename = '31-10-18_13'
        P.startEndSweep = [1 10];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==105
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-14' %Define the block number
        P.filename = '07-11-18_1'
        P.startEndSweep = [1 34];
        P.excludeSweep = [21 28 32];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==106
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-15' %Define the block number
        P.filename = '07-11-18_2'
        P.startEndSweep = [1 28];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==107
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-16' %Define the block number
        P.filename = '07-11-18_3'
        P.startEndSweep = [1 12];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==108
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-17' %Define the block number
        P.filename = '07-11-18_4'
        P.startEndSweep = [1 26];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==109
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-18' %Define the block number
        P.filename = '07-11-18_5'
        P.startEndSweep = [1 12];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==110
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-21' %Define the block number
        P.filename = '07-11-18_6'
        P.startEndSweep = [1 47];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==111
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-22' %Define the block number
        P.filename = '07-11-18_7'
        P.startEndSweep = [1 103];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==112
        %         P.datatank = '2109185'; %Define the name of the datatank
        %         P.block = 'Block-23' %Define the block number
        %         P.filename = '07-11-18_8'
        %         P.startEndSweep = [1 6];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==113
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-24' %Define the block number
        P.filename = '07-11-18_9'
        P.startEndSweep = [1 22];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==114
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-25' %Define the block number
        P.filename = '07-11-18_10'
        P.startEndSweep = [1 76];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==115
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-28' %Define the block number
        P.filename = '08-11-18_1'
        P.startEndSweep = [1 159];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==116
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-29' %Define the block number
        P.filename = '08-11-18_2'
        P.startEndSweep = [1 180];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==117
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-33' %Define the block number
        P.filename = '08-11-18_3'
        P.startEndSweep = [1 62];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==118
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-35' %Define the block number
        P.filename = '08-11-18_4'
        P.startEndSweep = [1 8];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==119
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-36' %Define the block number
        P.filename = '08-11-18_5'
        P.startEndSweep = [1 29];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==120
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-37' %Define the block number
        P.filename = '08-11-18_6'
        P.startEndSweep = [1 45];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==121
        P.datatank = '2109185'; %Define the name of the datatank
        P.block = 'Block-38' %Define the block number
        P.filename = '08-11-18_7'
        P.startEndSweep = [1 111];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %% BLUE LIGHT

        %
    elseif LoopScript==122
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-17' %Define the block number
        P.filename = '09-11-18_1'
        P.startEndSweep = [1 4];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';

        %
    elseif LoopScript==124
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-22' %Define the block number
        P.filename = '09-11-18_3'
        P.startEndSweep = [1 72];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==125
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-23' %Define the block number
        P.filename = '09-11-18_4'
        P.startEndSweep = [1 36];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==126
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-24' %Define the block number
        P.filename = '09-11-18_5'
        P.startEndSweep = [1 13];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';

        %%
    elseif LoopScript==128
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-27' %Define the block number
        P.filename = '09-11-18_7'
        P.startEndSweep = [1 28];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==129
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-28' %Define the block number
        P.filename = '09-11-18_8'
        P.startEndSweep = [1 24];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==130
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-30' %Define the block number
        P.filename = '09-11-18_9'
        P.startEndSweep = [1 9];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';

        %%
        %     elseif LoopScript==131
        %         P.datatank = '2609181'; %Define the name of the datatank
        %         P.block = 'Block-33' %Define the block number
        %         P.filename = '12-11-18_1'
        %         P.startEndSweep = [1 28];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==133
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-37' %Define the block number
        P.filename = '12-11-18_3'
        P.startEndSweep = [1 156];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==134
        %         P.datatank = '2609181'; %Define the name of the datatank
        %         P.block = 'Block-38' %Define the block number
        %         P.filename = '12-11-18_4'
        %         P.startEndSweep = [1 3];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==135
        P.datatank = '2609181'; %Define the name of the datatank
        P.block = 'Block-40' %Define the block number
        P.filename = '12-11-18_5'
        P.startEndSweep = [1 38];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==136
        %         P.datatank = '2609181'; %Define the name of the datatank
        %         P.block = 'Block-41' %Define the block number
        %         P.filename = '12-11-18_6'
        %         P.startEndSweep = [1 12];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==137
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-13'; %Define the block number
        %         P.filename = '13-11-18_1';
        %         P.startEndSweep = [1 5];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==138
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-15';%Define the block number
        %         P.filename = '13-11-18_2';
        %         P.startEndSweep = [1 4];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';

        %%
        %     elseif LoopScript==140
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-17';%Define the block number
        %         P.filename = '13-11-18_4';
        %         P.startEndSweep = [1 9];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==141
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-18';%Define the block number
        P.filename = '13-11-18_5';
        P.startEndSweep = [1 13];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==142
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-19';%Define the block number
        %         P.filename = '13-11-18_6';
        %         P.startEndSweep = [1 4];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==143
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-20';%Define the block number
        P.filename = '13-11-18_7';
        P.startEndSweep = [1 13];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==144
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-22';%Define the block number
        P.filename = '13-11-18_8';
        P.startEndSweep = [1 11];
        P.excludeSweep = [4];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==145
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-23';%Define the block number
        P.filename = '13-11-18_9';
        P.startEndSweep = [1 27];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %%
    elseif LoopScript==147
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-26';%Define the block number
        P.filename = '13-11-18_11';
        P.startEndSweep = [1 18];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %
    elseif LoopScript==148
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-28';%Define the block number
        P.filename = '13-11-18_12';
        P.startEndSweep = [1 30];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==149
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-29';%Define the block number
        P.filename = '13-11-18_13';
        P.startEndSweep = [1 6];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==150
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-30';%Define the block number
        P.filename = '13-11-18_14';
        P.startEndSweep = [1 52];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==151
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-31';%Define the block number
        P.filename = '13-11-18_15';
        P.startEndSweep = [1 23];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==152
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-33';%Define the block number
        %         P.filename = '13-11-18_16';
        %         P.startEndSweep = [1 4];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==153
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-34';%Define the block number
        P.filename = '13-11-18_17';
        P.startEndSweep = [1 7];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==154
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-35';%Define the block number
        %         P.filename = '13-11-18_18';
        %         P.startEndSweep = [1 6];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==155
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-36';%Define the block number
        P.filename = '13-11-18_19';
        P.startEndSweep = [1 12];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';


        %%
    elseif LoopScript==156
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-37'; %Define the block number
        P.filename = '14-11-18_1';
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
        %             elseif LoopScript==158
        %                 P.datatank = '2609182'; %Define the name of the datatank
        %                 P.block = 'Block-40'; %Define the block number
        %                 P.filename = '14-11-18_3';
        %                 P.startEndSweep = [1 8];
        %                 P.excludeSweep = [];
        %                 P.LEDcolor = 'blue';
        %
        %     elseif LoopScript==159
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-45'; %Define the block number
        %         P.filename = '14-11-18_4';
        %         P.startEndSweep = [1 5];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'blue';
        %%
    elseif LoopScript==160
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-46'; %Define the block number
        P.filename = '14-11-18_5';
        P.startEndSweep = [1 22];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
        %     elseif LoopScript==161
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-48'; %Define the block number
        %         P.filename = '14-11-18_6';
        %         P.startEndSweep = [1 19];
        %         P.excludeSweep = [1 2];
        %         P.LEDcolor = 'blue';
        %%
    elseif LoopScript==162
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-49'; %Define the block number
        P.filename = '14-11-18_7';
        P.startEndSweep = [1 24];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
        %     elseif LoopScript==163
        %         P.datatank = '2609182'; %Define the name of the datatank
        %         P.block = 'Block-50'; %Define the block number
        %         P.filename = '14-11-18_8';
        %         P.startEndSweep = [1 6];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'blue';
        %%
    elseif LoopScript==164
        P.datatank = '2609182'; %Define the name of the datatank
        P.block = 'Block-51'; %Define the block number
        P.filename = '14-11-18_9';
        P.startEndSweep = [1 22];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
        %             elseif LoopScript==165
        %                 P.datatank = '2609182'; %Define the name of the datatank
        %                 P.block = 'Block-52'; %Define the block number
        %                 P.filename = '14-11-18_10';
        %                 P.startEndSweep = [1 4];
        %                 P.excludeSweep = [];
        %                 P.LEDcolor = 'blue';
        %                 %%
        %             elseif LoopScript==166
        %                 P.datatank = '2609182'; %Define the name of the datatank
        %                 P.block = 'Block-53'; %Define the block number
        %                 P.filename = '14-11-18_11';
        %                 P.startEndSweep = [1 4];
        %                 P.excludeSweep = [];
        %                 P.LEDcolor = 'blue';
        %         %
        %             elseif LoopScript==167
        %                 P.datatank = '2609184'; %Define the name of the datatank
        %                 P.block = 'Block-17'; %Define the block number
        %                 P.filename = '15-11-18_1';
        %                 P.startEndSweep = [1 4];
        %                 P.excludeSweep = [];
        %                 P.LEDcolor = 'blue';
        %%
    elseif LoopScript==168
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-20'; %Define the block number
        P.filename = '15-11-18_2';
        P.startEndSweep = [1 20];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==169
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-21'; %Define the block number
        P.filename = '15-11-18_3';
        P.startEndSweep = [1 49];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==170
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-24'; %Define the block number
        P.filename = '15-11-18_4';
        P.startEndSweep = [1 54];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==171
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-25'; %Define the block number
        P.filename = '15-11-18_5';
        P.startEndSweep = [1 120];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==172
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-27'; %Define the block number
        P.filename = '15-11-18_6';
        P.startEndSweep = [1 29];
        P.excludeSweep = [1];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==174
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-31'; %Define the block number
        P.filename = '15-11-18_8';
        P.startEndSweep = [1 86];
        P.excludeSweep = [];
        P.LEDcolor = 'blue';
        %%
    elseif LoopScript==175
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-32'; %Define the block number
        P.filename = '15-11-18_9';
        P.startEndSweep = [1 13];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==176
        %         P.datatank = '2609184'; %Define the name of the datatank
        %         P.block = 'Block-33'; %Define the block number
        %         P.filename = '15-11-18_10';
        %         P.startEndSweep = [1 4];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
        %     elseif LoopScript==177
        %         P.datatank = '2609184'; %Define the name of the datatank
        %         P.block = 'Block-35'; %Define the block number
        %         P.filename = '15-11-18_11';
        %         P.startEndSweep = [1 8];
        %         P.excludeSweep = [];
        %         P.LEDcolor = 'amber';
        %%
    elseif LoopScript==178
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-37'; %Define the block number
        P.filename = '16-11-18_1';
        P.startEndSweep = [1 37];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==179
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-38'; %Define the block number
        P.filename = '16-11-18_2';
        P.startEndSweep = [1 52];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==180
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-39'; %Define the block number
        P.filename = '16-11-18_3';
        P.startEndSweep = [1 85];
        P.excludeSweep = [35 36];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==181
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-40'; %Define the block number
        P.filename = '16-11-18_4';
        P.startEndSweep = [1 18 ];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==182
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-41'; %Define the block number
        P.filename = '16-11-18_5';
        P.startEndSweep = [1 6];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==183
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-42'; %Define the block number
        P.filename = '16-11-18_6';
        P.startEndSweep = [1 5];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==184
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-43'; %Define the block number
        P.filename = '16-11-18_7';
        P.startEndSweep = [1 8];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==185
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-44'; %Define the block number
        P.filename = '16-11-18_8';
        P.startEndSweep = [1 7];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==186
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-45'; %Define the block number
        P.filename = '16-11-18_9';
        P.startEndSweep = [1 14];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==187
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-46'; %Define the block number
        P.filename = '16-11-18_10';
        P.startEndSweep = [1 3];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==188
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-47'; %Define the block number
        P.filename = '16-11-18_11';
        P.startEndSweep = [1 8];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';

        %%
    elseif LoopScript==191
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-53'; %Define the block number
        P.filename = '16-11-18_14';
        P.startEndSweep = [1 4];
        P.excludeSweep = [];
        P.LEDcolor = 'amber';
        %%
    elseif LoopScript==192
        P.datatank = '2609184'; %Define the name of the datatank
        P.block = 'Block-54'; %Define the block number
        P.filename = '16-11-18_15';
        P.startEndSweep = [1 18];
        P.excludeSweep = [5];
        P.LEDcolor = 'amber';

    else
        continue
    end


    %% General parameters
    P.path = '[path]'; %Define the location of the datatank
    P.ephysPath = '[path]'; %Define the location of the ephys file
    P.ephysRoot = '[path]';
    P.excelFilename = sprintf('%s_%s_output.xlsx',P.filename,P.datatank);
    P.TTLthreshold = 1.5; %Define the voltage threshold for TTL detection
    P.baselineThreshold = [-0.5 0.5]; %Define the max allowed variation in the baseline period
    P.CR_SDthreshold = 5; %Define the threshold of SD for CR detection
    P.closureThreshold = 50; % Exclude trials in which their average baseline closure exceeds xx% of max UR
    P.URonsetThreshold = 0.05; %Define the percentage used to calculate the onset of the UR
    P.amp_norm = 1; %Define the proportion to which the max UR peak should be scaled to calculate amplitudes (1=100% of the UR peak)
    P.savefig = 0; %Define 1 for yes, 0 for no
    P.savedata = 0; %Define 1 for yes, 0 for no
    P.saveindfig = 0; %Define 1 for yes, 0 for no

    % Load parameters ephys
    P.inputChannel = 1;
    P.cmdChannel = 11;
    P.GoTrChannel = 4;
    P.LtOnChannel = 5;
    P.PfOnChannel = 6;
    P.OptoChannel = 7;


    %% Load TDT datatank files (eyelid traces) using their set of scripts
    TT = actxcontrol('TTank.X');                    % start datatank control program

    try
        %Init Data Tanks
        ret = TT.ConnectServer('Local','Me');                 % server name and application name
        if ret == 0
            disp(strcat(int2str(curr_file_date_folder), '_', File_Info.Date, File_Info.Block, ': Error on connecting to server'));
            %     break
        end

        %Open Data Tank
        ret = TT.OpenTank(cd, 'R');   % path and mode; 'R' == read
        if ret == 0
            disp('Error on opening file');
            TT.ReleaseServer;
            %     break
        end

        %Open block
        ret = TT.SelectBlock(['~' P.block]);
        if ret == 0
            disp('Error on selecting block');
            TT.CloseTank;
            TT.ReleaseServer;
            %     break
        end

        % Read go trial TimeStamps
        N = TT.ReadEventsSimple('GoTr');
        NGoTr=N;
        if N > 0
            Pix_GoTr_TimeStamps = TT.ParseEvInfoV(0, N, 6); %Extract the TimeStamps
            Pix_GoTr_IDstim = TT.ParseEvInfoV(0, N, 7); %Extract the trial types
            fprintf('Reading %.f GoTr timepoints...\n',NGoTr);
        end
    end
    % Read mdmt

    try
        wave_y_data =[];
        wave_x_data =[];
        N = TT.ReadEventsV(2441.4*60, 'mdmt', 1, 0, 0, 0, 'ALL');
        if N > 0
            % Get Sampling frequency
            P.fs_mdmt = TT.ParseEvInfoV(0, 1, 9);
            P.Ts_mdmt = 1/P.fs_mdmt;
            %
            %Read all "Wave" y-data
            wave_y_data = TT.ParseEvV(0, N);
            wave_x_data = TT.ParseEvInfoV(0, N, 6);
            %
            P.dps_mdmt = size(wave_y_data, 1);
            %
            P.no_datapoints_mdmt = size(wave_y_data, 1)*size(wave_y_data, 2);
            %
            signal = struct (  't',        zeros(1, P.no_datapoints_mdmt), ...
                'adc',      zeros(1, P.no_datapoints_mdmt));
            % Reshape the y-data into wavedata-array
            signal.adc(1, :)  = reshape(wave_y_data, 1, P.no_datapoints_mdmt);
            % Reshape the x-data into wavedata-array
            for n = 1: size(wave_x_data, 2)
                signal.t(1, (n-1)*P.dps_mdmt+1: (n-1)*P.dps_mdmt+P.dps_mdmt) = wave_x_data(1, n): P.Ts_mdmt: wave_x_data(1,n)+(P.dps_mdmt-1)*P.Ts_mdmt;
            end
        end
    end
    signal.adc=signal.streams.mdmt.data;
    P.fs_mdmt=signal.streams.mdmt.fs;
    P.Ts_mdmt=1/P.fs_mdmt;
    signal.t=linspace(P.Ts_mdmt,P.Ts_mdmt*size(signal.streams.mdmt.data,2),size(signal.streams.mdmt.data,2));

    % Read GoMi
    try
        wave_y_data =[];
        wave_x_data =[];
        N = TT.ReadEventsV(2441.4*60, 'Wave', 1, 0, 0, 0, 'ALL');
        if N > 0
            % Get Sampling frequency
            P.fs_GoMi = TT.ParseEvInfoV(0, 1, 9);
            P.Ts_GoMi = 1/P.fs_GoMi;
            %
            %Read all "Wave" y-data
            wave_y_data = TT.ParseEvV(0, N);
            wave_x_data = TT.ParseEvInfoV(0, N, 6);
            %
            P.dps_GoMi = size(wave_y_data, 1);
            %
            P.no_datapoints_GoMi = size(wave_y_data, 1)*size(wave_y_data, 2);
            %
            signal_temp = struct (  't',        zeros(1, P.no_datapoints_GoMi), ...
                'adc',      zeros(1, P.no_datapoints_GoMi));
            % Reshape the y-data into wavedata-array
            signal_temp.adc(1, :)  = reshape(wave_y_data, 1, P.no_datapoints_GoMi);
            % Reshape the x-data into wavedata-array
            for n = 1: size(wave_x_data, 2)
                signal_temp.t(1, (n-1)*P.dps_GoMi+1: (n-1)*P.dps_GoMi+P.dps_GoMi) = wave_x_data(1, n): P.Ts_GoMi: wave_x_data(1,n)+(P.dps_GoMi-1)*P.Ts_GoMi;
            end
        end
        P.fs_GoMi=signal.streams.Wave.fs;
        P.Ts_GoMi=1/P.fs_GoMi;
        signal_temp.adc=signal.streams.Wave.data;


        % Detect GoMi onset times
        % Detect where the TTL pulse is on and register those datapoints
        TTLindex = diff(signal_temp.adc);
        index = find(TTLindex>1.5);
        signal.GoMi_Timestamps = index*P.Ts_GoMi;
        index_off = find(TTLindex<-1);
        signal.GoMi_Timestamps_off = index_off*P.Ts_GoMi;
        N=length(signal.GoMi_Timestamps);
        try
            for ii = 1:N-1
                if signal.GoMi_Timestamps(ii+1)<(signal.GoMi_Timestamps(ii)+2)
                    signal.GoMi_Timestamps(ii+1) = [];
                end
            end
        end

        N=length(signal.GoMi_Timestamps_off);
        try
            for ii = 1:N-1
                if signal.GoMi_Timestamps_off(ii+1)<(signal.GoMi_Timestamps_off(ii)+2)
                    signal.GoMi_Timestamps_off(ii+1) = [];
                end
            end
        end

        if sum(diff(signal.GoMi_Timestamps)<8)>0
            disp('Something went wrong in determining GoMi_Timestamps')
            figure; plot(signal_temp.adc)
            pause;
        end

        if length(signal.GoMi_Timestamps_off)==length(signal.GoMi_Timestamps)
            signal.GoMi_Timestamps_dur = signal.GoMi_Timestamps_off-signal.GoMi_Timestamps;
        elseif length(signal.GoMi_Timestamps_off)<length(signal.GoMi_Timestamps)
            disp('Something went wrong in calculating GoMi_TTL duration - adjusted length for duration calculation')
            signal.GoMi_Timestamps_dur = signal.GoMi_Timestamps_off-signal.GoMi_Timestamps(1:length(signal.GoMi_Timestamps_off));
        end

        if nansum(signal.GoMi_Timestamps_dur<1.9)>0
            disp('Something went wrong in determining GoMi_Timestamps')
            %     figure; plot(signal_temp.adc)
            signal.GoMi_Timestamps(signal.GoMi_Timestamps_dur<1.9)=[];
            signal.GoMi_Timestamps_off(signal.GoMi_Timestamps_dur<1.9)=[];
            signal.GoMi_Timestamps_dur(signal.GoMi_Timestamps_dur<1.9)=[];
            disp('Removed trials with short GoTr TTL duration')
            figure(gcf); hold on; plot(signal.GoMi_Timestamps*P.fs_GoMi,repmat(5,1,length(signal.GoMi_Timestamps)),'r*');
        end

        %% Read CSMi
        wave_y_data =[];
        wave_x_data =[];
        N = TT.ReadEventsV(2441.4*60, 'CSMi', 1, 0, 0, 0, 'ALL');
        if N > 0
            % Get Sampling frequency
            P.fs_CSMi = TT.ParseEvInfoV(0, 1, 9);
            P.Ts_CSMi = 1/P.fs_CSMi;
            %
            %Read all "Wave" y-data
            wave_y_data = TT.ParseEvV(0, N);
            wave_x_data = TT.ParseEvInfoV(0, N, 6);
            %
            P.dps_CSMi = size(wave_y_data, 1);
            %
            P.no_datapoints_CSMi = size(wave_y_data, 1)*size(wave_y_data, 2);
            %
            signal_temp = struct (  't',        zeros(1, P.no_datapoints_CSMi), ...
                'adc',      zeros(1, P.no_datapoints_CSMi));
            % Reshape the y-data into wavedata-array
            signal_temp.adc(1, :)  = reshape(wave_y_data, 1, P.no_datapoints_CSMi);
            % Reshape the x-data into wavedata-array
            for n = 1: size(wave_x_data, 2)
                signal_temp.t(1, (n-1)*P.dps_CSMi+1: (n-1)*P.dps_CSMi+P.dps_CSMi) = wave_x_data(1, n): P.Ts_CSMi: wave_x_data(1,n)+(P.dps_CSMi-1)*P.Ts_CSMi;
            end
        end
        P.fs_CSMi=signal.streams.CSMi.fs;
        P.Ts_CSMi=1/P.fs_CSMi;
        signal_temp.adc=signal.streams.CSMi.data;

        % Detect CSMi onset times
        % Detect where the TTL pulse is on and register those datapoints
        TTLindex = diff(signal_temp.adc);
        index = find(TTLindex>0.5);
        signal.CSMi_Timestamps = index*P.Ts_CSMi;
        index_off = find(TTLindex<-0.5);
        signal.CSMi_Timestamps_off = index_off*P.Ts_CSMi;
        N=length(signal.CSMi_Timestamps);
        try
            for ii = 1:N-1
                if signal.CSMi_Timestamps(ii+1)<(signal.CSMi_Timestamps(ii)+2)
                    signal.CSMi_Timestamps(ii+1) = [];
                end
            end
        end

        N=length(signal.CSMi_Timestamps_off);
        try
            for ii = 1:N-1
                if signal.CSMi_Timestamps_off(ii+1)<(signal.CSMi_Timestamps_off(ii)+2)
                    signal.CSMi_Timestamps_off(ii+1) = [];
                end
            end
        end

        if sum(diff(signal.CSMi_Timestamps)<7.9)>0
            disp('Something went wrong in determining CSMi_Timestamps')
        end

        if length(signal.CSMi_Timestamps_off)==length(signal.CSMi_Timestamps)
            signal.CSMi_Timestamps_dur = signal.CSMi_Timestamps_off-signal.CSMi_Timestamps;
        elseif length(signal.CSMi_Timestamps_off)<length(signal.CSMi_Timestamps)
            signal.CSMi_Timestamps_dur = signal.CSMi_Timestamps_off-signal.CSMi_Timestamps(1:length(signal.CSMi_Timestamps_off));
        end

        %% Read USMi
        wave_y_data =[];
        wave_x_data =[];
        N = TT.ReadEventsV(2441.4*60, 'USMi', 1, 0, 0, 0, 'ALL');
        if N > 0
            % Get Sampling frequency
            P.fs_USMi = TT.ParseEvInfoV(0, 1, 9);
            P.Ts_USMi = 1/P.fs_USMi;
            %
            %Read all "Wave" y-data
            wave_y_data = TT.ParseEvV(0, N);
            wave_x_data = TT.ParseEvInfoV(0, N, 6);
            %
            P.dps_USMi = size(wave_y_data, 1);
            %
            P.no_datapoints_USMi = size(wave_y_data, 1)*size(wave_y_data, 2);
            %
            signal_temp = struct (  't',        zeros(1, P.no_datapoints_USMi), ...
                'adc',      zeros(1, P.no_datapoints_USMi));
            % Reshape the y-data into wavedata-array
            signal_temp.adc(1, :)  = reshape(wave_y_data, 1, P.no_datapoints_USMi);
            % Reshape the x-data into wavedata-array
            for n = 1: size(wave_x_data, 2)
                signal_temp.t(1, (n-1)*P.dps_USMi+1: (n-1)*P.dps_USMi+P.dps_USMi) = wave_x_data(1, n): P.Ts_USMi: wave_x_data(1,n)+(P.dps_USMi-1)*P.Ts_USMi;
            end
        end

        P.fs_USMi=signal.streams.USMi.fs;
        P.Ts_USMi=1/P.fs_USMi;
        signal_temp.adc=signal.streams.USMi.data;

        % Detect USMi onset times
        % Detect where the TTL pulse is on and register those datapoints
        TTLindex = diff(signal_temp.adc);
        index = find(TTLindex>1.5);
        signal.USMi_Timestamps = index*P.Ts_USMi;
        index_off = find(TTLindex<-1);
        signal.USMi_Timestamps_off = index_off*P.Ts_USMi;
        N=length(signal.USMi_Timestamps);
        try
            for ii = 1:N-1
                if signal.USMi_Timestamps(ii+1)<(signal.USMi_Timestamps(ii)+2)
                    signal.USMi_Timestamps(ii+1) = [];
                end
            end
        end

        N=length(signal.USMi_Timestamps_off);
        try
            for ii = 1:N-1
                if signal.USMi_Timestamps_off(ii+1)<(signal.USMi_Timestamps_off(ii)+2) % smaller than 100ms
                    signal.USMi_Timestamps_off(ii+1) = [];
                end
            end
        end

        if sum(diff(signal.USMi_Timestamps)<7.9)>0
            disp('Something went wrong in determining USMi_Timestamps')
        end

        if length(signal.USMi_Timestamps_off)==length(signal.USMi_Timestamps)
            signal.USMi_Timestamps_dur = signal.USMi_Timestamps_off-signal.USMi_Timestamps;
        elseif length(signal.USMi_Timestamps_off)<length(signal.USMi_Timestamps)
            signal.USMi_Timestamps_dur = signal.USMi_Timestamps_off-signal.USMi_Timestamps(1:length(signal.USMi_Timestamps_off));
        end

        %% Read OpMi
        wave_y_data =[];
        wave_x_data =[];
        N = TT.ReadEventsV(2441.4*60, 'OpMi', 1, 0, 0, 0, 'ALL');
        if N > 0
            % Get Sampling frequency
            P.fs_OpMi = TT.ParseEvInfoV(0, 1, 9);
            P.Ts_OpMi = 1/P.fs_OpMi;
            %
            %Read all "Wave" y-data
            wave_y_data = TT.ParseEvV(0, N);
            wave_x_data = TT.ParseEvInfoV(0, N, 6);
            %
            P.dps_OpMi = size(wave_y_data, 1);
            %
            P.no_datapoints_OpMi = size(wave_y_data, 1)*size(wave_y_data, 2);
            %
            signal_temp = struct (  't',        zeros(1, P.no_datapoints_OpMi), ...
                'adc',      zeros(1, P.no_datapoints_OpMi));
            % Reshape the y-data into wavedata-array
            signal_temp.adc(1, :)  = reshape(wave_y_data, 1, P.no_datapoints_OpMi);
            % Reshape the x-data into wavedata-array
            for n = 1: size(wave_x_data, 2)
                signal_temp.t(1, (n-1)*P.dps_OpMi+1: (n-1)*P.dps_OpMi+P.dps_OpMi) = wave_x_data(1, n): P.Ts_OpMi: wave_x_data(1,n)+(P.dps_OpMi-1)*P.Ts_OpMi;
            end
        end

        P.fs_OpMi=signal.streams.OpMi.fs;
        P.Ts_OpMi=1/P.fs_OpMi;
        signal_temp.adc=signal.streams.OpMi.data;

        % Detect OpMi onset times
        % Detect where the TTL pulse is on and register those datapoints
        TTLindex = diff(signal_temp.adc);
        index = find(TTLindex>1.5);
        signal.OpMi_Timestamps = index*P.Ts_OpMi;
        index_off = find(TTLindex<-1);
        signal.OpMi_Timestamps_off = index_off*P.Ts_OpMi;
        N=length(signal.OpMi_Timestamps);
        try
            for ii = 1:N-1
                if signal.OpMi_Timestamps(ii+1)<(signal.OpMi_Timestamps(ii)+2)
                    signal.OpMi_Timestamps(ii+1) = [];
                end
            end
        end

        N=length(signal.OpMi_Timestamps_off);
        try
            for ii = 1:N-1
                if signal.OpMi_Timestamps_off(ii+1)<(signal.OpMi_Timestamps_off(ii)+2)% smaller than 100ms
                    signal.OpMi_Timestamps_off(ii+1) = [];
                end
            end
        end

        if sum(diff(signal.OpMi_Timestamps)<7.9)>0
            disp('Something went wrong in determining OpMi_Timestamps')
        end

        if length(signal.OpMi_Timestamps_off)==length(signal.OpMi_Timestamps)
            signal.OpMi_Timestamps_dur = signal.OpMi_Timestamps_off-signal.OpMi_Timestamps;
        elseif length(signal.OpMi_Timestamps_off)<length(signal.OpMi_Timestamps)
            signal.OpMi_Timestamps_dur = signal.OpMi_Timestamps_off-signal.OpMi_Timestamps(1:length(signal.OpMi_Timestamps_off));
        end

        %% Clear data to make space
        wave_y_data =[];
        wave_x_data =[];
        signal_temp = [];
        signal.GoTr_IDstim = [];
        signal.GoTr_TimeStamps = [];
        try
            if isequal(P.LEDcolor,'amber') | isequal(P.LEDcolor,'green')
                MFopto_Behaviour_ephys210524
                behavstatus = 1;
            elseif isequal(P.LEDcolor,'blue')
                MFopto_Behaviour_ephys210524_blue
                behavstatus = 1;
            end
        catch
            behavstatus = 0;
            disp('NO BEHAVIOR POSSIBLE, stop script')
            [P.datatank P.block]
            LoopScript
            pause;
        end


        %% Load ephys .abf files to determine CS and US timings
        try; figure; hold on; plot(Q.USonly_avg,'k'); end
        try; figure; hold on; plot(Q.CS_CR_avg,'g'); end
        try; plot(Q.CS_noCR_avg,'b'); end
        try; figure; hold on; plot(Q.US_paired_CR_avg,'g');end
        try; plot(Q.US_paired_noCR_avg,'b'); end

        cd(P.ephysPath);

        %   GoTr signal
        [Spkdata.d]=abf2load([P.ephysPath '/' P.filename '.abf'],'channels',{['IN ' num2str(P.GoTrChannel)]});
        Spkdata.GoTr_data = double(Spkdata.d);

        Spkdata.tempIndex=[];
        for ii = 1:size(Spkdata.GoTr_data,3)
            Spkdata.tempIndex = [Spkdata.tempIndex Spkdata.GoTr_data(:,:,ii)];
        end
        Spkdata.GoTr_data_vector=[];
        for ii = 1:size(Spkdata.tempIndex,2)
            Spkdata.GoTr_data_vector = [Spkdata.GoTr_data_vector Spkdata.tempIndex(:,ii)'];
        end

        % LtOn
        [Spkdata.d]=abf2load([P.ephysPath '/' P.filename '.abf'],'channels',{['IN ' num2str(P.LtOnChannel)]});
        Spkdata.LtOn_data = double(Spkdata.d);

        Spkdata.tempIndex=[];
        for ii = 1:size(Spkdata.LtOn_data,3)
            Spkdata.tempIndex = [Spkdata.tempIndex Spkdata.LtOn_data(:,:,ii)];
        end
        Spkdata.LtOn_data_vector=[];
        for ii = 1:size(Spkdata.tempIndex,2)
            Spkdata.LtOn_data_vector = [Spkdata.LtOn_data_vector Spkdata.tempIndex(:,ii)'];
        end

        %PfOn
        [Spkdata.d]=abf2load([P.ephysPath '/' P.filename '.abf'],'channels',{['IN ' num2str(P.PfOnChannel)]});
        Spkdata.PfOn_data = double(Spkdata.d);

        Spkdata.tempIndex=[];
        for ii = 1:size(Spkdata.PfOn_data,3)
            Spkdata.tempIndex = [Spkdata.tempIndex Spkdata.PfOn_data(:,:,ii)];
        end
        Spkdata.PfOn_data_vector=[];
        for ii = 1:size(Spkdata.tempIndex,2)
            Spkdata.PfOn_data_vector = [Spkdata.PfOn_data_vector Spkdata.tempIndex(:,ii)'];
        end

        %OptoChannel
        [Spkdata.d]=abf2load([P.ephysPath '/' P.filename '.abf'],'channels',{['IN ' num2str(P.OptoChannel)]});
        Spkdata.OptoChannel_data = double(Spkdata.d);

        Spkdata.tempIndex=[];
        for ii = 1:size(Spkdata.OptoChannel_data,3)
            Spkdata.tempIndex = [Spkdata.tempIndex Spkdata.OptoChannel_data(:,:,ii)];
        end
        Spkdata.OptoChannel_data_vector=[];
        for ii = 1:size(Spkdata.tempIndex,2)
            Spkdata.OptoChannel_data_vector = [Spkdata.OptoChannel_data_vector Spkdata.tempIndex(:,ii)'];
        end


        %% Visualize the TTL traces
        H(50) = figure; hold on;
        plot(Spkdata.GoTr_data_vector,'b'); plot(Spkdata.LtOn_data_vector,'g'); plot(Spkdata.PfOn_data_vector,'b'); plot(Spkdata.OptoChannel_data_vector,'r');

        %% Detect where the TTL pulse is on and register those datapoints
        % GoTr
        try
            TTLindex = find(Spkdata.GoTr_data>P.TTLthreshold);
            index = find(diff(TTLindex)>1.5);
            Spkdata.ind_GoTrTTLdata = NaN(length(index)+1,40000);

            for ii=1:length(index)+1
                if ii==1
                    Spkdata.ind_GoTrTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
                elseif 1<ii && ii<length(index)+1
                    Spkdata.ind_GoTrTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
                elseif ii==length(index)+1
                    Spkdata.ind_GoTrTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
                end
            end
            Spkdata.ind_GoTrTTLdata = Spkdata.ind_GoTrTTLdata(:,1);
            Spkdata.GoTr_data = [];
        catch
            Spkdata.GoTr_data = [];
        end

        % LtOn
        try
            TTLindex = find(Spkdata.LtOn_data>P.TTLthreshold);
            index = find(diff(TTLindex)>1.5);
            Spkdata.ind_LtOnTTLdata = NaN(length(index)+1,40000);

            for ii=1:length(index)+1
                if ii==1
                    Spkdata.ind_LtOnTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
                elseif 1<ii && ii<length(index)+1
                    Spkdata.ind_LtOnTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
                elseif ii==length(index)+1
                    Spkdata.ind_LtOnTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
                end
            end
            Spkdata.ind_LtOnTTLdata = Spkdata.ind_LtOnTTLdata(:,1);
            Spkdata.LtOn_data = [];
        catch
            Spkdata.LtOn_data = [];
        end

        % PfOn
        try
            TTLindex = find(Spkdata.PfOn_data>P.TTLthreshold);
            index = find(diff(TTLindex)>1.5);
            Spkdata.ind_PfOnTTLdata = NaN(length(index)+1,40000);

            for ii=1:length(index)+1
                if ii==1
                    Spkdata.ind_PfOnTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
                elseif 1<ii && ii<length(index)+1
                    Spkdata.ind_PfOnTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
                elseif ii==length(index)+1
                    Spkdata.ind_PfOnTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
                end
            end
            Spkdata.ind_PfOnTTLdata = Spkdata.ind_PfOnTTLdata(:,1);
            Spkdata.PfOn_data = [];
        catch
            Spkdata.PfOn_data = [];
        end

        % OptoChannel
        try
            TTLindex = find(Spkdata.OptoChannel_data>P.TTLthreshold);
            index = find(diff(TTLindex)>1.5);
            Spkdata.ind_OptoChannelTTLdata = NaN(length(index)+1,40000);

            for ii=1:length(index)+1
                if ii==1
                    Spkdata.ind_OptoChannelTTLdata(ii,1:length(TTLindex(1:index(ii)))) = TTLindex(1:index(ii));
                elseif 1<ii && ii<length(index)+1
                    Spkdata.ind_OptoChannelTTLdata(ii,1:length((index(ii-1)+1):index(ii))) = TTLindex((index(ii-1)+1):index(ii));
                elseif ii==length(index)+1
                    Spkdata.ind_OptoChannelTTLdata(ii,1:length(TTLindex((index(ii-1)+1):end))) = TTLindex((index(ii-1)+1):end);
                end
            end
            Spkdata.ind_OptoChannelTTLdata = Spkdata.ind_OptoChannelTTLdata(:,1);
            Spkdata.OptoChannel_data = [];
        catch
            Spkdata.OptoChannel_data = [];
        end

        %% Classify the TTL pulses of the Ephys files
        Spkdata.fs = 20000; % Calculate the sampling frequency
        Spkdata.recLength = length(Spkdata.GoTr_data_vector)/Spkdata.fs;
        Spkdata.Ts = 1/Spkdata.fs;
        Spkdata.ind_data_timestamps = [0:Spkdata.Ts:Spkdata.Ts*(40000-Spkdata.Ts)];

        % Convert into timestamps
        Spkdata.ind_GoTrTTLdata = Spkdata.ind_GoTrTTLdata*Spkdata.Ts;
        Spkdata.ind_LtOnTTLdata = Spkdata.ind_LtOnTTLdata*Spkdata.Ts;
        Spkdata.ind_PfOnTTLdata = Spkdata.ind_PfOnTTLdata*Spkdata.Ts;

        if isequal(P.LEDcolor,'blue')
            Extrac_classify_ephysTTL_stimID_blue
        elseif isequal(P.LEDcolor,'amber') || isequal(P.LEDcolor,'green')
            Extrac_classify_ephysTTL_stimID_AmberGreen
        end

        %% Load spike data

        cd(P.ephysPath);

        Spks = load([P.ephysPath '/' P.filename '_01.spi'],'-mat');
        Spks.spiketimes=Spks.S.Tm(Spks.S.NetId==1,6); % Spiketimes of spikes classified as '1' (peak positive slope)

        if isequal(signal.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2)),Spkdata.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2)))==0
            disp('!!!!!!ID stim Spkdata and Behavior are not equal!!!!!!!!!!!!!!!')
            disp('!signal.GoTr_IDstim is now changed to Spkdata.ind_GoTr_IDstim!')
            signal.GoTr_IDstim = Spkdata.GoTr_IDstim;
            signal.GoMi_Timestamps(P.startEndSweep(1):P.startEndSweep(2)) = NaN;
            % pause;
        elseif isequal(signal.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2)),Spkdata.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2)))==1
            disp('ID stim Spkdata and Behavior are equal')

            signal.GoMi_Timestamps = signal.GoMi_Timestamps(P.startEndSweep(1):P.startEndSweep(2));
            signal.GoMi_Timestamps_off = signal.GoMi_Timestamps_off(P.startEndSweep(1):P.startEndSweep(2));
            signal.GoMi_Timestamps_dur = signal.GoMi_Timestamps_dur(P.startEndSweep(1):P.startEndSweep(2));
            signal.GoTr_IDstim = signal.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2));
            signal.outlierindx_paired = signal.outlierindx_paired(P.startEndSweep(1):P.startEndSweep(2));
            signal.outlierfree_paired = signal.outlierfree_paired(P.startEndSweep(1):P.startEndSweep(2),:);
            signal.ind_trials = signal.ind_trials(P.startEndSweep(1):P.startEndSweep(2),:);
            signal.outlierindx_USonly = signal.outlierindx_USonly(P.startEndSweep(1):P.startEndSweep(2));
            signal.outlierfree_USonly = signal.outlierfree_USonly(P.startEndSweep(1):P.startEndSweep(2),:);
            signal.outlierindx_CSonly = signal.outlierindx_CSonly(P.startEndSweep(1):P.startEndSweep(2));
            signal.outlierfree_CSonly = signal.outlierfree_CSonly(P.startEndSweep(1):P.startEndSweep(2),:);
            signal.outlierindx_optoOnly = signal.outlierindx_optoOnly(P.startEndSweep(1):P.startEndSweep(2));
            signal.outlierfree_optoOnly = signal.outlierfree_optoOnly(P.startEndSweep(1):P.startEndSweep(2),:);

            % Exclude sweeps
            if numel(P.excludeSweep)>0
                for ii = 1:numel(P.excludeSweep)
                    signal.GoMi_Timestamps(P.excludeSweep(ii)) = NaN;
                    signal.GoMi_Timestamps_off(P.excludeSweep(ii)) = NaN;
                    signal.GoMi_Timestamps_dur(P.excludeSweep(ii)) = NaN;
                    signal.GoTr_IDstim(P.excludeSweep(ii)) = NaN;
                    signal.outlierindx_paired(P.excludeSweep(ii)) = NaN;;
                    signal.outlierfree_paired(P.excludeSweep(ii),:) = NaN;
                    signal.ind_trials(P.excludeSweep(ii),:) = NaN;
                    signal.outlierindx_USonly(P.excludeSweep(ii)) = NaN;
                    signal.outlierfree_USonly(P.excludeSweep(ii),:) = NaN;
                    signal.outlierindx_CSonly(P.excludeSweep(ii)) = NaN;
                    signal.outlierfree_CSonly(P.excludeSweep(ii),:) = NaN;
                    signal.outlierindx_optoOnly(P.excludeSweep(ii)) = NaN;
                    signal.outlierfree_optoOnly(P.excludeSweep(ii),:) = NaN;
                end
            end
        end


        %% Check length of recordings and exclude sweeps for ephys and behavior
        % Start to end sweeps
        Spks.spiketimes = Spks.spiketimes((Spks.spiketimes>=((P.startEndSweep(1)*8)-8) & Spks.spiketimes<=(P.startEndSweep(2)*8)));
        Spkdata.ind_GoTrTTLdata = Spkdata.ind_GoTrTTLdata(P.startEndSweep(1):P.startEndSweep(2));
        signal.GoTr_IDstim = signal.GoTr_IDstim(P.startEndSweep(1):P.startEndSweep(2));
        signal.GoMi_Timestamps = signal.GoMi_Timestamps(P.startEndSweep(1):P.startEndSweep(2));
        % Exclude sweeps
        if numel(P.excludeSweep)>0
            for ii = 1:numel(P.excludeSweep)
                Spks.spiketimes((Spks.spiketimes>=((P.excludeSweep(ii)*8)-8) & Spks.spiketimes<=(P.excludeSweep(ii)*8))) = [];
                Spkdata.ind_GoTrTTLdata(P.excludeSweep(ii),:) = NaN;
            end
        end

        % if size(Spkdata.ind_GoTrTTLdata,1)>size(signal.GoTr_IDstim,2)
        %     Spkdata.ind_GoTrTTLdata = Spkdata.ind_GoTrTTLdata(1:size(signal.GoTr_IDstim,2));
        %     disp('Corrected: number of ephys recorded trials > signal trials')
        % elseif size(signal.GoTr_IDstim,2)>size(Spkdata.ind_GoTrTTLdata,1)
        %     signal.GoTr_IDstim = signal.GoTr_IDstim(1:size(Spkdata.ind_GoTrTTLdata,1));
        %     disp('Corrected: number of signal trials > ephys recorded trials')
        % end

        %% Gather spikes for all individual trials
        Spks.ind_trial_spiketimes = {};
        Spks.excludeSweep_additional = [];
        for ii = 1:length(signal.GoTr_IDstim)
            Spks.ind_trial_spiketimes{ii} = (Spks.spiketimes((Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii) & Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii));
            if numel(Spks.ind_trial_spiketimes{ii})==0
                excl_trial_answer = input(sprintf('Warning: Trial %s does not contain spikes, exclude trial? (1=yes, 0 = no): ',num2str(ii)));
                if excl_trial_answer==1
                    Spks.excludeSweep_additional = [Spks.excludeSweep_additional ii];
                    Spks.spiketimes((Spks.spiketimes>((ii*8)-8) & Spks.spiketimes<=(ii*8))) = [];

                    signal.GoMi_Timestamps(ii) = NaN;
                    signal.GoMi_Timestamps_off(ii) = NaN;
                    signal.GoMi_Timestamps_dur(ii) = NaN;
                    signal.GoTr_IDstim(ii) = NaN;
                    signal.outlierindx_paired(ii) = NaN;;
                    signal.outlierfree_paired(ii,:) = NaN;
                    signal.ind_trials(ii,:) = NaN;
                    signal.outlierindx_USonly(ii) = NaN;
                    signal.outlierfree_USonly(ii,:) = NaN;
                    signal.outlierindx_CSonly(ii) = NaN;
                    signal.outlierfree_CSonly(ii,:) = NaN;
                    signal.outlierindx_optoOnly(ii) = NaN;
                    signal.outlierfree_optoOnly(ii,:) = NaN;

                    Spkdata.ind_GoTrTTLdata(ii,:) = NaN;
                    Spks.ind_trial_spiketimes{ii} = {};
                else
                    disp('Trial not excluded')
                end
            end
        end


        Spks.ind_trial_spiketimes_CS_CR = {};
        Spks.ind_trial_spiketimes_CS_noCR = {};
        Spks.ind_trial_spiketimes_US_paired_CR = {};
        Spks.ind_trial_spiketimes_US_paired_noCR = {};

        for ii = 1:length(signal.GoMi_Timestamps)
            if R.trial_CRs(ii,1)==1 || R.trial_CRs(ii,1)==2
                Spks.ind_trial_spiketimes_CS_CR = [Spks.ind_trial_spiketimes_CS_CR Spks.ind_trial_spiketimes{ii}];
            elseif R.trial_CRs(ii,1)==0 || R.trial_CRs(ii,1)==3
                Spks.ind_trial_spiketimes_CS_noCR = [Spks.ind_trial_spiketimes_CS_noCR Spks.ind_trial_spiketimes{ii}];
            end
            if R.trial_CRs(ii,1)==1
                Spks.ind_trial_spiketimes_US_paired_CR = [Spks.ind_trial_spiketimes_US_paired_CR Spks.ind_trial_spiketimes{ii}];
            elseif R.trial_CRs(ii,1)==0
                Spks.ind_trial_spiketimes_US_paired_noCR = [Spks.ind_trial_spiketimes_US_paired_noCR Spks.ind_trial_spiketimes{ii}];
            end
        end

        Spks.ind_trial_spiketimes_10 = {};
        Spks.ind_trial_spiketimes_11 = {};
        Spks.ind_trial_spiketimes_12 = {};
        Spks.ind_trial_spiketimes_13 = {};
        Spks.ind_trial_spiketimes_14 = {};
        Spks.ind_trial_spiketimes_15 = {};

        Spks.ind_trial_spiketimes_20 = {};
        Spks.ind_trial_spiketimes_21 = {};
        Spks.ind_trial_spiketimes_22 = {};
        Spks.ind_trial_spiketimes_23 = {};
        Spks.ind_trial_spiketimes_24 = {};
        Spks.ind_trial_spiketimes_25 = {};

        Spks.ind_trial_spiketimes_30 = {};
        Spks.ind_trial_spiketimes_31 = {};
        Spks.ind_trial_spiketimes_32 = {};
        Spks.ind_trial_spiketimes_33 = {};
        Spks.ind_trial_spiketimes_34 = {};
        Spks.ind_trial_spiketimes_35 = {};

        Spks.ind_trial_spiketimes_40 = {};
        Spks.ind_trial_spiketimes_41 = {};
        Spks.ind_trial_spiketimes_42 = {};
        Spks.ind_trial_spiketimes_43 = {};
        Spks.ind_trial_spiketimes_44 = {};
        Spks.ind_trial_spiketimes_45 = {};


        for ii = 1:length(signal.GoMi_Timestamps)
            switch signal.GoTr_IDstim(ii)
                case 10
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_10 = [Spks.ind_trial_spiketimes_10 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 11
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_11 = [Spks.ind_trial_spiketimes_11 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 12
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_12 = [Spks.ind_trial_spiketimes_12 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 13
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_13 = [Spks.ind_trial_spiketimes_13 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 14
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_14 = [Spks.ind_trial_spiketimes_14 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 15
                    %             if signal.outlierindx_CSonly(ii)==1
                    Spks.ind_trial_spiketimes_15 = [Spks.ind_trial_spiketimes_15 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 20
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_20 = [Spks.ind_trial_spiketimes_20 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 21
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_21 = [Spks.ind_trial_spiketimes_21 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 22
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_22 = [Spks.ind_trial_spiketimes_22 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 23
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_23 = [Spks.ind_trial_spiketimes_23 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 24
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_24 = [Spks.ind_trial_spiketimes_24 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 25
                    %             if signal.outlierindx_USonly(ii)==1
                    Spks.ind_trial_spiketimes_25 = [Spks.ind_trial_spiketimes_25 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 30
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_30 = [Spks.ind_trial_spiketimes_30 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 31
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_31 = [Spks.ind_trial_spiketimes_31 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 32
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_32 = [Spks.ind_trial_spiketimes_32 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 33
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_33 = [Spks.ind_trial_spiketimes_33 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 34
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_34 = [Spks.ind_trial_spiketimes_34 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 35
                    %             if signal.outlierindx_paired(ii)==1
                    Spks.ind_trial_spiketimes_35 = [Spks.ind_trial_spiketimes_35 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 40
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_40 = [Spks.ind_trial_spiketimes_40 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 41
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_41 = [Spks.ind_trial_spiketimes_41 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 42
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_42 = [Spks.ind_trial_spiketimes_42 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 43
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_43 = [Spks.ind_trial_spiketimes_43 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 44
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_44 = [Spks.ind_trial_spiketimes_44 Spks.ind_trial_spiketimes{ii}];
                    %             end
                case 45
                    %             if signal.outlierindx_optoOnly(ii)==1
                    Spks.ind_trial_spiketimes_45 = [Spks.ind_trial_spiketimes_45 Spks.ind_trial_spiketimes{ii}];
                    %             end
            end
        end

        %% Calculate spontaneous activity
        Extrac_calcSpont;

        %% Gather the spikes for each sweep ID
        Extrac_SpikesPerSweep_V2;


        %% Determine the responses

        Spks.stimuli.nBins_20ms = 100;
        Spks.stimuli.nBins_10ms = 200;
        Spks.stimuli.binEdges_20ms = [0:0.02:2];
        Spks.stimuli.binEdges_10ms = [0:0.01:2];
        Spks.stimuli.binEdges_1ms = [0:0.001:2];
        Spks.stimuli.nBins_1ms = 2000;

        % Combine the spikes for US/CS period responses
        Spks.stimuli.USperiod_combined = [Spks.stimuli.USonly_20 Spks.stimuli.paired_30];
        Spks.stimuli.USperiod_combined_idx = [Spks.stimuli.USonly_20_idx Spks.stimuli.paired_30_idx];

        Spks.stimuli.CSperiod_combined = [Spks.stimuli.CSonly_10 Spks.stimuli.paired_30];
        Spks.stimuli.CSperiod_combined_idx = [Spks.stimuli.CSonly_10_idx Spks.stimuli.paired_30_idx];

        %% Make PSTH + Scatter plots - calculate KDE
        MFopto_PSTHScatter_V2;
        if sum(Q.CS_CR_idx)>0
            [Spks.kde_10ms_CS_CR,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_CS_CR,[0 2]);
        else
            Spks.kde_10ms_CS_CR = NaN(1,2001);
        end
        if sum(Q.CS_noCR_idx)>0
            [Spks.kde_10ms_CS_noCR,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_CS_noCR,[0 2]);
        else
            Spks.kde_10ms_CS_noCR = NaN(1,2001);
        end
        if sum(Q.USonly_idx)>0
            [Spks.kde_10ms_USonly,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_20,[0 2]);
        else
            Spks.kde_10ms_USonly=NaN(1,2001);
        end
        if sum(Q.US_paired_CR_idx)>0
            [Spks.kde_10ms_US_paired_CR,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_US_paired_CR,[0 2]);
        else
            Spks.kde_10ms_US_paired_CR=NaN(1,2001);
        end
        if sum(Q.US_paired_noCR_idx)>0
            [Spks.kde_10ms_US_paired_noCR,testTimeVector] = gauss_kde_10ms(Spks.ind_trial_spiketimes_US_paired_noCR,[0 2]);
        else
            Spks.kde_10ms_US_paired_noCR=NaN(1,2001);
        end

        % Normalize the KDEs from 250-500 ms of baseline
        try
            Spks.kde_10ms_CS_CR_norm = Spks.kde_10ms_CS_CR-nanmean(Spks.kde_10ms_CS_CR(testTimeVector>0.25&testTimeVector<0.5));
        end
        try
            Spks.kde_10ms_CS_noCR_norm = Spks.kde_10ms_CS_noCR-nanmean(Spks.kde_10ms_CS_noCR(testTimeVector>0.25&testTimeVector<0.5));
        end
        try
            Spks.kde_10ms_USonly_norm = Spks.kde_10ms_USonly-nanmean(Spks.kde_10ms_USonly(testTimeVector>0.25&testTimeVector<0.5));
        end
        try
            Spks.kde_10ms_US_paired_CR_norm = Spks.kde_10ms_US_paired_CR-nanmean(Spks.kde_10ms_US_paired_CR(testTimeVector>0.25&testTimeVector<0.5));
        end
        try
            Spks.kde_10ms_US_paired_noCR_norm = Spks.kde_10ms_US_paired_noCR-nanmean(Spks.kde_10ms_US_paired_noCR(testTimeVector>0.25&testTimeVector<0.5));
        end


        figure; hold on; plot(Spks.kde_10ms_CS_CR_norm,'g'); plot(Spks.kde_10ms_CS_noCR_norm,'k')
        figure; hold on; plot(Spks.kde_10ms_US_paired_CR_norm,'g'); plot(Spks.kde_10ms_US_paired_noCR_norm,'k')

        %% Calculate properties spks
        Spkstats = [];
        % Max amplitude CS-US period (550 - 750ms)
        [Spkstats.maxamp_CS_CR_norm Spkstats.maxamp_CS_CR_peaktime] = nanmax(Spks.kde_10ms_CS_CR_norm(testTimeVector>0.55&testTimeVector<0.75));
        [Spkstats.maxamp_CS_noCR_norm Spkstats.maxamp_CS_noCR_peaktime]= nanmax(Spks.kde_10ms_CS_noCR_norm(testTimeVector>0.55&testTimeVector<0.75));
        Spkstats.maxamp_CS_CR_peaktime = Spkstats.maxamp_CS_CR_peaktime+(0.55*1000);
        Spkstats.maxamp_CS_noCR_peaktime = Spkstats.maxamp_CS_noCR_peaktime+(0.55*1000);

        % Max amplitude US period (760 - 1200ms)
        [Spkstats.maxamp_USonly_norm Spkstats.maxamp_USonly_peaktime] = nanmax(Spks.kde_10ms_USonly_norm(testTimeVector>0.76&testTimeVector<1.2));
        [Spkstats.maxamp_US_paired_CR_norm Spkstats.maxamp_US_paired_CR_peaktime] = nanmax(Spks.kde_10ms_US_paired_CR_norm(testTimeVector>0.76&testTimeVector<1.2));
        [Spkstats.maxamp_US_paired_noCR_norm Spkstats.maxamp_US_paired_noCR_peaktime] = nanmax(Spks.kde_10ms_US_paired_noCR_norm(testTimeVector>0.76&testTimeVector<1.2));
        Spkstats.maxamp_USonly_peaktime = Spkstats.maxamp_USonly_peaktime+(0.76*1000);
        Spkstats.maxamp_US_paired_CR_peaktime = Spkstats.maxamp_US_paired_CR_peaktime+(0.76*1000);
        Spkstats.maxamp_US_paired_noCR_peaktime = Spkstats.maxamp_US_paired_noCR_peaktime+(0.76*1000);

        % Min amplitude CS-US period
        [Spkstats.minamp_CS_CR_norm Spkstats.minamp_CS_CR_peaktime] = nanmin(Spks.kde_10ms_CS_CR_norm(testTimeVector>0.55&testTimeVector<0.75));
        [Spkstats.minamp_CS_noCR_norm Spkstats.minamp_CS_noCR_peaktime]= nanmin(Spks.kde_10ms_CS_noCR_norm(testTimeVector>0.55&testTimeVector<0.75));
        Spkstats.minamp_CS_CR_peaktime = Spkstats.minamp_CS_CR_peaktime+(0.55*1000);
        Spkstats.minamp_CS_noCR_peaktime = Spkstats.minamp_CS_noCR_peaktime+(0.55*1000);

        % Min amplitude US period
        [Spkstats.minamp_USonly_norm Spkstats.minamp_USonly_peaktime] = nanmin(Spks.kde_10ms_USonly_norm(testTimeVector>0.76&testTimeVector<1.2));
        [Spkstats.minamp_US_paired_CR_norm Spkstats.minamp_US_paired_CR_peaktime] = nanmin(Spks.kde_10ms_US_paired_CR_norm(testTimeVector>0.76&testTimeVector<1.2));
        [Spkstats.minamp_US_paired_noCR_norm Spkstats.minamp_US_paired_noCR_peaktime] = nanmin(Spks.kde_10ms_US_paired_noCR_norm(testTimeVector>0.76&testTimeVector<1.2));
        Spkstats.minamp_USonly_peaktime = Spkstats.minamp_USonly_peaktime+(0.76*1000);
        Spkstats.minamp_US_paired_CR_peaktime = Spkstats.minamp_US_paired_CR_peaktime+(0.76*1000);
        Spkstats.minamp_US_paired_noCR_peaktime = Spkstats.minamp_US_paired_noCR_peaktime+(0.76*1000);

        % Slope 200-250 ms after CS (Hz/s)
        Spkstats.CS_CR_norm_slope_200_250 = polyfit(1:length(Spks.kde_10ms_CS_CR_norm((0.7*1000):(0.75*1000))),Spks.kde_10ms_CS_CR_norm((0.7*1000):(0.75*1000)),1);
        Spkstats.CS_CR_norm_slope_200_250(1) = Spkstats.CS_CR_norm_slope_200_250(1)*(1/(50/51)); % convert to Hz/s
        Spkstats.CS_noCR_norm_slope_200_250 = polyfit(1:length(Spks.kde_10ms_CS_noCR_norm((0.7*1000):(0.75*1000))),Spks.kde_10ms_CS_noCR_norm((0.7*1000):(0.75*1000)),1);
        Spkstats.CS_noCR_norm_slope_200_250(1) = Spkstats.CS_noCR_norm_slope_200_250(1)*(1/(50/51));


        %% Calculate properties behaviour

        % Max amplitude CS-US period
        try
            [Q.maxamp_CS_CR_norm Q.maxamp_CS_CR_peaktime] = nanmax(Q.CS_CR_avg(round(0.55*P.fs_mdmt):round(0.75*P.fs_mdmt)));
        catch
            Q.maxamp_CS_CR_norm = NaN;
            Q.maxamp_CS_CR_peaktime = NaN;
        end
        try
            [Q.maxamp_CS_noCR_norm Q.maxamp_CS_noCR_peaktime] = nanmax(Q.CS_noCR_avg(round(0.55*P.fs_mdmt):round(0.75*P.fs_mdmt)));
        catch
            Q.maxamp_CS_noCR_norm = NaN;
            Q.maxamp_CS_noCR_peaktime = NaN;
        end
        Q.maxamp_CS_CR_peaktime = (Q.maxamp_CS_CR_peaktime+round(0.55*P.fs_mdmt))/P.fs_mdmt;
        Q.maxamp_CS_noCR_peaktime = (Q.maxamp_CS_noCR_peaktime+round(0.55*P.fs_mdmt))/P.fs_mdmt;

        % Max amplitude US period
        try
            [Q.maxamp_USonly Q.maxamp_USonly_peaktime] = nanmax(Q.USonly_avg(round(0.75*P.fs_mdmt):round(1.2*P.fs_mdmt)));
            Q.maxamp_USonly_peaktime = (Q.maxamp_USonly_peaktime+round(0.75*P.fs_mdmt))/P.fs_mdmt;
        catch
            Q.maxamp_USonly  = NaN;
            Q.maxamp_USonly_peaktime = NaN;
        end

        try
            [Q.maxamp_US_paired_CR Q.maxamp_US_paired_CR_peaktime] = nanmax(Q.US_paired_CR_avg(round(0.75*P.fs_mdmt):round(1.2*P.fs_mdmt)));
            Q.maxamp_US_paired_CR_peaktime = (Q.maxamp_US_paired_CR_peaktime+round(0.75*P.fs_mdmt))/P.fs_mdmt;
        catch
            Q.maxamp_US_paired_CR  = NaN;
            Q.maxamp_US_paired_CR_peaktime = NaN;
        end

        try
            [Q.maxamp_US_paired_noCR Q.maxamp_US_paired_noCR_peaktime] = nanmax(Q.US_paired_noCR_avg(round(0.75*P.fs_mdmt):round(1.2*P.fs_mdmt)));
            Q.maxamp_US_paired_noCR_peaktime = (Q.maxamp_US_paired_noCR_peaktime+round(0.75*P.fs_mdmt))/P.fs_mdmt;
        catch
            Q.maxamp_US_paired_noCR  = NaN;
            Q.maxamp_US_paired_noCR_peaktime = NaN;
        end

        % Halfwidth US response
        try
            index = Q.USonly_avg(round(0.75*P.fs_mdmt):end)>(Q.maxamp_USonly/2);
            Q.USonly_HW(1) = find(index,1,'first')+round(0.75*P.fs_mdmt);
            index = Q.USonly_avg(Q.USonly_HW(1):end)<(Q.maxamp_USonly/2); % first intersection after US onset
            Q.USonly_HW(2) = find(index,1,'first')+Q.USonly_HW(1); % second intersection after US onset
            Q.USonly_HW(3) = Q.USonly_HW(2)-Q.USonly_HW(1); % Calculate the difference
            Q.USonly_HW = Q.USonly_HW/P.fs_mdmt; % Convert to sec
        catch
            Q.USonly_HW(1:3) = NaN;
        end

        try
            index = Q.US_paired_CR_avg(round(0.75*P.fs_mdmt):end)>(Q.maxamp_US_paired_CR/2);
            Q.US_paired_CR_HW(1) = find(index,1,'first')+round(0.75*P.fs_mdmt);
            index = Q.US_paired_CR_avg(Q.US_paired_CR_HW(1):end)<(Q.maxamp_US_paired_CR/2); % first intersection after US onset
            Q.US_paired_CR_HW(2) = find(index,1,'first')+Q.US_paired_CR_HW(1); % second intersection after US onset
            Q.US_paired_CR_HW(3) = Q.US_paired_CR_HW(2)-Q.US_paired_CR_HW(1); % Calculate the difference
            Q.US_paired_CR_HW = Q.US_paired_CR_HW/P.fs_mdmt; % Convert to sec
        catch
            Q.US_paired_CR_HW(1:3) = NaN;
        end

        try
            index = Q.US_paired_noCR_avg(round(0.75*P.fs_mdmt):end)>(Q.maxamp_US_paired_noCR/2);
            Q.US_paired_noCR_HW(1) = find(index,1,'first')+round(0.75*P.fs_mdmt);
            index = Q.US_paired_noCR_avg(Q.US_paired_noCR_HW(1):end)<(Q.maxamp_US_paired_noCR/2); % first intersection after US onset
            Q.US_paired_noCR_HW(2) = find(index,1,'first')+Q.US_paired_noCR_HW(1); % second intersection after US onset
            Q.US_paired_noCR_HW(3) = Q.US_paired_noCR_HW(2)-Q.US_paired_noCR_HW(1); % Calculate the difference
            Q.US_paired_noCR_HW = Q.US_paired_noCR_HW/P.fs_mdmt; % Convert to sec
        catch
            Q.US_paired_noCR_HW(1:3) = NaN;
        end

        % Slope 200-250 ms after CS
        try
            Q.CS_CR_slope_200_250 = polyfit(1:length(Q.CS_CR_avg(round(0.7*P.fs_mdmt):round(0.75*P.fs_mdmt))),Q.CS_CR_avg(round(0.7*P.fs_mdmt):round(0.75*P.fs_mdmt)),1);
            Q.CS_CR_slope_200_250(1) = Q.CS_CR_slope_200_250(1)*(1/(50/123)); % Convert into %US per sec
        catch
            Q.CS_CR_slope_200_250(1:2) = NaN;
        end
        try
            Q.CS_noCR_slope_200_250 = polyfit(1:length(Q.CS_noCR_avg(round(0.7*P.fs_mdmt):round(0.75*P.fs_mdmt))),Q.CS_noCR_avg(round(0.7*P.fs_mdmt):round(0.75*P.fs_mdmt)),1);
            Q.CS_noCR_slope_200_250(1) = Q.CS_noCR_slope_200_250(1)*(1/(50/123)); % Convert into %US per sec
        catch
            Q.CS_noCR_slope_200_250(1:2) = NaN;
        end
        %% Excel sheet

        %ephys
        excel_output = [Spkstats.maxamp_CS_CR_norm Spkstats.maxamp_CS_CR_peaktime Spkstats.maxamp_CS_noCR_norm Spkstats.maxamp_CS_noCR_peaktime...
            Spkstats.minamp_CS_CR_norm Spkstats.minamp_CS_CR_peaktime Spkstats.minamp_CS_noCR_norm Spkstats.minamp_CS_noCR_peaktime...
            Spkstats.maxamp_USonly_norm Spkstats.maxamp_USonly_peaktime...
            Spkstats.maxamp_US_paired_CR_norm Spkstats.maxamp_US_paired_CR_peaktime...
            Spkstats.maxamp_US_paired_noCR_norm Spkstats.maxamp_US_paired_noCR_peaktime...
            Spkstats.CS_CR_norm_slope_200_250 Spkstats.CS_noCR_norm_slope_200_250...
            Q.maxamp_CS_CR_norm Q.maxamp_CS_CR_peaktime Q.maxamp_CS_noCR_norm Q.maxamp_CS_noCR_peaktime...
            Q.maxamp_USonly Q.maxamp_USonly_peaktime Q.maxamp_US_paired_CR Q.maxamp_US_paired_CR_peaktime Q.maxamp_US_paired_noCR Q.maxamp_US_paired_noCR_peaktime...
            Q.USonly_HW Q.US_paired_CR_HW Q.US_paired_noCR_HW...
            Q.CS_CR_slope_200_250 Q.CS_noCR_slope_200_250];

        %% Save data and figures
        allData.cellName=[allData.cellName; [P.datatank '_' P.block]];
        allData.excel_output=[allData.excel_output; excel_output];


        allData.kde_10ms_CS_CR_norm = [allData.kde_10ms_CS_CR_norm; Spks.kde_10ms_CS_CR_norm];
        allData.kde_10ms_CS_noCR_norm = [allData.kde_10ms_CS_noCR_norm; Spks.kde_10ms_CS_noCR_norm];
        allData.kde_10ms_USonly_norm = [allData.kde_10ms_USonly_norm; Spks.kde_10ms_USonly_norm];
        allData.kde_10ms_US_paired_CR_norm = [allData.kde_10ms_US_paired_CR_norm; Spks.kde_10ms_US_paired_CR_norm];
        allData.kde_10ms_US_paired_noCR_norm = [allData.kde_10ms_US_paired_noCR_norm; Spks.kde_10ms_US_paired_noCR_norm];

        try
            allData.CS_noCR_avg = [allData.CS_noCR_avg; Q.CS_noCR_avg];
        catch
            allData.CS_noCR_avg = [allData.CS_noCR_avg; NaN(1,4884)];
        end
        try
            allData.CS_CR_avg = [allData.CS_CR_avg; Q.CS_CR_avg];
        catch
            allData.CS_CR_avg = [allData.CS_CR_avg; NaN(1,4884)];
        end
        try
            allData.US_paired_noCR_avg = [allData.US_paired_noCR_avg; Q.US_paired_noCR_avg];
        catch
            allData.US_paired_noCR_avg = [allData.US_paired_noCR_avg; NaN(1,4884)];
        end
        try
            allData.US_paired_CR_avg = [allData.US_paired_CR_avg; Q.US_paired_CR_avg];
        catch
            allData.US_paired_CR_avg = [allData.US_paired_CR_avg; NaN(1,4884)];
        end
        try
            allData.USonly_avg = [allData.USonly_avg; Q.USonly_avg];
        catch
            allData.USonly_avg = [allData.USonly_avg; NaN(1,4884)];
        end

        cd([P.path])

        if P.savedata==1
            savename = sprintf('EphysDataOutput_%s_%s.mat',P.datatank, P.block);
            if             behavstatus ==1

                save(savename,'Q','P', 'R', 'signal','Spkdata','Spks','Spkstats','excel_output','allData','Spont');

            elseif behavstatus == 0

                save(savename,'Q','P', 'R', 'signal','Spkdata','Spks','Spkstats','excel_output','allData','Spont');
            end
        end
    end
end

