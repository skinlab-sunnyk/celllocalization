function [CC, B] = Binit(DM1Y, binsize)
% enter values in um, %CC retruns a vector of Bins with count in each Bin 
%B returns a vector which shows which bin number is assigned to a given cell 
c = 0; % count
bb = 0;
for i = 1:100
    %c = 0
    %binsize*(i-1)
     %  binsize*i
   for j = 1:size(DM1Y,2)
       
    if DM1Y(1,j)>=binsize*(i-1) && DM1Y(1,j)<binsize*i
       c = c+1;
       B(j) = i;
    end 
   end
   CC(i) = c;
   c = 0;
end
   
    
        
    