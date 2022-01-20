clc
close all
clear all

%  Wiœniewski Olgierd

disp('Autor:'); 
disp('Olgierd Wiœniewski');

% Dane odbiorników
R1=12000;
R2=13000;
R3=14000;
R4=15000;
R5=16000;
R6=17000;
U1=1;
E=U1;

 % Obliczenia dla obwodu oryginalnego
RA=(R4*(R5+R6))/(R5+R6+R4);
Rukl=R1+(R2*(R3+RA))/(R2+R3+RA);
I1=E/Rukl;
UR1=I1*R1;
UR2=U1-UR1;
I2=UR2/R2;
I3=I1-I2;
UR3=I3*R3;
UR4=UR2-UR3;
I4=UR4/R4;
I5=I3-I4;
UR5=I5*R5;
I6=I5;
UR6=I6*R6;
U2=UR6;
Tv=U2/U1;
 
  % Wyprowadzenie wyników na obszar roboczy
disp(['Pr¹d I1 dla obwodu oryginalnego=',num2str(I1)]);
disp(['Pr¹d I2 dla obwodu oryginalnego=',num2str(I2)]);
disp(['Pr¹d I3 dla obwodu oryginalnego=',num2str(I3)]);
disp(['Pr¹d I4 dla obwodu oryginalnego=',num2str(I4)]);
disp(['Pr¹d I5 dla obwodu oryginalnego=',num2str(I5)]);
disp(['Pr¹d I6 dla obwodu oryginalnego=',num2str(I6)]);
disp(['Napiêcie U1 dla obwodu oryginalnego=',num2str(U1)]);
disp(['Napiêcie UR1 dla obwodu oryginalnego=',num2str(UR1)]);
disp(['Napiêcie UR2 dla obwodu oryginalnego=',num2str(UR2)]);
disp(['Napiêcie UR3 dla obwodu oryginalnego=',num2str(UR3)]);
disp(['Napiêcie UR4 dla obwodu oryginalnego=',num2str(UR4)]);
disp(['Napiêcie UR5 dla obwodu oryginalnego=',num2str(UR5)]);
disp(['Napiêcie UR6 dla obwodu oryginalnego=',num2str(UR6)]);
 
  % Obliczenia dla obwodu przyrostowego
delR1=1;
delI1=-(I1*delR1)/Rukl;
delUR1=R1*delI1;
delUR2=-(I1*delR1)-delUR1;
delI2=delUR2/R2;
delI3=delI1-delI2;
delUR3=R3*delI3;
delUR4=delUR2-delUR3;
delI4=delUR4/R4;
delI5=delI3-delI4;
delUR5=R5*delI5;
delI6=delI5;
delUR6=R6*delI6;
delU2=delUR6;
  
  % Wyprowadzenie wyników na obszar roboczy
disp(['Przyrost pr¹du I1 dla obwodu przyrostowego=',num2str(delI1)]);
disp(['Przyrost pr¹du I2 dla obwodu przyrostowego=',num2str(delI2)]);
disp(['Przyrost pr¹du I3 dla obwodu przyrostowego=',num2str(delI3)]);
disp(['Przyrost pr¹du I4 dla obwodu przyrostowego=',num2str(delI4)]);
disp(['Przyrost pr¹du I5 dla obwodu przyrostowego=',num2str(delI5)]);
disp(['Przyrost pr¹du I6 dla obwodu przyrostowego=',num2str(delI6)]);
disp(['Przyrost napiêcia UR1 dla obwodu przyrostowego=',num2str(delUR1)]);
disp(['Przyrost napiêcia UR2 dla obwodu przyrostowego=',num2str(delUR2)]);
disp(['Przyrost napiêcia UR3 dla obwodu przyrostowego=',num2str(delUR3)]);
disp(['Przyrost napiêcia UR4 dla obwodu przyrostowego=',num2str(delUR4)]);
disp(['Przyrost napiêcia UR5 dla obwodu przyrostowego=',num2str(delUR5)]);
disp(['Przyrost napiêcia UR6 dla obwodu przyrostowego=',num2str(delUR6)]);

 % Obliczenia wra¿liwoœci wzglêdem transmitancji napiêciowej Tv
delTv=delU2/U1;
BTvR1=delTv/delR1;
STvR1=BTvR1*(R1/U2);

 % Wyprowadzenie wyników na obszar roboczy
