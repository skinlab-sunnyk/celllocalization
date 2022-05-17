function [H,P,ppos,fpos,SS,rbs1,rbs2,CI,STATS] = AutoRollingbinTtest(PP1, PP2, MaxWinSize)
for i = 1:MaxWinSize
    [H{i},P{i}] = rollingbinTtest(PP1, PP2, i);
end
for j = 1:MaxWinSize
    HH = H{j};
    SS(j) = sum(HH==1);
end    
[mm, ppos] = max(SS);
fpos = find(SS==mm);
    