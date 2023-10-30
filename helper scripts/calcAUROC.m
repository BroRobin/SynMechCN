function [stimFA,stimHit,stimAUROC] = calcAUROC (SAcounts,stimCounts)

countCounter = 0;
for i = min(SAcounts):0.05:max(stimCounts)% if looking at EPSP amplitude for yoyo min(SAcounts):0.05:max(stimCounts)
    countCounter = countCounter +1;
    stimFA(countCounter) = mean(SAcounts >i);
    stimHit(countCounter)= mean(stimCounts >i);
end
% just want to add the point 0 and 1 to the end of them so
% that the curve has those end points for calculating area
% under the curve
stimFA = [1 stimFA 0];
stimHit = [1 stimHit 0];
stimAUROC = sum(abs(diff(stimFA)).*(stimHit(1:(end-1))+stimHit(2:end))/2);

end
