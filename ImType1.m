function [I1] = ImType1(CCm,s)
%makes p/pmax image, I1 in width and intensity. Intensity  = 1 and width = 100
%if p/pmax = 1.
I1 = zeros(s,100);
for i = 1:size(CCm,2)
    L = round(50 - (CCm(i)*100)/2);
    if L<=0
        L=1;
    end
    R = round(50 + (CCm(i)*100)/2);
    if R>=100
        R = 100;
    end
    I1(i,L:R) = CCm(i);
end
