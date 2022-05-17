function [Win] = rollingbinsum(PP, winsize)
%The funtion calculates the sum of consicutive rolling bins for window size specified by winsize.
%for e.g. for winsize = 5 the sum of frequencies will be done from bin
%1-5,2-6,3-7 and so on. 
s = size(PP,2);
r = size(PP,1) - winsize + 1;
for j = 1:s
    for i = 1:r
        sm = sum(PP(i:i+(winsize-1),j));
        Win(i,j) = sm;
    end
    
end