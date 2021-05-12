%calculate nutritional production for future scenarios
%expand from groups fish type to  number of systems

monodon=xlsread(dr,'Summary impacts','Q18'); %ratio of monodon yield (compared to milkfish) in monodon milkfish system
milkfish=1;
presentMassSystems=Expand2SpeciesSystems(presentMass,monodon,milkfish);    %fish amount in 10^6 kg in 2012 by systems
FutureMassSystems=Expand2SpeciesSystems(futureMass,monodon,milkfish); %%fish amount in 10^6 kg in 2030 by systems
IncreaseMassSystems=FutureMassSystems./presentMassSystems;

presentMassSystems1=presentMassSystems([1:Ni],:);
IncreaseMassSystems1=IncreaseMassSystems([1:Ni],:);
edible_portion=edible_portion([1:Ni]);

EdiblepresentMassSystems=presentMassSystems1.*edible_portion*10^9;%convert to edible mass in g per year

zincpresentSystems=EdiblepresentMassSystems.*zinc_fish;  %in mg per y
IncreaseZinc2030=sum(zincpresentSystems.*IncreaseMassSystems1,1)./sum(zincpresentSystems,1)*100; %in percent

ironpresentSystems=EdiblepresentMassSystems.*iron_fish;  %in mg per y
IncreaseIron2030=sum(ironpresentSystems.*IncreaseMassSystems1,1)./sum(ironpresentSystems,1)*100; %in percent

calciumpresentSystems=EdiblepresentMassSystems.*calcium_fish;  %in mg per y
IncreaseCalcium2030=sum(calciumpresentSystems.*IncreaseMassSystems1,1)./sum(calciumpresentSystems,1)*100;%in percent

vitaminApresentSystems=EdiblepresentMassSystems.*vitaminA_fish;  %in mg per y
IncreaseVitaminA2030=sum(vitaminApresentSystems.*IncreaseMassSystems1,1)./sum(vitaminApresentSystems,1)*100;%in percent

iodinepresentSystems=EdiblepresentMassSystems.*iodine_fish;  %in mcg per y
IncreaseIodine2030=sum(iodinepresentSystems.*IncreaseMassSystems1,1)./sum(iodinepresentSystems,1)*100;%in percent

omegapresentSystems=EdiblepresentMassSystems.*omega_fish;  %in mcg per y
IncreaseOmega2030=sum(omegapresentSystems.*IncreaseMassSystems1,1)./sum(omegapresentSystems,1)*100;%in percent

%---------mangrove
rr='Summary impacts';
[aa,fishtype,c]=xlsread(dr,rr,'P4:P15');  %1/yield
M=zeros(1,Ni);  %mangrove land occupation
M(1)=aa(1);% land occupation: 1/yields in units of m2/ton. 
M(2)=aa(2);
M(3)=aa(3);
mangrovepresentSystems=presentMassSystems.*M';  %in dunam
IncreaseMangrove2030=sum(mangrovepresentSystems.*IncreaseMassSystems1,1)./sum(mangrovepresentSystems,1)*100;%in percent

%%%%enviromental burden increase (based on Henriksson 2017, new LCA data and systems scenarios)
BAUEnvir=xlsread(dr,'BAU','X2:X9');%mass allocation
AS1Envir=xlsread(dr,'AS1','X2:X9');%mass allocation
AS2Envir=xlsread(dr,'AS2','X2:X9');%mass allocation
AS3Envir=xlsread(dr,'AS3','X2:X9');%mass allocation
AS4Envir=xlsread(dr,'AS4','X2:X9');%mass allocation
AS5Envir=xlsread(dr,'AS5','X2:X9');%mass allocation
TotalMassIncrease=[BAUEnvir(1) AS1Envir(1) AS2Envir(1) AS3Envir(1) AS4Envir(1) AS5Envir(1)]*100;
GWP=[BAUEnvir(2) AS1Envir(2) AS2Envir(2) AS3Envir(2) AS4Envir(2) AS5Envir(2)]*100;
Acid=[BAUEnvir(3) AS1Envir(3) AS2Envir(3) AS3Envir(3) AS4Envir(3) AS5Envir(3)]*100;
Eutroph=[BAUEnvir(4) AS1Envir(4) AS2Envir(4) AS3Envir(4) AS4Envir(4) AS5Envir(4)]*100;
Land=[BAUEnvir(5) AS1Envir(5) AS2Envir(5) AS3Envir(5) AS4Envir(5) AS5Envir(5)]*100;
water=[BAUEnvir(6) AS1Envir(6) AS2Envir(6) AS3Envir(6) AS4Envir(6) AS5Envir(6)]*100;
energy=[BAUEnvir(7) AS1Envir(7) AS2Envir(7) AS3Envir(7) AS4Envir(7) AS5Envir(7)]*100;
wholefish=[BAUEnvir(8) AS1Envir(8) AS2Envir(8) AS3Envir(8) AS4Envir(8) AS5Envir(8)]*100;
