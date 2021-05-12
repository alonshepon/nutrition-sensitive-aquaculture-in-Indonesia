%----------------create matrix A
%units [impact]/ton
%row# 1: GHG; 2: Acidification; 3:Eutroph.; 4: Land use
%5:freshwater; 6: energy; 7:whole fish as feed; 8: land occupation
%9: freshwater land occupation
rr='Summary impacts';
[a,fishtype,c]=xlsread(dr,rr,'A4:H15');  
A=a';   %burdens per whole seafood production(edible and non-edible) in ton per y
[aa,fishtype,c]=xlsread(dr,rr,'P4:P15');  %1/yield (m^2/ton)
[bb,fishtype,c]=xlsread(dr,rr,'O4:O15');  %whole fish use as feed/ton
A(7,:)=bb;  %whole fish use/ton
A(8,:)=zeros(1,Ni);  %mangrove land occupation
A(8,1)=aa(1);%  in units of m2/ton.
A(8,2)=aa(2);
A(8,3)=aa(3);
A(9,:)=zeros(1,Ni);  %freshwater land occupation
A(9,4)=aa(4);% in units of m2/ton. 
A(9,5)=aa(5);
A(9,6)=aa(6);
A(9,7)=aa(7);
A(9,8)=aa(8);
A(9,9)=aa(9);
A(9,10)=aa(10);
A(10,:)=ones(1,Ni);   %add mass constraint


%create b vector
%national level enviromental burdens constraints for future scenario 
%based on BAU in year 2030
rr='BAU';

[GHG]=xlsread(dr,rr,'T27');  %tonnes CO2eq: kgCO2eq/ton (impact)*10^6kg (mass) = kgCO2eq/(10^3kg)*10^6kg=10^3kg CO2eq
[Acd]=xlsread(dr,rr,'T41');  %tonnes SO2eq : kgSO2eq/ton (impact)*10^6kg (mass) = kgSO2eq/(10^3kg)*10^6kg=10^3kg SO2eq
[Eutr]=xlsread(dr,rr,'T55');  %tonnes PO4eq : kgPO4eq/ton (impact)*10^6kg (mass) = kgPO4eq/(10^3kg)*10^6kg=10^3kg PO4eq
[Land_use]=xlsread(dr,rr,'T69');  %dunam : m^2/ton (impact)*10^6kg (mass) = m^2/(10^3kg)*10^6kg=10^3 m^2
[FWC]=xlsread(dr,rr,'T83'); %1000 m^3 : m^3/ton (impact)*10^6kg (mass) = m^3/(10^3kg)*10^6kg=10^3 m^3
[Energy]=xlsread(dr,rr,'T97'); %1000 MJ : MJ/ton (impact)*10^6kg (mass) = MJ/(10^3kg)*10^6kg=10^3 MJ
[wholeFish]=xlsread(dr,rr,'T111'); %1000 tonnes : tonFish/ton (impact)*10^6kg (mass) = tonFish/(10^3kg)*10^6kg=10^3 tonFish
[Mass]=xlsread(dr,rr,'T10');  %million kg production for BAU in year 2030
lb = presentMassSystems(:,1); %lowerbounds is current production volumes, million kg
ub = ones(Ni,1)*Mass;  %upper production bound is BAU in year 2030.

%
[mangrove_land]=sum(A(8,:)'.*FutureMassSystems(:,1));%future mangrove utilization in dunam 
%Its current value according to the literature is 680k hectares or
%682857*10 (7M dunam), from  pg 265 and table 2 from the ref 1 below
%the upper bound value obtained here is about 50M dunam and reflects 1/yield data*BAU30 production volumes
%ref 1:A review and SWOT analysis of aquaculture development in Indonesia, Reviews in Aquaculture (2013) 5, 255–279, Rimmer et al

[freshwater_land]=sum(A(9,:)'.*presentMassSystems(:,1))+1536289*10;
%(1536289+1390+146577)*10;%+(158125)+(541100))*10;%Potential area for freshwater aquaculture. 
%The second value is potential of rice paddies expansion converted to dunam from the above ref (ref 1, table 2). 

b=[GHG,Acd,Eutr,Land_use,FWC,Energy,wholeFish,mangrove_land,freshwater_land,Mass];

%check redundanr enviromental constraint
is_constraint_redundant=logical(A*ub<b');
