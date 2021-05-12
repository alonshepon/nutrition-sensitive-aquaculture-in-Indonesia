%extract enviromental performance of each fish type per scenario
%excluding 'others'
presentMass=zeros(8,6);
increaseMass=zeros(8,6);
EnvironmentalDataIncrease=zeros(8,6);
names={'BAU','AS1','AS2','AS3','AS4','AS5'};
for i=1:6
presentMass(:,i)=xlsread(dr,names{i},'B2:B9');    %fish amount in 10^6 kg in 2012
futureMass(:,i)=xlsread(dr,names{i},'T2:T9');    %%fish amount in 10^6 kg in 2030
EnvironmentalDataIncrease(:,i)=xlsread(dr,names{i},'X2:X9');    %%environmental burdance increase in 2030
end