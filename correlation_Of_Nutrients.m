%a subroutine to find the correlations between nutrients in the aquaculture
%systems
[RHO,PVAL]=corr([zinc_fish,iron_fish,vitaminA_fish,calcium_fish,iodine_fish,omega_fish],'Type','Pearson');
