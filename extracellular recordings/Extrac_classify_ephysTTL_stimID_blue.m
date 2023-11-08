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


%      % CS only
        %      10 = CS only - no opto
        %      11 = CS only - early CS opto
        %      12 = CS only - late CS opto
        %      13 = CS only - early US period opto
        %      14 = CS only - late US period opto
        %
        %      % US only
        %      20 = US only - no opto
        %      21 = No ID assigned
        %      22 = US only - late CS opto
        %      23 = US only - early US period opto
        %      24 = US only - late US period opto
        %
        %      % Paired
        %      30 = Paired - no opto
        %      31 = Paired - early CS opto
        %      32 = Paired - late CS opto
        %      33 = Paired - early US period opto
        %      34 = Paired - late US period opto
        %
        %      % opto only
        %      41 = opto only - 10ms
        %      42 = opto only - 20ms
        %      43 = opto only - 50ms
        %      44 = opto only - 260ms

    
    
    Spkdata.GoTr_IDstim = [];
        opto_index = [];
        for ii = 1: size(Spkdata.ind_GoTrTTLdata_converted,2)
            %% determine CS presence 
            if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_LtOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_LtOnTTLdata_converted)>0
                if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)>0 % determine if also US = paired
                    if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                        opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                        % Paired
                        if sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.7)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.72)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late CS opto
                            Spkdata.GoTr_IDstim(ii) = 32;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.59)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.61)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early CS opto
                            Spkdata.GoTr_IDstim(ii) = 31;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.73)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.76)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early US period
                            Spkdata.GoTr_IDstim(ii) = 33;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.79)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.81)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late US period
                            Spkdata.GoTr_IDstim(ii) = 34;
                        end
                        
                    elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % % determine if no opto = paired - no opto
                        Spkdata.GoTr_IDstim(ii) = 30;
                    end
                    
                elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)==0 % determine if CS only
                    % CS only
                    if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                        opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                        if sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.7)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.72)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late CS opto
                            Spkdata.GoTr_IDstim(ii) = 12;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.59)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.61)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early CS opto
                            Spkdata.GoTr_IDstim(ii) = 11;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.73)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.76)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early US period
                            Spkdata.GoTr_IDstim(ii) = 13;
                        elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.79)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.81)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late US period
                            Spkdata.GoTr_IDstim(ii) = 14;
                        end
                        
                    elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % determine if no opto = CSonly - no opto
                        Spkdata.GoTr_IDstim(ii) = 10;
                    end
                end
                
                
                %% determine US only presence
            elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_PfOnTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_PfOnTTLdata_converted)>0
                % US only
                if sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0 % determine if also opto
                    opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                    if sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.7)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.72)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late CS opto
                        Spkdata.GoTr_IDstim(ii) = 22;
                    elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.59)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.61)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early CS opto
                        Spkdata.GoTr_IDstim(ii) = 21;
                    elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.73)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.76)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % early US period
                        Spkdata.GoTr_IDstim(ii) = 23;
                    elseif sum((Spkdata.ind_GoTrTTLdata_converted(ii)+0.79)<Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_GoTrTTLdata_converted(ii)+0.81)>Spkdata.ind_OptoChannelTTLdata_converted & (Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.08))>0 % late US period
                        Spkdata.GoTr_IDstim(ii) = 24;
                    end
                    
                elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)==0 % determine if US only
                    Spkdata.GoTr_IDstim(ii) = 20;
                end
                
                %% determine opto only presence
            elseif sum(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted)>0
                opto_index = find(Spkdata.ind_GoTrTTLdata_converted(ii)<Spkdata.ind_OptoChannelTTLdata_converted & Spkdata.ind_GoTrTTLdata_converted(ii)+2>Spkdata.ind_OptoChannelTTLdata_converted);
                % Opto only
                if Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.009 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.011 % 10ms
                    Spkdata.GoTr_IDstim(ii) = 42;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.019 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.021 % 20ms
                    Spkdata.GoTr_IDstim(ii) = 41;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.049 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.051 % 50ms
                    Spkdata.GoTr_IDstim(ii) = 43;
                elseif Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)>0.259 & Spkdata.ind_OptoChannelTTLdata_converted_dur(opto_index)<0.261 % 260ms
                    Spkdata.GoTr_IDstim(ii) = 44;
                end
            end
        end