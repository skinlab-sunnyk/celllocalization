function [DM1X, DM2] = DistMats(Cells, Epi)
%Takes input of 2 nx2 matrices containing X,Y values of cells pos and Epi cell positions
%DM1X returns distance matrices between cells and Epi X values
%DM2 return distance matrices between cells to cells 

%calculates DM1 
for i = 1:size(Cells, 1)
    for j = 1:size(Epi,1)
       DM1X(i,j) = sqrt((Cells(i,1) - Epi(j,1))^2);
    end
end

%clauclates DM2
for i = 1:size(Cells, 1)
    for j = 1:size(Cells,1)
       DM2(i,j) = sqrt((Cells(i,1) - Cells(j,1))^2 + (Cells(i,2) - Cells(j,2))^2);
    end
end


end