clc;
clear;

minD = 1000;
ming = 0;
He=zeros(1,4163);
Ke=zeros(1,4163);
Ge=zeros(1,4163);
 for k=0:1:22
     for g=10600:100:28600
       [H, L, yitas] = get_H(36,16,k,g);
       He((g-10600)/100+1+k*181)=H;
        Ke((g-10600)/100+1+k*181)=k;
        Ge((g-10600)/100+1+k*181)=g;
       if ((18-H)^2 < minD) 
          minD = (18-H)^2;
          ming = g;
          HI = H;
          LI = L;
          Yita = yitas;
       end
     end
 end
plot3(Ke,Ge,He);
disp(HI)
% minDistance
% minAlpha
