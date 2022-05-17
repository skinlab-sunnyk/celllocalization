function [DM1Yum, CC, CCs, CCm, I1] = RunPositions2(Cells, Epi)
%Returns distance vector DM1Yum containing distances in um of all cells from
%respective nearest point in epithelium. CC is raw count in a bin; CCs is
%vector of empirical probablity of each bin; CCm is vector containg
%probality of each bin normalized to maximum probability. I1 is heat map
%based on CCm
[DM1X] = DistMats(Cells, Epi); %returns a DistMat
[ME, PE] = FindMinMat(DM1X); %searches the closest refrence point in epithelium
%[MC, PC] = FindMinMatCC(DM2C,c); %c is number of neighbours. Searching nearest neighbour and returns distance of c closest neighbors
[DM1Y] = EpiCellDistVec(Epi, Cells, PE); % distance vector in pixels 
pixelperum = 3.2; %change to 3.2 for 20x IX73 camera, change to 6.45 for 40x IX73 image
DM1Yum = Pixel2um(DM1Y,pixelperum); %converts to distance in um
binsize = 5; %avg nuclear size
CC = Binit(DM1Yum, binsize); % Returns number of cells in each Bin 
CCs = CC/sum(CC); %calculates emperical probablity
CCm = CCs/max(CCs);%normalises the probablity vector to its maxima
I1 = ImType1(CCm, size(CCm,2)); %returns a heatmap image
