%% Classify ephys TTL stim IDs
% (c) R. Broersen, Erasmus MC, 2023

% Detect GoMi onset times
% Detect where the TTL pulse is on and register those datapoints
TTLindex = diff(Spkdata.GoTr_data_vector);
index = find(TTLindex>1.5);
Spkdata.ind_GoTrTTLdata_converted = index/Spkdata.fs;
index_off = find(TTLindex<-1);
Spkdata.ind_GoTrTTLdata_converted_off = index_off/Spkdata.fs;
N=length(Spkdata.ind_GoTrTTLdata_converted);
% Spkdata.ind_GoTrTTLdata_converted_off = Spkdata.ind_GoTrTTLdata_converted_off/Spkdata.fs;
try
    for ii = 1:N-1
        if Spkdata.ind_GoTrTTLdata_converted(ii+1)<(Spkdata.ind_GoTrTTLdata_converted(ii)+2)
            Spkdata.ind_GoTrTTLdata_converted(ii+1) = [];
        end
    end
end

N=length(Spkdata.ind_GoTrTTLdata_converted_off);
try
    for ii = 1:N-1
        if Spkdata.ind_GoTrTTLdata_converted_off(ii+1)<(Spkdata.ind_GoTrTTLdata_converted_off(ii)+2)
            Spkdata.ind_GoTrTTLdata_converted_off(ii+1) = [];
        end
    end
end

if sum(diff(Spkdata.ind_GoTrTTLdata_converted)<7.9)>0
    disp('Something went wrong in determining GoMi_Timestamps')
%     figure; plot(signal_temp.adc)
    pause;
end

if length(Spkdata.ind_GoTrTTLdata_converted_off)==length(Spkdata.ind_GoTrTTLdata_converted)
Spkdata.ind_GoTrTTLdata_converted_dur = Spkdata.ind_GoTrTTLdata_converted_off-Spkdata.ind_GoTrTTLdata_converted;
elseif length(Spkdata.ind_GoTrTTLdata_converted_off)<length(Spkdata.ind_GoTrTTLdata_converted)
        disp('Something went wrong in calculating GoMi_TTL duration')
Spkdata.ind_GoTrTTLdata_converted_dur = Spkdata.ind_GoTrTTLdata_converted_off-Spkdata.ind_GoTrTTLdata_converted(1:length(Spkdata.ind_GoTrTTLdata_converted_off));
end

% Detect CSMi onset times
% Detect where the TTL pulse is on and register those datapoints
TTLindex = diff(Spkdata.LtOn_data_vector);
index = find(TTLindex>0.5);
Spkdata.ind_LtOnTTLdata_converted = index/Spkdata.fs;
index_off = find(TTLindex<-0.5);
Spkdata.ind_LtOnTTLdata_converted_off = index_off/Spkdata.fs;
N=length(Spkdata.ind_LtOnTTLdata_converted);
% Spkdata.ind_LtOnTTLdata_converted_off = Spkdata.ind_LtOnTTLdata_converted_off/Spkdata.fs;
try
    for ii = 1:N-1
        if Spkdata.ind_LtOnTTLdata_converted(ii+1)<(Spkdata.ind_LtOnTTLdata_converted(ii)+2)
            Spkdata.ind_LtOnTTLdata_converted(ii+1) = [];
        end
    end
end

N=length(Spkdata.ind_LtOnTTLdata_converted_off);
try
    for ii = 1:N-1
        if Spkdata.ind_LtOnTTLdata_converted_off(ii+1)<(Spkdata.ind_LtOnTTLdata_converted_off(ii)+2)
            Spkdata.ind_LtOnTTLdata_converted_off(ii+1) = [];
        end
    end
end

if sum(diff(Spkdata.ind_LtOnTTLdata_converted)<7.9)>0
    disp('Something went wrong in determining CSMi_Timestamps')
end

if length(Spkdata.ind_LtOnTTLdata_converted_off)==length(Spkdata.ind_LtOnTTLdata_converted)
Spkdata.ind_LtOnTTLdata_converted_dur = Spkdata.ind_LtOnTTLdata_converted_off-Spkdata.ind_LtOnTTLdata_converted;
elseif length(Spkdata.ind_LtOnTTLdata_converted_off)<length(Spkdata.ind_LtOnTTLdata_converted)
Spkdata.ind_LtOnTTLdata_converted_dur = Spkdata.ind_LtOnTTLdata_converted_off-Spkdata.ind_LtOnTTLdata_converted(1:length(Spkdata.ind_LtOnTTLdata_converted_off));
end


