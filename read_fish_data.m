%read nutritional and environmental data of fish and future scenarios

%read data on fish (values are for 1g edible)
rr='Fish type Nut. Composition';
[a,fishtype,c]=xlsread(dr,rr,'A3:A15');

zinc_fish=xlsread(dr,rr,'F3:F15')/100;%zinc
iron_fish=xlsread(dr,rr,'D3:D15')/100;%iron
calcium_fish=xlsread(dr,rr,'C3:C15')/100;%calcium
vitaminA_fish=xlsread(dr,rr,'G3:G15')/100;%vitaminA
iodine_fish=xlsread(dr,rr,'E3:E15')/100;%iodine
omega_fish=xlsread(dr,rr,'H3:H15')/100;%omega
edible_portion=xlsread(dr,rr,'B3:B15');%edible portion

%extract only 12 systems
%number of systems to explore 
Ni=12;
omega_fish=omega_fish(1:Ni);
zinc_fish=zinc_fish(1:Ni);
iron_fish=iron_fish(1:Ni);
calcium_fish=calcium_fish(1:Ni);
iodine_fish=iodine_fish(1:Ni);
vitaminA_fish=vitaminA_fish(1:Ni);
edible_portion=edible_portion(1:Ni);

%extract names of systems
[a1,fishtype,c1]=xlsread(dr,'Summary impacts','A4:B15');
fishtype(1,2)={''};fishtype(2,2)={''};  
GH=strcat(fishtype(:,1),{' '},fishtype(:,2));
