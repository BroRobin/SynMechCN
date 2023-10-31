%% Generate figures showing behavior and ephys data aligned to spontaneous eyelid onset or ephys onset
% (c) R. Broersen, Erasmus MC, 2023

% 1. Manually load SpontEM output .mat files for each cell.
% 2. Only execute the lines below for the cell that is analyzed.
% 3. Run the rest of the script for each cell.

%% Define the onsets of spontaneous eyelid movements and Vm responses
% Some cells already have onsets saved in the output file.

% Trained depolarizing responses

%181016_1
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_highPeak=[361.03	0.96
    452.43	-0.51
    NaN	NaN
    460.49	1.60
    NaN	NaN
    320.71	2.26
    391.68	-1.88
    326.62	0.11
    372.86	-1.83
    433.07	0.50
    NaN	NaN
    NaN	NaN
    312.64	1.20
    NaN	NaN
    388.45	0.11
    258.34	-1.92
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    379.31	2.11
    NaN	NaN
    465.33	-1.11
    NaN	NaN
    387.91	2.21
    398.67	0.60];

SpontEM.onset_behav_highPeak=[405.91	0.00
    369.87	0.00
    NaN	NaN
    385.43	0.00
    NaN	NaN
    335.87	0.00
    362.91	0.00
    309.66	0.00
    381.75	0.00
    381.34	0.00
    NaN	NaN
    NaN	NaN
    392.40	0.00
    NaN	NaN
    380.11	0.00
    370.69	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    322.76	0.00
    NaN	NaN
    402.23	0.00
    NaN	NaN
    391.99	0.00
    379.29	0.00];

%160317_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[458.34	0.04
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    483.61	-0.66
    ];

SpontEM.onset_behav_lowPeak=[395.67	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    410.83	0.00
    ];

%190417_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[NaN NaN
    401.84	-0.07
    475.01	2.69
    NaN	NaN
    NaN	NaN
    455.12	-1.14
    440.06	3.20
    430.92	1.87];

SpontEM.onset_behav_lowPeak=[NaN NaN
    422.30	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    367.82	0.00
    357.58	0.00];

%190417_2
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    480.39	3.40
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    418.02	-0.14
    NaN	NaN
    NaN	NaN
    371.25	-0.46
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    401.89	-0.82
    ];

SpontEM.onset_behav_lowPeak=[NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    435.40	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    345.70	0.00
    NaN	NaN
    NaN	NaN
    411.65	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    355.94	0.00
    ];

%110517_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[463.18	-2.99
    437.91	-4.64
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    454.04	-0.32
    444.90	-2.93
    NaN	NaN
    NaN	NaN
    419.10	-3.80
    NaN	NaN
    429.31	-1.16
    426.09	-3.70
    NaN	NaN
    NaN	NaN
    477.70	-0.74
    NaN	NaN
    NaN	NaN
    NaN	NaN
    445.98	-3.71
    NaN	NaN
    NaN	NaN
    NaN	NaN
    407.27	-2.98
    447.05	-3.96
    430.39	-5.68
    448.67	-0.72
    NaN	NaN
    436.84	-3.62
    435.76	-0.33
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    473.40	-3.13
    456.19	-2.73
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    457.81	1.82
    ];

SpontEM.onset_behav_lowPeak=[NaN	NaN
    416.15	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    414.11	0.00
    394.04	0.00
    NaN	NaN
    NaN	NaN
    437.86	0.00
    NaN	NaN
    379.29	0.00
    407.14	0.00
    NaN	NaN
    NaN	NaN
    477.70	-0.74
    NaN	NaN
    NaN	NaN
    NaN	NaN
    399.36	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    443.60	0.00
    373.15	0.00
    422.30	0.00
    396.08	0.00
    NaN	NaN
    399.36	0.00
    418.61	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    428.44	0.00
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    NaN	NaN
    404.68	0.00
    ];

%110517_1
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[443.39	0.09
    NaN	NaN
    NaN	NaN
    429.85	-1.51
    370.17	-2.17
    426.09	-3.85
    416.41	-1.15
    437.38	2.27
    397.05	-2.70
    457.27	-0.23
    363.18	-1.73
    NaN	NaN
    447.59	0.18
    367.48	-0.45
    NaN	NaN
    426.09	0.41
    401.35	-0.81
    329.31	-1.93
    NaN	NaN
    ];

SpontEM.onset_behav_lowPeak=[NaN	NaN
    NaN	NaN
    NaN	NaN
    417.79	0.00
    NaN	NaN
    419.84	0.00
    407.14	0.00
    396.08	0.00
    411.65	0.00
    NaN	NaN
    386.25	0.00
    NaN	NaN
    NaN	NaN
    378.06	0.00
    NaN	NaN
    416.15	0.00
    419.02	0.00
    366.59	0.00
    416.97	0.00
    ];

%110517_2
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_highPeak=[445.98	-2.58
    386.84	-2.43
    453.50	-3.34
    390.06	-2.12
    280.39	-2.59
    375.01	0.45
    467.48	-2.79
    508.88	-1.34
    470.17	-2.41
    461.03	-2.50
    502.43	-1.84
    405.66	-1.71];

