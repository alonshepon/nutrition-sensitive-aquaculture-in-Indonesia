%------Linear optimization
%clear Production_fish error_production x shadowprice sensitivity cost_tot ct
%                1         2         3
%       1234567890123456789012345678901234
 ct  = 'UUUUUUUUUS';
%           'F' Free (unbounded) variable (the constraint is ignored).
%           'U' Variable with upper bound ( A(i,:)*x <= b(i)).
%           'S' Fixed Variable (A(i,:)*x = b(i)).
%           'L' Variable with lower bound (A(i,:)*x >= b(i)).
%           'D' Double-bounded variable (A(i,:)*x >= -b(i) and A(i,:)*x <= b(i)).

%1} = 'Global warming_(tonnes CO2eq)';
%2} = 'Acidification_(tonnes SO2eq)'
%3} = 'Eutrophicaton_(tonnes PO4eq)';
%4} = 'Land_(dunam)';
%5} = 'FWC_(10^3 m^3)';
%6} = 'Energy_(10^3 MJ)';
%7} = 'wholefish_(10^3 T)';
%8} = 'mangrove land_(dunam)';
%9} = 'freshwater land_(dunam)';
%10} = 'Mass_(10^6 kg)';


% cost function (nutrition of fish)
costt='reg';   %%%'reg'/'nutritional_yield'. regular nutritional output and one 'All', deviation from normalized std
create_cost_function
Production_fish=zeros(Ni,r(2)+1);
vt = char('C'*ones(1,Ni));
t=-1; %1 - minimization; -1 maximization
clear error_production Production_fish x
for i=1:size(C,2)
    Ci  = C(:,i); %cost function
        
    %%--------------glpk with Monte Carlo
    
    %monte carlo runs for uncertainities bars
    MC_rounds=1000;
    z=0.1; %percentage of change
    [xm,c,e,extra,uncertain_x,success_rate]=lp_WithSensitivityAnalysis_indo(Ci,A,b,lb,ub,ct,vt,t,MC_rounds,z);
    xmt(i)={xm};
    error_production(:,i)=uncertain_x/1000;  % uncertainties values in Mt/yr
    Impactful_constraint(:,i)=abs(mean(A*xm,2)-b')./b'*100; %calculation of combined environmental impact parameter
    
    %--------------non monte carlo runs for average values and shadow prices
    [x,c,e,extra] = glpk(Ci,A,b,lb,ub,ct,vt,t); %-1 maximization, 1 minimaztion
    cost_tot(i)=Ci'*x;
    shadowprice(:,i)=extra.lambda;
    sensitivity(:,i)=(shadowprice(:,i)/(cost_tot(i))).*b'*0.01*100;
    Production_fish(:,i)=x/1000;         % production values in Mt/yr
  
end

