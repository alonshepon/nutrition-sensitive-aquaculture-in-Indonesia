
%convert cost function edible portions to production (x solution is in
%10^6 kg per yr, which is 10^9 g per yr): convert nutrient value per g to per 10^9 g

if strcmp(costt,'reg')
% zinc_edible=zinc_fish.*edible_portion./EAR_zinc*10^9;
% iron_edible=iron_fish.*edible_portion./EAR_iron*10^9;
% calcium_edible=calcium_fish.*edible_portion./EAR_calcium*10^9;
% vitaminA_edible=vitaminA_fish.*edible_portion./EAR_vitaminA*10^9;
% iodine_edible=iodine_fish.*edible_portion./EAR_iodine*10^9;
% omega_edible=omega_fish.*edible_portion./EAR_omega*10^9;
%%%----------------------
zinc_edible=(zinc_fish-mean(zinc_fish.*edible_portion)).*edible_portion./std(zinc_fish.*edible_portion);
iron_edible=(iron_fish-mean(iron_fish.*edible_portion)).*edible_portion./std(iron_fish.*edible_portion);
calcium_edible=(calcium_fish-mean(calcium_fish.*edible_portion)).*edible_portion./std(calcium_fish.*edible_portion);
vitaminA_edible=(vitaminA_fish-mean(vitaminA_fish.*edible_portion)).*edible_portion./std(vitaminA_fish.*edible_portion);
iodine_edible=(iodine_fish-mean(iodine_fish.*edible_portion)).*edible_portion./std(iodine_fish.*edible_portion);
omega_edible=(omega_fish-mean(omega_fish.*edible_portion)).*edible_portion./std(omega_fish.*edible_portion);

C1=[zinc_edible iron_edible calcium_edible vitaminA_edible iodine_edible omega_edible];
r=size(C1);
D1=sum(C1,2);
%'All' scenario
C=[D1 C1];

elseif strcmp(costt,'nutritional_yield')
%Modification of the Nutritional yield concept (but without the land) - how
%many people can be nourished 100% from total volume outputs
%The following average daily RNIs for women and men, aged 19–50 years are used in the calculations:
%energy, 10,700 kJ; protein, 44 g; fat, 80 g; iron, 21.6 mg; zinc, 14 mg;
%calcium, 1000 mg; vitamin A, 550 ?g RAE; vitamin

zinc_edible=zinc_fish.*edible_portion*10^9/365/14;
iron_edible=iron_fish.*edible_portion*10^9/365/21.6;
calcium_edible=calcium_fish.*edible_portion*10^9/365/1000;
vitaminA_edible=vitaminA_fish.*edible_portion*10^9/365/550;
iodine_edible=iodine_fish.*edible_portion*10^9/365/150;  %https://www.ncbi.nlm.nih.gov/books/NBK222323/  where RDA and RNI are similar
omega_edible=omega_fish.*edible_portion*10^9/365/0.25;
C1=[zinc_edible iron_edible calcium_edible vitaminA_edible iodine_edible omega_edible];
r=size(C1);

%create a cost function (D) for all nutritional values together contributing equally
%based on unitless distance from average normalized by STD

stdc12=zeros(Ni,r(2));c12=zeros(Ni,r(2));D=zeros(Ni,1);
popul=250*10^6; %population of indonesia

for u=1:Ni;
Rte=C1(u,:)./popul;
%Zstd=std((Rte));
Zstd=sum(abs(((Rte)-mean(Rte))/std(Rte)));
D(u,:)=mean(Rte)/Zstd;
end

C=[D C1];
end