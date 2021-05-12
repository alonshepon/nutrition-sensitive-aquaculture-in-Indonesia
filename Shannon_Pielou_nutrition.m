function Score=Shannon_Pielou_nutrition(Y1,Y2,Y3,Y4,Y5,Y6);
%https://en.wikipedia.org/wiki/Species_evenness
%correct for zeros: instead of zeros make small number
Y1(find(Y1==0))=0.000000000001;
Y2(find(Y2==0))=0.000000000001;
Y3(find(Y3==0))=0.000000000001;
Y4(find(Y4==0))=0.000000000001;
Y5(find(Y5==0))=0.000000000001;
Y6(find(Y6==0))=0.000000000001;

for i=1:11
Score(i)=Pielou_function(Y1(i),Y2(i),Y3(i),Y4(i),Y5(i),Y6(i));
end

