%% Script to perform a cluster test based on the decoding results for conditioned and naive neurons
% Modified by R. Broersen from code kindly provided by M. Tang, ANU, 2021.

% !!! Manually load the saved variable from the decoding script.

fs = 100000; % sampling frequency
Time = 1:0.4*fs;

for ii=1:size(decode,1)
    decod_Accuracy(ii,:) = decode(ii,:)==X(ii);
end
decode_null = repmat(0.5,[1 199996]); % Define test trace (accuracy of 50% = chance)

cond1 = decod_Accuracy(:,(0.35*fs):(0.75*fs));
cond2 = decode_null(:,(0.35*fs):(0.75*fs));

cond1 = cond1(:,1:40000);
cond2 = cond2(:,1:40000);

figure;hold on
plot(Time,mean(cond1));
plot(Time,cond2);

nPerms=2000; % how many permuations do you want

[datobs, datrnd] = cluster_test_helper([cond1-cond2]',nPerms); % does the cluster test

[h_mem, p_mem, ~] = cluster_test(datobs,datrnd,0,0.05,0.05);
pclustu = unique(p_mem);
npclust = nnz(pclustu < 0.05);
npclust = nnz(pclustu < 0.05);
for ipclust = 1:npclust % extract time range of each significant cluster and show in figure
    currind  = p_mem == pclustu(ipclust);
    fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[2,2,2,2],[0 0 0],'EdgeColor','none')
    h1=fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[-1,2,2,-1],[0 0 0],'EdgeColor','none');
    set(h1,'facealpha',.2);
end
legend('Cond1','Cond2','Significant time points')
xlabel('Time'); ylim([0.2 0.8])

cd('[path]')
orient('portrait')
figname = 'Clustertest_outcome_allneurons_0.35to0.75.fig';
saveas(gcf,figname,'fig');
figname = 'Clustertest_outcome_allneurons_0.35to0.75.pdf';
print('-dpdf','-painters','-loose',figname);