disp(['Zmiana transmitancji napiêciowej Tv dla obwodu przyrostowego=',num2str(delTv)]);
disp(['Wra¿liwoœæ bezwzglêdna transmitancji napiêciowej na zmianê rezystancji R1=',num2str(BTvR1)]);
disp(['Wra¿liwoœæ wzglêdna transmitancji napiêciowej na zmianê rezystancji R1=',num2str(STvR1)]);

 % Obliczenia wra¿liwoœci impedancji wejœciowej wzglêdem rezystancji R1
 Zwe=U1/I1;
 delZwe=(I1*delR1)/I1;
 BZweR1=delZwe/delR1;
 SZweR1=BZweR1*(R1/Zwe);
 
  % Wyprowadzenie wyników na obszar roboczy
disp(['Impedancja Zwe dla uk³adu oryginalnego=',num2str(Zwe)]);
disp(['Zmiana impedancji wejœciowej Zwe dla obwodu przyrostowego=',num2str(delZwe)]);
disp(['Wra¿liwoœæ bezwzglêdna impedancji wejœciowej na zmianê rezystancji R1=',num2str(BZweR1)]);
disp(['Wra¿liwoœæ wzglêdna impedancji wejœciowej na zmianê rezystancji R1=',num2str(SZweR1)]);

% Obliczenia wra¿liwoœci impedancji wyjœciowej wzglêdem rezystancji R1
Zwy=U2/I6;
delZwy=delU2/I6;
BZwyR1=delZwy/delR1;
SZwyR1=BZwyR1*(R1/Zwy);

  % Wyprowadzenie wyników na obszar roboczy
disp(['Impedancja Zwy dla uk³adu oryginalnego=',num2str(Zwy)]);
disp(['Zmiana impedancji wyjœciowej Zwy dla obwodu przyrostowego=',num2str(delZwy)]);
disp(['Wra¿liwoœæ bezwzglêdna impedancji wyjœciowej na zmianê rezystancji R1=',num2str(BZwyR1)]);
disp(['Wra¿liwoœæ wzglêdna impedancji wyjœciowej na zmianê rezystancji R1=',num2str(SZwyR1)]);


 % Wyznaczenie wra¿liwoœci na wykresie w zale¿noœci od zmiany rezystancji
 % R1 w wiêkszym zakresie do 10%

 % Zmiana rezystancji R1 w zakresie 1% - 10% 
dR1=(0.01:0.001:0.1)*R1;

% wyznaczanie wra¿liwoœci napiêcia wyjœciowego U2 na zmianê rezystancji R1
for k = 1:length(dR1);
dI1(k)=-(I1*dR1(k))/Rukl;
dUR1=R1*dI1;
dUR2=-(I1*dR1(k))-dUR1;
dI2=dUR2/R2;
dI3=dI1-dI2;
dUR3=R3*dI3;
dUR4=dUR2-dUR3;
dI4=dUR4/R4;
dI5=dI3-dI4;
dUR5=R5*dI5;
dI6=dI5;
dUR6=R6*dI6;
dU2=dUR6;

B(k)=dU2(k)/dR1(k);
S(k)=B(k)*R1/U2;
end

 % Wykres wartoœæ wra¿liwoœci wzglêdem zmian rezystancji R1
figure(1);
plot(dR1,B,'r',dR1,S,'b')
title('Wartoœæ wra¿liwoœci transmitancji wzglêdem zmian rezystancji R1');
legend('wra¿liwoœæ bezwzglêdna','wra¿liwoœæ wzglêdna');
xlabel('dR1');
ylabel('B, S');

 % Wyznaczanie wra¿liwoœci napiêcia wyjœciowego U2 na zmianê rezystancji
 % R1 - rezystancja zmienia siê od 1% do 10%
dR1t = [0 dR1];
for k = 1:length(dR1t);

R1t(k) = 12000+dR1t(k);
R2t=13000;
R3t=14000;
R4t=15000;
R5t=16000;
R6t=17000;

RAt=(R4t*(R5t+R6t))/(R5t+R6t+R4t);
Ruklt=R1t(k)+(R2t*(R3t+RAt))/(R2t+R3t+RAt);
I1t=E/Ruklt;
UR1t=R1t(k)*I1t;
UR2t=E-UR1t;
I2t=UR2t/R2t;
I3t=I1t-I2t;
UR3t=R3t*I3t;
UR4t=UR2t-UR3t;
I4t=UR4t/R4t;
I5t=I3t-I4t;
UR5t=R5t*I5t;
I6t=I5t;
UR6t=R6t*I6t;
Uwyj(k)=UR6t;

end

% Wykres wartoœci napiêcia wyjœciowego w zale¿noœci od zmiany rezystancji R1 
figure(2);
plot(R1t,Uwyj);
title('Wartoœæ napiêcia wyjœciowego w zale¿noœci od zmiany R1');
xlabel('R1');
ylabel('Uwyj'); hold on


