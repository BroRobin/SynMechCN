function [ff,testTimeVector] = gauss_kde_10ms(trials,timeVec)
% input:
% trails: cell array of spike times in different trials
% time vec: relevant interval in which rates are extracted. 
% output:
% ff: spikefrequency signal
% testTimeVector:

% Nico Flierman, 2018

collapsed_spikes = vertcat(trials{:,:});% 
numTrials = length(trials);% sweeps 

  
 binSize = 0.01; % gaussian kernel size in seconds 

 % take 1 ms steps if only begin and end are specified
if length(timeVec)==2
 testDt = 0.001; %1ms resolution
 testTimeVector = timeVec(1):testDt:timeVec(end);
else % otherwise use input steps 
    testTimeVector = timeVec;
end


 %ksdensity to get a spike density function
 if isempty(collapsed_spikes) 
 % output array of zeros if there are no spikes
 ff= zeros(size(testTimeVector));
 else
 firingDensitiy = ksdensity(collapsed_spikes,testTimeVector,'width',binSize);
 
% denisty to rate 
 ff = firingDensitiy*length(collapsed_spikes)/numTrials;

 end
 
 