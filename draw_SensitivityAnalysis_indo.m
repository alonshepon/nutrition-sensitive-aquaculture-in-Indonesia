function draw_SensitivityAnalysis_indo(C,xmt,labels)
    %%%-------prepare to draw
    for i=1:length(xmt)
        x=xmt{i}/1000;  %convert to Mt/y
        Ci=C(:,i);
        enviro_stat{i}=(Ci'*x)';
        enviro_sub=mean(Ci'*x);
        %amount_in_gr=mean(sum(x,1));
        %x_stat=x;
        %x=mean(x,2);
    end
    %%%%------draw
    clf
enviro_units={'','','','','','',''};
dd=0.04;  %movement on the y axis of each subplot
    hold on
for i=1:length(enviro_stat)
pos1 = [0.2 0.07+dd 0.65 0.07];
subplot('Position',pos1)
q95=quantile(enviro_stat{i},0.95);
q75=quantile(enviro_stat{i},0.75);
q25=quantile(enviro_stat{i},0.25);
w95=(q95-q75)/(q75-q25);
%boxplot((enviro_stat(:,i)),'labels',labels(i),'orientation','horizontal','labelorientation','inline','Whisker',w95,'Symbol','r.','Width',0.5);%'PlotStyle','compact');%,'Notch','on');
boxplot((enviro_stat{i}),'orientation','horizontal','labelorientation','inline','Whisker',w95,'Symbol','r.','Width',0.5);%'PlotStyle','compact');%,'Notch','on');
gg=gca;
gg.XLabel.String=enviro_units{i};
if i==1
    text(50,-0.5,'Mt/y')
end
% xtick = get(gca, 'xtick');
% for i = 1:length(xtick)
%     xticklabel{i} = sprintf(y_formatstring, xtick(i));
% end
set(gca, 'Yticklabel', '')
%text(-5,0.01+dd+0.02,labels(i),'HorizontalAlignment','Right','Units','normalized');
text(-0.01,0.5,labels(i),'HorizontalAlignment','Right','Units','normalized')
dd=dd+0.13;
end

hold off
set(gcf,'PaperPositionMode','auto')
print('enviro_MonteCarlo_randomA.bmp','-dbmp','-r350')