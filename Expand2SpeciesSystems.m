function MassSystems=Expand2SpeciesSystems(Mass,monodon,milkfish);

    MassSystems(1,:)=Mass(2,:)*0.5*milkfish+Mass(2,:)*0.5*monodon;
    MassSystems(2,:)=Mass(1,:)-Mass(2,:)*0.5*monodon;
    MassSystems(3,:)=Mass(2,:)*0.5*milkfish;
    MassSystems(4,:)=Mass(3,:);
    MassSystems(5,:)=Mass(4,:)*0.89;
    MassSystems(6,:)=Mass(4,:)*0.11;
    MassSystems(7,:)=Mass(5,:)*0.75;
    MassSystems(8,:)=Mass(5,:)*0.25;
    MassSystems(9,:)=Mass(6,:)*0.76;
    MassSystems(10,:)=Mass(6,:)*0.24;
    MassSystems(11,:)=Mass(7,:);
    MassSystems(12,:)=Mass(8,:);
