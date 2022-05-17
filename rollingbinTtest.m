function [H,P,rbs1,rbs2,CI,STATS] = rollingbinTtest(PP1, PP2, winsize)
%Takes in matrix containing frequency of Sox9+ nuclei in each bin. And it
%calculets the p value for each set of rolling bin of window size specified by winsize.    
rbs1 = rollingbinsum(PP1, winsize);
rbs2 = rollingbinsum(PP2, winsize);
[H,P,CI,STATS] = ttest2(rbs1,rbs2,'dim',2,'vartype','unequal');