% Detect USMi onset times
% Detect where the TTL pulse is on and register those datapoints
TTLindex = diff(Spkdata.PfOn_data_vector);
index = find(TTLindex>1.5);
Spkdata.ind_PfOnTTLdata_converted = index/Spkdata.fs;
index_off = find(TTLindex<-1);
Spkdata.ind_PfOnTTLdata_converted_off = index_off/Spkdata.fs;
N=length(Spkdata.ind_PfOnTTLdata_converted);
% Spkdata.ind_PfOnTTLdata_converted_off = Spkdata.ind_PfOnTTLdata_converted_off/Spkdata.fs;
try
    for ii = 1:N-1
        if Spkdata.ind_PfOnTTLdata_converted(ii+1)<(Spkdata.ind_PfOnTTLdata_converted(ii)+2)
            Spkdata.ind_PfOnTTLdata_converted(ii+1) = [];
        end
    end
end

N=length(Spkdata.ind_PfOnTTLdata_converted_off);
try
    for ii = 1:N-1
        if Spkdata.ind_PfOnTTLdata_converted_off(ii+1)<(Spkdata.ind_PfOnTTLdata_converted_off(ii)+2) % smaller than 100ms
            Spkdata.ind_PfOnTTLdata_converted_off(ii+1) = [];
        end
    end
end

if sum(diff(Spkdata.ind_PfOnTTLdata_converted)<7.9)>0
    disp('Something went wrong in determining USMi_Timestamps')
end

if length(Spkdata.ind_PfOnTTLdata_converted_off)==length(Spkdata.ind_PfOnTTLdata_converted)
Spkdata.ind_PfOnTTLdata_converted_dur = Spkdata.ind_PfOnTTLdata_converted_off-Spkdata.ind_PfOnTTLdata_converted;
elseif length(Spkdata.ind_PfOnTTLdata_converted_off)<length(Spkdata.ind_PfOnTTLdata_converted)
Spkdata.ind_PfOnTTLdata_converted_dur = Spkdata.ind_PfOnTTLdata_converted_off-Spkdata.ind_PfOnTTLdata_converted(1:length(Spkdata.ind_PfOnTTLdata_converted_off));
end

% Detect OpMi onset times
% Detect where the TTL pulse is on and register those datapoints
TTLindex = diff(Spkdata.OptoChannel_data_vector);
index = find(TTLindex>1.5);
Spkdata.ind_OptoChannelTTLdata_converted = index/Spkdata.fs;
index_off = find(TTLindex<-1);
Spkdata.ind_OptoChannelTTLdata_converted_off = index_off/Spkdata.fs;
N=length(Spkdata.ind_OptoChannelTTLdata_converted);
% Spkdata.ind_OptoChannelTTLdata_converted_off = Spkdata.ind_OptoChannelTTLdata_converted_off/Spkdata.fs;
try
    for ii = 1:N-1
        if Spkdata.ind_OptoChannelTTLdata_converted(ii+1)<(Spkdata.ind_OptoChannelTTLdata_converted(ii)+2)
            Spkdata.ind_OptoChannelTTLdata_converted(ii+1) = [];
        end
    end
end

N=length(Spkdata.ind_OptoChannelTTLdata_converted_off);
try
    for ii = 1:N-1
        if Spkdata.ind_OptoChannelTTLdata_converted_off(ii+1)<(Spkdata.ind_OptoChannelTTLdata_converted_off(ii)+2)% smaller than 100ms
            Spkdata.ind_OptoChannelTTLdata_converted_off(ii+1) = [];
        end
    end
end

% if sum(diff(Spkdata.ind_OptoChannelTTLdata_converted)<7.9)>0
%     disp('Something went wrong in determining OpMi_Timestamps')
% end

if length(Spkdata.ind_OptoChannelTTLdata_converted_off)==length(Spkdata.ind_OptoChannelTTLdata_converted)
Spkdata.ind_OptoChannelTTLdata_converted_dur = Spkdata.ind_OptoChannelTTLdata_converted_off-Spkdata.ind_OptoChannelTTLdata_converted;
elseif length(Spkdata.ind_OptoChannelTTLdata_converted_off)<length(Spkdata.ind_OptoChannelTTLdata_converted)
Spkdata.ind_OptoChannelTTLdata_converted_dur = Spkdata.ind_OptoChannelTTLdata_converted_off-Spkdata.ind_OptoChannelTTLdata_converted(1:length(Spkdata.ind_OptoChannelTTLdata_converted_off));
end

