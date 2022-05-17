# celllocalization
This repository contains algorithm to analyse, plot, and determine statistical significance of cell localisation in the tissue.
The algorithm requires a vector containing X and Y co-ordinates of all cells of interest in the tissue section (Cells) that can be marked 
And another vector of a X and Y cordinates of reference points (Epi).
For the current purpose the alogrithm takes the X and Y co-ordinates of cells in the dermis and X and Y cordintaes of cells in epidermis defines the refrence points. 
It is recoomended to straigten the image such that epidermis is maximally aligned with horizontal x-axis (otherwise the code needs to be adjusted such that it measures the distance in direction of normal to three consicutive refrence points) 
The RunPositions function takes in both vectors, caluclates and returns Distance vector for all cell from epidermis, Count in each bin and epirical probability for each bin, normalized probability, and heat map for that section
The DM1X, DM2C = DistMats(Cells, Epi), function returns a distance matrix of all cells in refrence (epithelium) to cells in dermis.
[ME, PE] = FindMinMat(DM1X), %searches the closest refrence point in epithelium and returns the minimum distance and indicies of closest reference point in epidermis
DM1Y = EpiCellDistVec(Epi, Cells, PE), % retruns distance vector DM1Y in pixels for each cell in dermis from the closest refrence point in epidermis
DM1Yum = Pixel2um(DM1Y,pixelperum), converts the distance in pixels to distance in micrometers (um)
[CC, B] = Binit(DM1Yum, binsize), Bins the area under epidermis based on binsize (5 um for this analysis) and count the number of cells in that bin 
Emperical probability is calculated as CCs = CC/sum(CC);
Normalized to maximum porbablity is calcluted as CCm = CCs/max(CCs);
I1 = ImType1(CCm, size(CCm,2)), generates a HeatMap image for individual section
Analysis over multiple mice:
CCs from each mouse is calulated and single matrix with each column represnting a mice belonging to either WT, trangenic or KO is created as mentioned below:
WT_CCs = [Mouse_1_CCs, Mouse_2_CCs,Mouse_3_CCs...Mouse_n_CCs]
Tg_CCs = [Mouse_1_CCs, Mouse_2_CCs,Mouse_3_CCs...Mouse_n_CCs]
KO_CCs = [Mouse_1_CCs, Mouse_2_CCs,Mouse_3_CCs...Mouse_n_CCs]
The Welch's t test for corresponding bins between two sets is done by [H,P] = AutoRollingbinTtest(PP1, PP2, MaxWinSize) function
[H,P] = AutoRollingbinTtest(PP1, PP2, MaxWinSize) takes in matrices from two condition - WT_CCs and Tg_CCs for example and returns H = 1 for bins wehre p<0.05 and 0 where p>0.05. P is vector with raw p values.
MaxWinSize defines the size of the moving window. For this analysis MaxWinSize = 1, which is odinary t test between correspondng bins between two conditions. 
Means for each conditions were then calculated as Condition_CCs_mean = mean(Condition_CCs, 2) and so on
Condition_CCm = Condition_CCs_mean/max(Condition_CCs_mean)



