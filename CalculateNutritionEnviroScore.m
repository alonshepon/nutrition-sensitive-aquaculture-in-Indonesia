%calculte nutritional score of fish

%remove "Others" from the calculation as it is an average of the others
n_show=[1:11];
%%%------RDA of nutrients Males 50-70
%https://www.ncbi.nlm.nih.gov/books/NBK545442/table/appJ_tab3/?report=objectonly
%in units of nutrients/cap/d
RDA_zinc=11;
RDA_iron=8;
RDA_omega=0.25;
RDA_calcium=1000;
RDA_iodine=150;
RDA_vitaminA=900;


% %Nutritional score of produced g from each system
% Score=edible_portion(n_show).*(zinc_fish(n_show)/EAR_zinc+iron_fish(n_show)/EAR_iron...
%     +calcium_fish(n_show)/EAR_calcium+iodine_fish(n_show)/EAR_iodine...
%     +vitaminA_fish(n_show)/EAR_vitaminA+omega_fish(n_show)/EAR_omega);
% Score_rel=Score/mean(Score)*100;  %relative nutritional score
% 
% Eveness=Shannon_Pielou_nutrition(edible_portion(n_show).*zinc_fish(n_show)/EAR_zinc,edible_portion(n_show).*iron_fish(n_show)/EAR_iron,edible_portion(n_show).*calcium_fish(n_show)/EAR_calcium,...
%     edible_portion(n_show).*iodine_fish(n_show)/EAR_iodine,edible_portion(n_show).*vitaminA_fish(n_show)/EAR_vitaminA,edible_portion(n_show).*omega_fish(n_show)/EAR_omega);

%Nutritional score of produced g from each system
Score=edible_portion(n_show).*(zinc_fish(n_show)/RDA_zinc+iron_fish(n_show)/RDA_iron...
    +calcium_fish(n_show)/RDA_calcium+iodine_fish(n_show)/RDA_iodine...
    +vitaminA_fish(n_show)/RDA_vitaminA+omega_fish(n_show)/RDA_omega);
Score_rel=Score/mean(Score)*100;  %relative nutritional score

Eveness=Shannon_Pielou_nutrition(edible_portion(n_show).*zinc_fish(n_show)/RDA_zinc,edible_portion(n_show).*iron_fish(n_show)/RDA_iron,edible_portion(n_show).*calcium_fish(n_show)/RDA_calcium,...
    edible_portion(n_show).*iodine_fish(n_show)/RDA_iodine,edible_portion(n_show).*vitaminA_fish(n_show)/RDA_vitaminA,edible_portion(n_show).*omega_fish(n_show)/RDA_omega);




%Enviromental index calculation according to Eshel et al 2019 Scientific reports paper
Nonredundent=find(A*ub-b'>0); %for upper bound limits
rrt=[Nonredundent(1:end-1)]; %remove mass at last index 10
Env_metrics=A([rrt],:)/10^6;%enviromental metrics per produced g
teta=-ones(length(rrt),1);  %teta is negative for upper bounds
Env_composite_indicator=sum(teta.*(Env_metrics-mean(Env_metrics,2))./std(Env_metrics,0,2),1);

%-------rescale to values between 0 and 1, with 1 having higher impact
Env_composite_indicator_rescale=abs(rescale(Env_composite_indicator)-1);