%%
% Define the ID stim
    
    %      % CS only
    %      10 = CS only - no opto
    %      11 = CS only - early opto
    %      12 = CS only - late opto
    %      13 = CS only - US period opto
    %      14 = CS only - CS-US period opto
    %      15 = CS only CS-US + US period opto
    %
    %      % US only
    %      20 = US only - no opto
    %      21 = US only - early opto
    %      22 = US only - late opto
    %      23 = US only - US period opto
    %      24 = US only - CS-US period opto
    %      25 = US only CS-US + US period opto
    %
    %      % paired
    %      30 = paired - no opto
    %      31 = paired - early opto
    %      32 = paired - late opto
    %      33 = paired - US period opto
    %      34 = paired - CS-US period opto
    %      35 = paired CS-US + US period opto
    %
    %      % opto only
    %      41 = opto only - early opto
    %      42 = opto only - late opto
    %      43 = opto only - US period opto
    %      44 = opto only - CS-US period opto
    %      45 = opto only CS-US + US period opto
    
    Spkdata.GoTr_IDstim = [];
    opto_index = [];
    for ii = 1: size(Spkdata.ind_GoTrTTLdata_converted,2)
        %% determine CS presence
        if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_LtOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_LtOnTTLdata_converted)>0
            if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)>0 % determine if also US = paired
                % Paired
                if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                    opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                    if Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.1 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.12 % late opto
                        Spkdata.GoTr_IDstim(ii) = 32;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.14 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.16 % early opto
                        Spkdata.GoTr_IDstim(ii) = 31;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.29 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.32 % US period
                        Spkdata.GoTr_IDstim(ii) = 33;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.25 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.27 % CS-US period
                        Spkdata.GoTr_IDstim(ii) = 34;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.54 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.56 % CS-US + US period opto
                        Spkdata.GoTr_IDstim(ii) = 35;
                    end
                    
                elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % % determine if no opto = paired - no opto
                    Spkdata.GoTr_IDstim(ii) = 30;
                end
                
            elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)==0 % determine if CS only
                if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                    opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                    if Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.1 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.12 % late opto
                        Spkdata.GoTr_IDstim(ii) = 12;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.14 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.16 % early opto
                        Spkdata.GoTr_IDstim(ii) = 11;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.29 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.32 % US period
                        Spkdata.GoTr_IDstim(ii) = 13;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.25 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.27 % CS-US period
                        Spkdata.GoTr_IDstim(ii) = 14;
                    elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.54 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.56 % CS-US + US period opto
                        Spkdata.GoTr_IDstim(ii) = 15;
                    end
                    
                elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % determine if no opto = CSonly - no opto
                    Spkdata.GoTr_IDstim(ii) = 10;
                end
            end
            
            
            %% determine US only presence
        elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)>0
            if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                if Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.1 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.12 % late opto
                    Spkdata.GoTr_IDstim(ii) = 22;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.14 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.16 % early opto
                    Spkdata.GoTr_IDstim(ii) = 21;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.29 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.32 % US period
                    Spkdata.GoTr_IDstim(ii) = 23;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.25 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.27 % CS-US period
                    Spkdata.GoTr_IDstim(ii) = 24;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.54 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.56 % CS-US + US period opto
                    Spkdata.GoTr_IDstim(ii) = 25;
                end
                
            elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % determine if US only
                Spkdata.GoTr_IDstim(ii) = 20;
            end
            
            %% determine opto only presence
        elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0
            opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
            if Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.1 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.12 % late opto
                Spkdata.GoTr_IDstim(ii) = 42;
            elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.14 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.16 % early opto
                Spkdata.GoTr_IDstim(ii) = 41;
            elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.29 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.32 % US period
                Spkdata.GoTr_IDstim(ii) = 43;
            elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.25 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.27 % CS-US period
                Spkdata.GoTr_IDstim(ii) = 44;
            elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.54 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.56 % CS-US + US period opto
                Spkdata.GoTr_IDstim(ii) = 45;
            end
        end
    end
