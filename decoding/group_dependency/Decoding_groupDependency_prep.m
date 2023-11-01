%% Preparation of group dependency of decoding based on Vm traces
% Preparation of the data for decoding based on different group sizes of conditioned neurons recorded
% intracellularly. Per group (size from 15 to 3 neurons) decoding is
% performed 29 times. 

% (c) R. Broersen, Erasmus MC, 2023

%% Data preparation
% Create set of 24 permutations for each groupsize (1-15)
perm.size = 50;

for ii = 1:perm.size
    perm.N15(ii,:)=randsample([1:15],15);
end
for ii = 1:perm.size
    perm.N14(ii,:)=randsample([1:15],14);
end
for ii = 1:perm.size
    perm.N13(ii,:)=randsample([1:15],13);
end
for ii = 1:perm.size
    perm.N12(ii,:)=randsample([1:15],12);
end
for ii = 1:perm.size
    perm.N11(ii,:)=randsample([1:15],11);
end
for ii = 1:perm.size
    perm.N10(ii,:)=randsample([1:15],10);
end
for ii = 1:perm.size
    perm.N9(ii,:)=randsample([1:15],9);
end
for ii = 1:perm.size
    perm.N8(ii,:)=randsample([1:15],8);
end
for ii = 1:perm.size
    perm.N7(ii,:)=randsample([1:15],7);
end
for ii = 1:perm.size
    perm.N6(ii,:)=randsample([1:15],6);
end
for ii = 1:perm.size
    perm.N5(ii,:)=randsample([1:15],5);
end
for ii = 1:perm.size
    perm.N4(ii,:)=randsample([1:15],4);
end
for ii = 1:perm.size
    perm.N3(ii,:)=randsample([1:15],3);
end
for ii = 1:perm.size
    perm.N2(ii,:)=randsample([1:15],2);
end
for ii = 1:perm.size
    perm.N1(ii,:)=randsample([1:15],1);
end
%% Load the data from conditioned neurons, retain cell number
cd('[path]')
data=[];
labels=[];
cellID=[];
fs=100000;

for ii=1:15
    ii
    if ii==1
        load('Results_ephys_CSandUS_16987.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_0801162.mat')
    elseif ii==3
        load('Results_ephys_CSandUS_2009163.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_2211163.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_1302173.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_2103171.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_2103172.mat')
    elseif ii==8
        load('Results_ephys_CSandUS_2404172.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2404171.mat')
    elseif ii==10
        load('Results_ephys_CSandUS_2404172 (2).mat')
    elseif ii==11
        load('Results_ephys_CSandUS_2211164.mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2211164 (2).mat')
    elseif ii==13
        load('Results_ephys_CSandUS_1701171.mat')
    elseif ii==14
        load('Results_ephys_CSandUS_1701173.mat')
    elseif ii==15
        load('Results_ephys_CSandUS_2103171 (2).mat')
    end
    data = [data; Spkresults.CS_trials_CR_mdn_norm(:,1:200000)];
    labels = [labels; ones(size(Spkresults.CS_trials_CR_mdn_norm,1),1)];
    cellID = [cellID; repmat(ii,size(Spkresults.CS_trials_CR_mdn_norm,1),1)];

    data = [data; Spkresults.CS_trials_normal_mdn_norm(:,1:200000)];
    labels = [labels; zeros(size(Spkresults.CS_trials_normal_mdn_norm,1),1)];
    cellID = [cellID; repmat(ii,size(Spkresults.CS_trials_normal_mdn_norm,1),1)];

end

% Remove the NaN trials
idx = isnan(data(:,1));
data=data(idx==0,:);
labels=labels(idx==0,:);
cellID=cellID(idx==0,:);

save('Allneurons_basisdata_cond.mat')

%% Load the data from naive neurons, retain cell number

cd('[path]')
data=[];
labels=[];
cellID=[];
fs=100000;

for ii=1:15
    ii
    if ii==1
        load('Results_ephys_CSandUS_2104161.mat')
    elseif ii==2
        load('Results_ephys_CSandUS_2104161 (2).mat')
    elseif ii==3
        load('Results_ephys_CSandUS_2804162.mat')
    elseif ii==4
        load('Results_ephys_CSandUS_2804163.mat')
    elseif ii==5
        load('Results_ephys_CSandUS_0505161.mat')
    elseif ii==6
        load('Results_ephys_CSandUS_0407163.mat')
    elseif ii==7
        load('Results_ephys_CSandUS_0807162.mat')
    elseif ii==8
        load('Results_ephys_CSandUS_1403172.mat')
    elseif ii==9
        load('Results_ephys_CSandUS_2108172.mat')
    elseif ii==10
        load('Results_ephys_CSandUS_2108172 (2).mat')
    elseif ii==11
        load('Results_ephys_CSandUS_2003171.mat')
    elseif ii==12
        load('Results_ephys_CSandUS_2003171 (2).mat')
    elseif ii==13
        load('Results_ephys_CSandUS_0807162 (2).mat')
    elseif ii==14
        load('Results_ephys_CSandUS_2003174.mat')
    elseif ii==15
        load('Results_ephys_CSandUS_0201173.mat')
    end

    data = [data; Spkresults.CS_trials_SEO_mdn_norm(:,1:200000)];
    labels = [labels; ones(size(Spkresults.CS_trials_SEO_mdn_norm,1),1)];
    cellID = [cellID; repmat(ii,size(Spkresults.CS_trials_SEO_mdn_norm,1),1)];

    data = [data; Spkresults.CS_trials_normal_mdn_norm(:,1:200000)];
    labels = [labels; zeros(size(Spkresults.CS_trials_normal_mdn_norm,1),1)];
    cellID = [cellID; repmat(ii,size(Spkresults.CS_trials_normal_mdn_norm,1),1)];

end

% Remove the NaN trials
idx = isnan(data(:,1));
data=data(idx==0,:);
labels=labels(idx==0,:);
cellID=cellID(idx==0,:);

save('Allneurons_basisdata_naive.mat')
