function [M, P] = FindMinMat(DM)
%Returns vector M, minimum distance of a given cell in dermis from the nearest point in dermis (x-direction),n
% and returns indicies of nearest regrence point in epidermis.
n = 0; 
for i = 1:size(DM,1)
    Temp = DM(i,:);
    [M(i), P(i)] = min(Temp(Temp>n));
end
