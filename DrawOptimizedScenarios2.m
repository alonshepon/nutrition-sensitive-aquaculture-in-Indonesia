clf
clear h
width=0.7;
rr='BAU';

c=[1:Ni];
hold on
bar(c,FutureMassSystems(:,1)/1000,'FaceColor',[1 1 1],'EdgeColor',[0 0 0],'LineWidth',0.5);
h=bar(zeros(size(Production_fish,1),size(Production_fish,2)));
g=gca;
hold off
g.XTick='';
ylabel('Fish production in 2030 (Mt/y)','FontSize',9)
box('off')
n_metrics=size(Production_fish,2);

color_i=[0.21 0.16 0.53;...
    0.024 0.43 0.88;...
    0.027 0.61 0.81;...
     0.19 0.72 0.63;...
    0.65 0.75 0.42;...
    0.99 0.7 0.25;...
    1 0.84 0.0;...
    1 1 1];   %last one is white

%draw optimization results using line plots
%par is distance from each bar
%offset under number
r=1;
sss=0.05;
for i=1:Ni
    [m,a]=(find(Production_fish(i,:)>0));
    if isempty(m)
        continue
    else
    for ii=1:length(m)
        if length(m)>1 offset=0.05*length(m);par=0.112;end
        if length(m)==1 offset=0;par=0;end
    line([(i)-offset+par*(ii-1) (i)-offset+par*(ii-1)],[0 Production_fish(i,a(ii))],'Color',color_i(a(ii),:),'LineWidth',3);
    %-------draw error bars
    if sum((sum(error_production)))~=0
    line([(i)-offset+par*(ii-1) (i)-offset+par*(ii-1)],[Production_fish(i,a(ii)) Production_fish(i,a(ii))+error_production(i,a(ii))],'Color','k')
    line([(i)-offset+par*(ii-1) (i)-offset+par*(ii-1)],[Production_fish(i,a(ii)) Production_fish(i,a(ii))-error_production(i,a(ii))],'Color','k')
    line([(i)-offset+par*(ii-1)-sss (i)-offset+par*(ii-1)+sss],[Production_fish(i,a(ii))+error_production(i,a(ii)) Production_fish(i,a(ii))+error_production(i,a(ii))],'Color','k')
    line([(i)-offset+par*(ii-1)-sss (i)-offset+par*(ii-1)+sss],[Production_fish(i,a(ii))-error_production(i,a(ii)) Production_fish(i,a(ii))-error_production(i,a(ii))],'Color','k')
    %errorbar((i)-offset+par*(ii-1),Production_fish(i,a(ii)),error_production(i,a(ii)),'k')
    end
    hold on
    end
    end
end
%create patchs for line legend coloring
h(8)=bar(-1,-1);
%set(gca,'xlim',[0.5,12.5],'ylim',[0,7])
for i=1:8
    h(i).FaceColor=color_i(i,:);
end
nutrients={'All scen.','zinc scen.','iron scen.','calcium scen.','vitamin A scen.','iodine scen.','omega scen.','BAU scen.'};
[m,icons,plots,legend_text]=legend(h,nutrients,'Location','northwest','Fontsize',7);%,'FontWeight','bold');
m.FontWeight='bold';
m.ItemTokenSize=[7,10];
m.Position=[0.76 0.6 0.1733 0.2209];
m.Title.String='Optim. scen.';
for k=1:7
    icons(k).FontSize = 7;
end
for k = 9:16
    if not(k==16)
icons(k).Children.EdgeColor = [1 1 1];
    else
   icons(k).Children.EdgeColor = [0 0 0]; 
    end
end
%draw lines of system types:brackish, freshwater or mariculture
grey=[0.5 0.5 0.5];
line([0.5 3.5],[5.5 5.5],'Color',grey);line([0.5 0.5],[5.3 5.7],'Color',grey);line([3.5 3.5],[5.3 5.7],'Color',grey);text(1.6,5.9,'brackish','FontSize',7,'Color',grey)
line([3.6 10.5],[5.5 5.5],'Color',grey);line([3.6 3.6],[5.3 5.7],'Color',grey);line([10.5 10.5],[5.3 5.7],'Color',grey);text(6.5,5.9,'freshwater','FontSize',7,'Color',grey)
line([10.6 11.5],[5.5 5.5],'Color',grey);line([10.6 10.6],[5.3 5.7],'Color',grey);line([11.5 11.5],[5.3 5.7],'Color',grey);text(10.65,5.9,'marine','FontSize',7,'Color',grey)
legend('boxoff');
g.XTick=[1:Ni];
g.XTickLabelRotation=45;
for i=1:Ni
g.XTickLabel(i)=GH(i);
end
 %m.Title.String='nutrient optim.';
 g.XLim=[0.5 Ni+0.5];
 g.YLim=[0 6];
%%
%set(gcf,'PaperPositionMode','auto')
print(gcf,'fishOptimization.bmp','-dbmp','-r300')
print(gcf,'fishOptimization.pdf','-dpdf','-r400')
% fig=gcf;
% fig.PaperUnits = 'normalized';

%fig.PaperPosition = [0.1699    0.3049    0.6601    0.3902];
%print(gcf,'fishOptimization.bmp','-dbmp','-r400')