SpontEM.onset_behav_highPeak=[NaN	NaN
    432.54	0.00
    378.88	0.00
    412.88	0.00
    413.70	0.00
    440.32	0.00
    408.37	0.00
    414.52	0.00
    405.09	0.00
    404.68	0.00
    401.41	0.00
    416.15	0.00];

%211216_1
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_highPeak=[426.09	0.89
    390.60	-0.23
    401.89	-0.91
    NaN	NaN
    NaN	NaN
    404.04	0.29
    NaN	NaN
    NaN	NaN
    449.20	0.04
    NaN	NaN
    365.33	-2.64
    ];

SpontEM.onset_behav_highPeak=[339.56	0.00
    334.64	0.00
    345.29	0.00
    NaN	NaN
    NaN	NaN
    335.05	0.00
    NaN	NaN
    NaN	NaN
    326.45	0.00
    NaN	NaN
    420.66	0.00
    ];


%% Naive depolarizing responses

%020516_1
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_lowPeak=[443.29	-1.72016432
    445.98	0.485145443
    459.96	-0.26112045
    NaN	NaN
    NaN	NaN
    432	-1.786315113
    NaN	NaN
    437.38	0.523052359
    447.59	1.619020795
    NaN	NaN
    395.44	-0.022480815
    440.06	-1.42941946
    NaN	NaN
    477.16	-1.299771439
    427.16	0.714913815
    456.73	1.640124969
    NaN	NaN
    438.45	0.619773374
    462.64	3.76057439
    423.4	1.638731543
    ];

SpontEM.onset_behav_lowPeak=[451.7888	-3.43E-05
    450.56	-2.77E-05
    453.0176	-2.62E-05
    435.4048	-3.05E-05
    461.2096	-2.43E-05
    450.9696	-4.72E-05
    457.9328	-4.43E-05
    435.8144	-2.43E-05
    458.3424	-3.29E-05
    458.3424	-2.91E-05
    443.1872	-2.19E-05
    454.2464	-2.57E-05
    460.3904	-2.72E-05
    454.656	-2.77E-05
    459.9808	-2.53E-05
    454.656	-3.34E-05
    452.1984	-3.19E-05
    460.3904	-2.96E-05
    453.0176	-2.34E-05
    450.9696	-2.57E-05
    ];

%020516_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

%300516_1
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

%210317_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

%210317_2
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

%% Trained hyperpolarizing responses

%121115_1
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

%190417_2
CS.resp = 1; %1=lowpeak openings/2=highpeak closures

%220217_3
CS.resp = 2; %1=lowpeak openings/2=highpeak closures

SpontEM.onset_EPSP_highPeak=[NaN	NaN
    NaN	NaN
    390.54	1.73
    376.71	-0.23
    ];

SpontEM.onset_behav_highPeak=[NaN	NaN
    NaN	NaN
    390.35	0.00
    340.79	0.00
    ];


%% Naive hyperpolarizing responses

%300516_3
CS.resp = 1; %1=lowpeak openings/2=highpeak closures


%% Consider 250 ms before and after onset

xtimes_behav = [-0.25:(2/4884):0.25];
xtimes_Vm = [-0.25:(1/100000):0.25];
Param.fs = 4884/2;

%Align to eyelid onset
Onsetnorm.eyelidOnset_eyelid_trials = NaN(500,1222);
Onsetnorm.eyelidOnset_Vm_trials = NaN(500,50001);


%  for ii=1:size(SpontEM.onset_EPSP_lowPeak,1)
for ii=1:size(SpontEM.onset_EPSP_highPeak,1)

    idx=[];
    idx_Vm=[];
    if CS.resp==1
        if isnan(SpontEM.onset_EPSP_lowPeak(ii,1))==0 && isnan(SpontEM.onset_behav_lowPeak(ii,1))==0
            idx = round((((SpontEM.onset_behav_lowPeak(ii,1))+500)*10^-3)*Param.fs);
            Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=SpontEM.lowPeak_Ylist(ii,round(idx-(0.25*Param.fs)):round(idx+(0.25*Param.fs)));
            Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Onsetnorm.eyelidOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_eyelid_trials(ii,1:0.25*Param.fs));
            idx = round((((SpontEM.onset_behav_lowPeak(ii,1))+500)*10^-3)*100000);
            idx_Vm = SpontEM.lowPeak_Ylist_ephys(ii,:);
            Onsetnorm.eyelidOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.25*100000):idx+(0.25*100000));
            Onsetnorm.eyelidOnset_Vm_trials(ii,:)=Onsetnorm.eyelidOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_Vm_trials(ii,1:0.25*100000));
        end
    elseif CS.resp==2
        if isnan(SpontEM.onset_EPSP_highPeak(ii,1))==0 && isnan(SpontEM.onset_behav_highPeak(ii,1))==0
            idx = round((((SpontEM.onset_behav_highPeak(ii,1))+500)*10^-3)*Param.fs);
            Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=SpontEM.highPeak_Ylist(ii,round(idx-(0.25*Param.fs)):round(idx+(0.25*Param.fs)));
            Onsetnorm.eyelidOnset_eyelid_trials(ii,:)=Onsetnorm.eyelidOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_eyelid_trials(ii,1:0.25*Param.fs));
            idx = round((((SpontEM.onset_behav_highPeak(ii,1))+500)*10^-3)*100000);
            idx_Vm = SpontEM.highPeak_Ylist_ephys(ii,:);
            Onsetnorm.eyelidOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.25*100000):idx+(0.25*100000));
            Onsetnorm.eyelidOnset_Vm_trials(ii,:)=Onsetnorm.eyelidOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.eyelidOnset_Vm_trials(ii,1:0.25*100000));
        end
    end
