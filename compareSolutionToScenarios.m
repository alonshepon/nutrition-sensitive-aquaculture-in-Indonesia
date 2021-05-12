
edible_solution=(edible_portion.*Production_fish*10^12); %from Mt to edible g per y
solution_zinc=zinc_fish.*edible_solution; %in mg 
solution_iron=iron_fish.*edible_solution; %in mg 
solution_calcium=calcium_fish.*edible_solution; %in mg 
solution_vitaminA=vitaminA_fish.*edible_solution;%in mgc RAE
solution_iodine=iodine_fish.*edible_solution;%in mgc 
solution_omega=omega_fish.*edible_solution;%in g

as=FutureMassSystems(:,1)/1000;%expected mass in BAU for 2030 in Mt/y (excluding others)
edible_BAU_solution=as.*edible_portion*10^12; %from Mt to edible g per y
solution_BAU_zinc=edible_BAU_solution.*zinc_fish; %in mg 
solution_BAU_iron=edible_BAU_solution.*iron_fish; %in mg 
solution_BAU_calcium=edible_BAU_solution.*calcium_fish; %in mg 
solution_BAU_vitaminA=edible_BAU_solution.*vitaminA_fish;%in mgc RAE
solution_BAU_iodine=edible_BAU_solution.*iodine_fish;%in mgc 
solution_BAU_omega=edible_BAU_solution.*omega_fish;%in g

IncreaseInZinc=sum(solution_zinc,1)./sum(solution_BAU_zinc)*100;
IncreaseInIron=sum(solution_iron,1)./sum(solution_BAU_iron)*100;
IncreaseInCalcium=sum(solution_calcium,1)./sum(solution_BAU_calcium)*100;
IncreaseInVitaminA=sum(solution_vitaminA,1)./sum(solution_BAU_vitaminA)*100;
IncreaseInIodine=sum(solution_iodine,1)./sum(solution_BAU_iodine)*100;
IncreaseInOmega=sum(solution_omega,1)./sum(solution_BAU_omega)*100;

for i=1:7    %7 optimized scenarios  
    GHG_opt(i)= A(1,:)*Production_fish(:,i)*10^6/10^3;%units tonCO2
    Acid_opt(i)= A(2,:)*Production_fish(:,i)*10^6/10^3;%units ton SO4
    Eutr_opt(i)= A(3,:)*Production_fish(:,i)*10^6/10^3;%units ton PO4
    Land_opt(i)= A(4,:)*Production_fish(:,i)*10^6/10^3;%units dunam
    FWC_opt(i)= A(5,:)*Production_fish(:,i)*10^6/10^3;%units 1000m^3
    Energy_opt(i)= A(6,:)*Production_fish(:,i)*10^6/10^3;%units 1000MJ
    Wholefish_opt(i)= A(7,:)*Production_fish(:,i)*10^6/10^3;%units 1000ton
    Mangrove_opt(i)= A(8,:)*Production_fish(:,i)*10^6/10^3;%units dunam
end
GHG_compare= GHG_opt/b(1)*100;
Acid_compare=Acid_opt/b(2)*100;
Eutr_compare=Eutr_opt/b(3)*100;
Land_compare=Land_opt/b(4)*100;
FWC_compare=FWC_opt/b(5)*100;
Energy_compare=Energy_opt/b(6)*100;
Wholefish_compare=Wholefish_opt/b(7)*100;
Mangrove_compare=Mangrove_opt/b(8)*100;