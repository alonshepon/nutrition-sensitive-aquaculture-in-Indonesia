%program to read nutritional and LCA data, calculate nutrients supply of
%various future aquaculture directions in Indonesia 
%and perform optimization to highlight best aquaculture
%practices to meet both environmental and nutritional objectives.
%
clear all;clc
%%%-------read data from supplementary data excel
dr='D:\Google Drive\Main\plantery fisheries\nutrition sensitive aquaculture\excel\indonesia\indonesia2020_e.xlsx';
read_fish_data
read_enviro_data
save fish_data

%% show future scenarios through environmental and nutritional lens
calculate_nutrition_scenarios
Draw_proposed_future_scenarios
save fish_scenarios

%% optimize domestic/BAU scenario
Create_MatrixA_and_VectorB  %create vector b and matrix A
%----------run optimizer
optimize_indonesia_fish     %run optimizer (and sensitivity analysis)
compareSolutionToScenarios
%save fish_data_opt
%% draw sensitivity
labels={'All','Zinc','Iron','Calcium','Vitamin A','Iodine','omega n-3'};
draw_SensitivityAnalysis_indo(C,xmt,labels)
%WriteResultsToExcel   %write Matrix A and shadow prices to excel
%% %draw optimization
DrawOptimizedScenarios2
%% %draw optimzed scenarios comapred to BAU2030
DrawOptimizedScenariosComparedToBase
%% draw nutritional score and composite environmental indicator  
CalculateNutritionEnviroScore
DrawFishEnvironNutrientScore
correlation_Of_Nutrients
save fish_data_all