end

% Create figure
figure; subplot(2,1,1); plot(xtimes_behav,nanmean(Onsetnorm.eyelidOnset_eyelid_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); plot(xtimes_Vm,nanmean(Onsetnorm.eyelidOnset_Vm_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])


%Align to Vm onset
Onsetnorm.VmOnset_eyelid_trials = NaN(500,1222);
Onsetnorm.VmOnset_Vm_trials = NaN(500,50001);

% for ii=1:size(SpontEM.onset_EPSP_lowPeak,1)
for ii=1:size(SpontEM.onset_EPSP_highPeak,1)
    idx=[];
    idx_Vm=[];
    if CS.resp==1
        if isnan(SpontEM.onset_EPSP_lowPeak(ii,1))==0 && isnan(SpontEM.onset_behav_lowPeak(ii,1))==0
            idx = round((((SpontEM.onset_EPSP_lowPeak(ii,1))+500)*10^-3)*Param.fs);
            Onsetnorm.VmOnset_eyelid_trials(ii,:)=SpontEM.lowPeak_Ylist(ii,round(idx-(0.25*Param.fs)):round(idx+(0.25*Param.fs)));
            Onsetnorm.VmOnset_eyelid_trials(ii,:)=Onsetnorm.VmOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.VmOnset_eyelid_trials(ii,1:0.25*Param.fs));
            idx = round((((SpontEM.onset_EPSP_lowPeak(ii,1))+500)*10^-3)*100000);
            idx_Vm = SpontEM.lowPeak_Ylist_ephys(ii,:);
            Onsetnorm.VmOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.25*100000):idx+(0.25*100000));
            Onsetnorm.VmOnset_Vm_trials(ii,:)=Onsetnorm.VmOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.VmOnset_Vm_trials(ii,1:0.25*100000));
        end
    elseif CS.resp==2
        if isnan(SpontEM.onset_EPSP_highPeak(ii,1))==0 && isnan(SpontEM.onset_behav_highPeak(ii,1))==0
            idx = round((((SpontEM.onset_EPSP_highPeak(ii,1))+500)*10^-3)*Param.fs);
            Onsetnorm.VmOnset_eyelid_trials(ii,:)=SpontEM.highPeak_Ylist(ii,round(idx-(0.25*Param.fs)):round(idx+(0.25*Param.fs)));
            Onsetnorm.VmOnset_eyelid_trials(ii,:)=Onsetnorm.VmOnset_eyelid_trials(ii,:)-nanmean(Onsetnorm.VmOnset_eyelid_trials(ii,1:0.25*Param.fs));
            idx = round((((SpontEM.onset_EPSP_highPeak(ii,1))+500)*10^-3)*100000);
            idx_Vm = SpontEM.highPeak_Ylist_ephys(ii,:);
            Onsetnorm.VmOnset_Vm_trials(ii,:)=idx_Vm(idx-(0.25*100000):idx+(0.25*100000));
            Onsetnorm.VmOnset_Vm_trials(ii,:)=Onsetnorm.VmOnset_Vm_trials(ii,:)-nanmean(Onsetnorm.VmOnset_Vm_trials(ii,1:0.25*100000));
        end
    end
end

% Create figure
figure; subplot(2,1,1); plot(xtimes_behav,nanmean(Onsetnorm.VmOnset_eyelid_trials,1));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

subplot(2,1,2); plot(xtimes_Vm,nanmean(Onsetnorm.VmOnset_Vm_trials));
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlim([-0.25 0.25])

%% Calculate averages and save variable

Onsetnorm.eyelidOnset_eyelid_trials_AVG = nanmean(Onsetnorm.eyelidOnset_eyelid_trials,1);
Onsetnorm.eyelidOnset_Vm_trials_AVG = nanmean(Onsetnorm.eyelidOnset_Vm_trials,1);
Onsetnorm.VmOnset_eyelid_trials_AVG = nanmean(Onsetnorm.VmOnset_eyelid_trials,1);
Onsetnorm.VmOnset_Vm_trials_AVG = nanmean(Onsetnorm.VmOnset_Vm_trials,1);

cd('[path]\OnsetAlignment')
Param.cellID = input('CellID:');
if CS.resp == 1
    savename = sprintf('Results_SpontEM_lowPeak_onsetalignedtraces_%s',Param.cellID);
elseif CS.resp == 2
    savename = sprintf('Results_SpontEM_highPeak_onsetalignedtraces_%s',Param.cellID);
end

save(savename,'Onsetnorm','xtimes_Vm','xtimes_behav');