clf
colors_x=[51, 34, 136;...
       136, 204 ,238;...
       68, 170, 153;...
       17, 119, 51;...
       153, 153, 51;...
       221, 204, 119;...
       204, 102, 119;...
       136,34,85]/255;
%------------------------compared to BAU2030 with normalization of mass
ii_change=[2,3,4,5,6];  %non BAU scenarios
massCorrection = 1./(TotalMassIncrease(ii_change)/TotalMassIncrease(1))';  
P=round(cat(2,[100*(IncreaseMangrove2030(ii_change)/IncreaseMangrove2030(1))'.*massCorrection,100*(wholefish(ii_change)/wholefish(1))'.*massCorrection,100*(Eutroph(ii_change)/Eutroph(1))'.*massCorrection],[100*(Land(ii_change)/Land(1))'.*massCorrection],[100*(water(ii_change)/water(1))'.*massCorrection],[100*(IncreaseZinc2030(ii_change)/IncreaseZinc2030(1))'.*massCorrection],...
    100*(IncreaseIron2030(ii_change)/IncreaseIron2030(1))'.*massCorrection,100*(IncreaseCalcium2030(ii_change)/IncreaseCalcium2030(1))'.*massCorrection,100*(IncreaseVitaminA2030(ii_change)/IncreaseVitaminA2030(1))'.*massCorrection,100*(IncreaseIodine2030(ii_change)/IncreaseIodine2030(1))'.*massCorrection,100*(IncreaseOmega2030(ii_change)/IncreaseOmega2030(1))'.*massCorrection,...
    100*(GWP(ii_change)/GWP(1))'.*massCorrection,100*(Acid(ii_change)/Acid(1))'.*massCorrection,100*(energy(ii_change)/energy(1))'.*massCorrection));
P_labels={'mangrove','wild fish','eutrophication','land','water','zinc','iron','calcium','vitamin A','iodine','omega n-3','GW','acidification','energy'};

clf
PP_new=P(:,[6,7,8,9,10,11,1,2,3,4,5,12,13,14]);

%for line drawing
xx=[-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;...
    -6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8];
hold on
line([-7 -7],[0 350],'Color',[1 1 1],'LineWidth',0.7)
for i=1:5
r=scatter(xx(i,:),PP_new(i,:),20,colors_x(i,:),'filled');
line(xx(i,:),PP_new(i,:),'Color',colors_x(i,:))
end
set(gca,'YTick',[50,100,150,200,250,300,350],'XtickLabel',[50,100,150,200,250,300,350])
drawaxis(gca, 'y', 0)
ylabel('')
xlim([-7,9])
ylim([0,350])
xticks([-6:-1,1:8])
set(gca,'XtickLabel',P_labels([6,7,8,9,10,11,1,2,3,4,5,12,13,14]),'XTickLabelRotation',45)
text(0.45,340,'Environment','Color',[0.5 0.5 0.5])
text(-5.5,340,'Nutrition','Color',[0.5 0.5 0.5])
line([-6:8],[100,100,100,100,100,100,100,...
    100,100,100,100,100,100,100,100],'Color',[0.5 0.5 0.5])
label_scenario={'BAU30','AS1','AS2','AS3','AS4','AS5'};

%draw lengend
sdd=15;sdd_1=340;
text(7,sdd_1,label_scenario{2});%text(-5.1,201,'o','Color',colors_x(2,:));
text(7,sdd_1-1*sdd,label_scenario{3});%text(-5.1,191,'o','Color',colors_x(3,:));
text(7,sdd_1-2*sdd,label_scenario{4});%text(-5.1,181,'o','Color',colors_x(4,:));
text(7,sdd_1-3*sdd,label_scenario{5});%text(-5.1,171,'o','Color',colors_x(5,:));
text(7,sdd_1-4*sdd,label_scenario{6});%text(-5.1,161,'o','Color',colors_x(6,:));
fr=[sdd_1,sdd_1-1*sdd,sdd_1-2*sdd,sdd_1-3*sdd,sdd_1-4*sdd]-0.5;

for i=1:5
scatter(6.8,fr(i),30,colors_x(i,:),'filled')
end
hold off
%% save figure
saveas(gcf,'fig2_proposedScenarios.fig')
set(gcf,'PaperPositionMode','auto')
print('futurescenarios_againstBAU2030.bmp','-dbmp','-r350')
print('futurescenarios_againstBAU2030.pdf','-dpdf','-r350')
