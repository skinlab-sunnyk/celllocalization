function [DM1Y] = EpiCellDistVec(Epi, Cells, PE)
% Since the closest refence point in X is selected therefore it is assumed
% that sqrt((Epi((PE(i)),1) - Cells(i,1))^2) will have negligible effect.
% Also the point where ((Epi((PE(i)),1) - Cells(i,1))^2) = 0 will lie close
% to the point closest in epidermis, therefore the depth of the cell under
% epidermis can be caluced as given below by DM1Y
for i = 1:size(Cells)
    DM1Y(i) = sqrt((Epi((PE(i)),2) - Cells(i,2))^2);
end
% Alternatively, 
%for i = 1:size(Cells)
    %DM1Y(i) = sqrt((Epi((PE(i)),2) - Cells(i,2))^2 + (Epi((PE(i)),1) - Cells(i,1))^2);
%end
