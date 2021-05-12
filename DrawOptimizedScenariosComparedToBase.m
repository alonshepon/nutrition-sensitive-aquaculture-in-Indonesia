clf
colors_i=[0.21 0.16 0.53;...
    0.024 0.43 0.88;...
    0.027 0.61 0.81;...
     0.19 0.72 0.63;...
    0.65 0.75 0.42;...
    0.99 0.7 0.25;...
    1 0.84 0.0;...
    1 1 1];  

P=round(cat(2,Mangrove_compare',Wholefish_compare',Eutr_compare',Land_compare',FWC_compare',IncreaseInZinc',IncreaseInIron',IncreaseInCalcium',IncreaseInVitaminA',IncreaseInIodine',...
    IncreaseInOmega',GHG_compare',Acid_compare',Energy_compare'));
P_labels={'mangrove','wild fish','eutrophication','land','water','zinc','iron','calcium','vitamin A','iodine','omega n-3','GW','acidification','energy'};

clf
PP_new=P(:,[6,7,8,9,10,11,1,2,3,4,5,12,13,14]);

%for line drawing
xx=[-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;...
    -6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;-6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8;...
    -6,-5,-4,-3,-2,-1,1,2,3,4,5,6,7,8];
hold on
line([-7 -7],[0 350],'Color',[1 1 1],'LineWidth',1)
for i=1:7
r=scatter(xx(i,:),PP_new(i,:),20,colors_i(i,:),'filled');
line(xx(i,:),PP_new(i,:),'Color',colors_i(i,:))
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
line([-5:8],[100,100,100,100,100,100,100,...
    100,100,100,100,100,100,100],'Color',[0.5 0.5 0.5])
label_scenario={'All','zinc','iron','calcium','vitamin A','iodine','omega n-3'};

%draw lengend

text(7,340,label_scenario{1});%text(-5.1,201,'o','Color',colors_x(2,:));
text(7,326,label_scenario{2});%text(-5.1,191,'o','Color',colors_x(3,:));
text(7,312,label_scenario{3});%text(-5.1,181,'o','Color',colors_x(4,:));
text(7,298,label_scenario{4});%text(-5.1,171,'o','Color',colors_x(5,:));
text(7,284,label_scenario{5});%text(-5.1,161,'o','Color',colors_x(6,:));
text(7,270,label_scenario{6})
text(7,256,label_scenario{7})
fr=[341,327,313,299,285,271,257]-1;

for i=1:7
scatter(6.8,fr(i),30,colors_i(i,:),'filled')
end
hold off



%% save figure
saveas(gcf,'fig4_comparingOpt.fig')
%set(gca, 'Position',[0.1300 0.09 0.7750 0.8150])
set(gcf,'PaperPositionMode','auto')
%set(gcf,'PaperPosition',[0.0735    0.3049    0.8529    0.3902])
print('CompareOptimizedscenariostoBAU2030.bmp','-dbmp','-r350')
print('CompareOptimizedscenariostoBAU2030.pdf','-dpdf','-r350')