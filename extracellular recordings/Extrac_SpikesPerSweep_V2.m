%% MFopto_SpikesPerSweep_V2
% (c) R. Broersen, Erasmus MC, 2023

Spks.stimuli.CS_CR = [];
Spks.stimuli.CS_CR_idx= [];


if nansum([R.trial_CRs(:,1)==1; R.trial_CRs(:,1)==2])>0
    Spks.stimuli.N_CS_CR = nansum([R.trial_CRs(:,1)==1; R.trial_CRs(:,1)==2]);

    for ii = 1:size(signal.GoTr_IDstim,2)
        if R.trial_CRs(ii,1)==1 || R.trial_CRs(ii,1)==2
            Spks.stimuli.CS_CR = [Spks.stimuli.CS_CR ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CS_CR_idx = [Spks.stimuli.CS_CR_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CS_CR= 0;
end

Spks.stimuli.CS_noCR = [];
Spks.stimuli.CS_noCR_idx = [];
if nansum([R.trial_CRs(:,1)==0; R.trial_CRs(:,1)==3])>0
    Spks.stimuli.N_CS_noCR = nansum([R.trial_CRs(:,1)==0; R.trial_CRs(:,1)==3]);

    for ii = 1:size(signal.GoTr_IDstim,2)
        if R.trial_CRs(ii,1)==0 || R.trial_CRs(ii,1)==3
            Spks.stimuli.CS_noCR = [Spks.stimuli.CS_noCR ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CS_noCR_idx = [Spks.stimuli.CS_noCR_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CS_noCR= 0;
end


Spks.stimuli.US_paired_CR = [];
Spks.stimuli.US_paired_CR_idx = [];
if nansum([R.trial_CRs(:,1)==1])>0
    Spks.stimuli.N_US_paired_CR = nansum([R.trial_CRs(:,1)==1]);

    for ii = 1:size(signal.GoTr_IDstim,2)
        if R.trial_CRs(ii,1)==1
            Spks.stimuli.US_paired_CR = [Spks.stimuli.US_paired_CR ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.US_paired_CR_idx = [Spks.stimuli.US_paired_CR_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_US_paired_CR= 0;
end

Spks.stimuli.US_paired_noCR = [];
Spks.stimuli.US_paired_noCR_idx = [];
if nansum([R.trial_CRs(:,1)==0])>0
    Spks.stimuli.N_US_paired_noCR = nansum([R.trial_CRs(:,1)==0]);

    for ii = 1:size(signal.GoTr_IDstim,2)
        if R.trial_CRs(ii,1)==0
            Spks.stimuli.US_paired_noCR = [Spks.stimuli.US_paired_noCR ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.US_paired_noCR_idx = [Spks.stimuli.US_paired_noCR_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_US_paired_noCR= 0;
end


Spks.stimuli.CSonly_10 = [];
Spks.stimuli.CSonly_10_idx = [];
Spks.stimuli.CSonly_11 = [];
Spks.stimuli.CSonly_11_idx = [];
Spks.stimuli.CSonly_12 = [];
Spks.stimuli.CSonly_12_idx = [];
Spks.stimuli.CSonly_13 = [];
Spks.stimuli.CSonly_13_idx = [];
Spks.stimuli.CSonly_14 = [];
Spks.stimuli.CSonly_14_idx = [];
Spks.stimuli.CSonly_15 = [];
Spks.stimuli.CSonly_15_idx = [];

Spks.stimuli.USonly_20 = [];
Spks.stimuli.USonly_20_idx = [];
Spks.stimuli.USonly_21 = [];
Spks.stimuli.USonly_21_idx = [];
Spks.stimuli.USonly_22 = [];
Spks.stimuli.USonly_22_idx = [];
Spks.stimuli.USonly_23 = [];
Spks.stimuli.USonly_23_idx = [];
Spks.stimuli.USonly_24 = [];
Spks.stimuli.USonly_24_idx = [];
Spks.stimuli.USonly_25 = [];
Spks.stimuli.USonly_25_idx = [];

Spks.stimuli.paired_30 = [];
Spks.stimuli.paired_30_idx = [];
Spks.stimuli.paired_31 = [];
Spks.stimuli.paired_31_idx = [];
Spks.stimuli.paired_32 = [];
Spks.stimuli.paired_32_idx = [];
Spks.stimuli.paired_33 = [];
Spks.stimuli.paired_33_idx = [];
Spks.stimuli.paired_34 = [];
Spks.stimuli.paired_34_idx = [];
Spks.stimuli.paired_35 = [];
Spks.stimuli.paired_35_idx = [];

Spks.stimuli.OptoOnly_40 = [];
Spks.stimuli.OptoOnly_40_idx = [];
Spks.stimuli.OptoOnly_41 = [];
Spks.stimuli.OptoOnly_41_idx = [];
Spks.stimuli.OptoOnly_42 = [];
Spks.stimuli.OptoOnly_42_idx = [];
Spks.stimuli.OptoOnly_43 = [];
Spks.stimuli.OptoOnly_43_idx = [];
Spks.stimuli.OptoOnly_44 = [];
Spks.stimuli.OptoOnly_44_idx = [];
Spks.stimuli.OptoOnly_45 = [];
Spks.stimuli.OptoOnly_45_idx = [];


%CS only trials
if nansum(signal.GoTr_IDstim==10)>0
    Spks.stimuli.N_CSonly_10 = nansum(signal.GoTr_IDstim==10);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==10
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_10 = [Spks.stimuli.CSonly_10 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_10_idx = [Spks.stimuli.CSonly_10_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_10 = 0;
end

if nansum(signal.GoTr_IDstim==11)>0
    Spks.stimuli.N_CSonly_11 = nansum(signal.GoTr_IDstim==11);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==11
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_11 = [Spks.stimuli.CSonly_11 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_11_idx = [Spks.stimuli.CSonly_11_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_11 = 0;
end

if nansum(signal.GoTr_IDstim==12)>0
    Spks.stimuli.N_CSonly_12 = nansum(signal.GoTr_IDstim==12);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==12
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_12 = [Spks.stimuli.CSonly_12 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_12_idx = [Spks.stimuli.CSonly_12_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_12 = 0;
end
if nansum(signal.GoTr_IDstim==13)>0
    Spks.stimuli.N_CSonly_13 = nansum(signal.GoTr_IDstim==13);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==13
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_13 = [Spks.stimuli.CSonly_13 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_13_idx = [Spks.stimuli.CSonly_13_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_13 = 0;
end
if nansum(signal.GoTr_IDstim==14)>0
    Spks.stimuli.N_CSonly_14 = nansum(signal.GoTr_IDstim==14);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==14
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_14 = [Spks.stimuli.CSonly_14 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_14_idx = [Spks.stimuli.CSonly_14_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_14 = 0;
end
if nansum(signal.GoTr_IDstim==15)>0
    Spks.stimuli.N_CSonly_15 = nansum(signal.GoTr_IDstim==15);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==15
            %             && signal.outlierindx_CSonly(ii)==1
            Spks.stimuli.CSonly_15 = [Spks.stimuli.CSonly_15 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.CSonly_15_idx = [Spks.stimuli.CSonly_15_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_CSonly_15 = 0;
end

%US only trials
if nansum(signal.GoTr_IDstim==20)>0
    Spks.stimuli.N_USonly_20 = nansum(signal.GoTr_IDstim==20);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==20
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_20 = [Spks.stimuli.USonly_20 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_20_idx = [Spks.stimuli.USonly_20_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_20 = 0;
end

if nansum(signal.GoTr_IDstim==21)>0
    Spks.stimuli.N_USonly_21 = nansum(signal.GoTr_IDstim==21);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==21
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_21 = [Spks.stimuli.USonly_21 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_21_idx = [Spks.stimuli.USonly_21_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_21 = 0;
end

if nansum(signal.GoTr_IDstim==22)>0
    Spks.stimuli.N_USonly_22 = nansum(signal.GoTr_IDstim==22);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==22
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_22 = [Spks.stimuli.USonly_22 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_22_idx = [Spks.stimuli.USonly_22_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_22 = 0;
end
if nansum(signal.GoTr_IDstim==23)>0
    Spks.stimuli.N_USonly_23 = nansum(signal.GoTr_IDstim==23);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==23
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_23 = [Spks.stimuli.USonly_23 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_23_idx = [Spks.stimuli.USonly_23_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_23 = 0;
end
if nansum(signal.GoTr_IDstim==24)>0
    Spks.stimuli.N_USonly_24 = nansum(signal.GoTr_IDstim==24);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==24
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_24 = [Spks.stimuli.USonly_24 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_24_idx = [Spks.stimuli.USonly_24_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_24 = 0;
end
if nansum(signal.GoTr_IDstim==25)>0
    Spks.stimuli.N_USonly_25 = nansum(signal.GoTr_IDstim==25);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==25
            %             && signal.outlierindx_USonly(ii)==1
            Spks.stimuli.USonly_25 = [Spks.stimuli.USonly_25 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.USonly_25_idx = [Spks.stimuli.USonly_25_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_USonly_25 = 0;
end

%paired trials
if nansum(signal.GoTr_IDstim==30)>0
    Spks.stimuli.N_paired_30 = nansum(signal.GoTr_IDstim==30);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==30
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_30 = [Spks.stimuli.paired_30 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_30_idx = [Spks.stimuli.paired_30_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_30 = 0;
end

if nansum(signal.GoTr_IDstim==31)>0
    Spks.stimuli.N_paired_31 = nansum(signal.GoTr_IDstim==31);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==31
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_31 = [Spks.stimuli.paired_31 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_31_idx = [Spks.stimuli.paired_31_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_31 = 0;
end

if nansum(signal.GoTr_IDstim==32)>0
    Spks.stimuli.N_paired_32 = nansum(signal.GoTr_IDstim==32);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==32
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_32 = [Spks.stimuli.paired_32 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_32_idx = [Spks.stimuli.paired_32_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_32 = 0;
end
if nansum(signal.GoTr_IDstim==33)>0
    Spks.stimuli.N_paired_33 = nansum(signal.GoTr_IDstim==33);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==33
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_33 = [Spks.stimuli.paired_33 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_33_idx = [Spks.stimuli.paired_33_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_33 = 0;
end
if nansum(signal.GoTr_IDstim==34)>0
    Spks.stimuli.N_paired_34 = nansum(signal.GoTr_IDstim==34);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==34
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_34 = [Spks.stimuli.paired_34 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_34_idx = [Spks.stimuli.paired_34_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_34 = 0;
end
if nansum(signal.GoTr_IDstim==35)>0
    Spks.stimuli.N_paired_35 = nansum(signal.GoTr_IDstim==35);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==35
            %             && signal.outlierindx_paired(ii)==1
            Spks.stimuli.paired_35 = [Spks.stimuli.paired_35 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.paired_35_idx = [Spks.stimuli.paired_35_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_paired_35 = 0;
end

%OptoOnly trials
if nansum(signal.GoTr_IDstim==40)>0
    Spks.stimuli.N_OptoOnly_40 = nansum(signal.GoTr_IDstim==40);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==40
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_40 = [Spks.stimuli.OptoOnly_40 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_40_idx = [Spks.stimuli.OptoOnly_40_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_40 = 0;
end

if nansum(signal.GoTr_IDstim==41)>0
    Spks.stimuli.N_OptoOnly_41 = nansum(signal.GoTr_IDstim==41);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==41
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_41 = [Spks.stimuli.OptoOnly_41 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_41_idx = [Spks.stimuli.OptoOnly_41_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_41 = 0;
end

if nansum(signal.GoTr_IDstim==42)>0
    Spks.stimuli.N_OptoOnly_42 = nansum(signal.GoTr_IDstim==42);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==42
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_42 = [Spks.stimuli.OptoOnly_42 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_42_idx = [Spks.stimuli.OptoOnly_42_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_42 = 0;
end
if nansum(signal.GoTr_IDstim==43)>0
    Spks.stimuli.N_OptoOnly_43 = nansum(signal.GoTr_IDstim==43);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==43
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_43 = [Spks.stimuli.OptoOnly_43 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_43_idx = [Spks.stimuli.OptoOnly_43_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_43 = 0;
end
if nansum(signal.GoTr_IDstim==44)>0
    Spks.stimuli.N_OptoOnly_44 = nansum(signal.GoTr_IDstim==44);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==44
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_44 = [Spks.stimuli.OptoOnly_44 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_44_idx = [Spks.stimuli.OptoOnly_44_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_44 = 0;
end
if nansum(signal.GoTr_IDstim==45)>0
    Spks.stimuli.N_OptoOnly_45 = nansum(signal.GoTr_IDstim==45);
    for ii = 1:size(signal.GoTr_IDstim,2)
        if signal.GoTr_IDstim(ii)==45
            %             && signal.outlierindx_optoOnly(ii)==1
            Spks.stimuli.OptoOnly_45 = [Spks.stimuli.OptoOnly_45 ((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii))'];
            Spks.stimuli.OptoOnly_45_idx = [Spks.stimuli.OptoOnly_45_idx repmat(ii,1,size(((Spks.spiketimes(Spks.spiketimes>=Spkdata.ind_GoTrTTLdata(ii)&Spks.spiketimes<=(Spkdata.ind_GoTrTTLdata(ii)+2)))-Spkdata.ind_GoTrTTLdata(ii)),1))];
        end
    end
else
    Spks.stimuli.N_OptoOnly_45 = 0;
end