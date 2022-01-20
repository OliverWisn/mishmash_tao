clc
close all
clear all

%  Wi�niewski Olgierd

disp('Autor:'); 
disp('Olgierd Wi�niewski');

% Dane odbiornik�w
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
 
  % Wyprowadzenie wynik�w na obszar roboczy
disp(['Pr�d I1 dla obwodu oryginalnego=',num2str(I1)]);
disp(['Pr�d I2 dla obwodu oryginalnego=',num2str(I2)]);
disp(['Pr�d I3 dla obwodu oryginalnego=',num2str(I3)]);
disp(['Pr�d I4 dla obwodu oryginalnego=',num2str(I4)]);
disp(['Pr�d I5 dla obwodu oryginalnego=',num2str(I5)]);
disp(['Pr�d I6 dla obwodu oryginalnego=',num2str(I6)]);
disp(['Napi�cie U1 dla obwodu oryginalnego=',num2str(U1)]);
disp(['Napi�cie UR1 dla obwodu oryginalnego=',num2str(UR1)]);
disp(['Napi�cie UR2 dla obwodu oryginalnego=',num2str(UR2)]);
disp(['Napi�cie UR3 dla obwodu oryginalnego=',num2str(UR3)]);
disp(['Napi�cie UR4 dla obwodu oryginalnego=',num2str(UR4)]);
disp(['Napi�cie UR5 dla obwodu oryginalnego=',num2str(UR5)]);
disp(['Napi�cie UR6 dla obwodu oryginalnego=',num2str(UR6)]);
 
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
  
  % Wyprowadzenie wynik�w na obszar roboczy
disp(['Przyrost pr�du I1 dla obwodu przyrostowego=',num2str(delI1)]);
disp(['Przyrost pr�du I2 dla obwodu przyrostowego=',num2str(delI2)]);
disp(['Przyrost pr�du I3 dla obwodu przyrostowego=',num2str(delI3)]);
disp(['Przyrost pr�du I4 dla obwodu przyrostowego=',num2str(delI4)]);
disp(['Przyrost pr�du I5 dla obwodu przyrostowego=',num2str(delI5)]);
disp(['Przyrost pr�du I6 dla obwodu przyrostowego=',num2str(delI6)]);
disp(['Przyrost napi�cia UR1 dla obwodu przyrostowego=',num2str(delUR1)]);
disp(['Przyrost napi�cia UR2 dla obwodu przyrostowego=',num2str(delUR2)]);
disp(['Przyrost napi�cia UR3 dla obwodu przyrostowego=',num2str(delUR3)]);
disp(['Przyrost napi�cia UR4 dla obwodu przyrostowego=',num2str(delUR4)]);
disp(['Przyrost napi�cia UR5 dla obwodu przyrostowego=',num2str(delUR5)]);
disp(['Przyrost napi�cia UR6 dla obwodu przyrostowego=',num2str(delUR6)]);

 % Obliczenia wra�liwo�ci wzgl�dem transmitancji napi�ciowej Tv
delTv=delU2/U1;
BTvR1=delTv/delR1;
STvR1=BTvR1*(R1/U2);

 % Wyprowadzenie wynik�w na obszar roboczy
disp(['Zmiana transmitancji napi�ciowej Tv dla obwodu przyrostowego=',num2str(delTv)]);
disp(['Wra�liwo�� bezwzgl�dna transmitancji napi�ciowej na zmian� rezystancji R1=',num2str(BTvR1)]);
disp(['Wra�liwo�� wzgl�dna transmitancji napi�ciowej na zmian� rezystancji R1=',num2str(STvR1)]);

 % Obliczenia wra�liwo�ci impedancji wej�ciowej wzgl�dem rezystancji R1
 Zwe=U1/I1;
 delZwe=(I1*delR1)/I1;
 BZweR1=delZwe/delR1;
 SZweR1=BZweR1*(R1/Zwe);
 
  % Wyprowadzenie wynik�w na obszar roboczy
disp(['Impedancja Zwe dla uk�adu oryginalnego=',num2str(Zwe)]);
disp(['Zmiana impedancji wej�ciowej Zwe dla obwodu przyrostowego=',num2str(delZwe)]);
disp(['Wra�liwo�� bezwzgl�dna impedancji wej�ciowej na zmian� rezystancji R1=',num2str(BZweR1)]);
disp(['Wra�liwo�� wzgl�dna impedancji wej�ciowej na zmian� rezystancji R1=',num2str(SZweR1)]);

% Obliczenia wra�liwo�ci impedancji wyj�ciowej wzgl�dem rezystancji R1
Zwy=U2/I6;
delZwy=delU2/I6;
BZwyR1=delZwy/delR1;
SZwyR1=BZwyR1*(R1/Zwy);

  % Wyprowadzenie wynik�w na obszar roboczy
disp(['Impedancja Zwy dla uk�adu oryginalnego=',num2str(Zwy)]);
disp(['Zmiana impedancji wyj�ciowej Zwy dla obwodu przyrostowego=',num2str(delZwy)]);
disp(['Wra�liwo�� bezwzgl�dna impedancji wyj�ciowej na zmian� rezystancji R1=',num2str(BZwyR1)]);
disp(['Wra�liwo�� wzgl�dna impedancji wyj�ciowej na zmian� rezystancji R1=',num2str(SZwyR1)]);


 % Wyznaczenie wra�liwo�ci na wykresie w zale�no�ci od zmiany rezystancji
 % R1 w wi�kszym zakresie do 10%

 % Zmiana rezystancji R1 w zakresie 1% - 10% 
dR1=(0.01:0.001:0.1)*R1;

% wyznaczanie wra�liwo�ci napi�cia wyj�ciowego U2 na zmian� rezystancji R1
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

 % Wykres warto�� wra�liwo�ci wzgl�dem zmian rezystancji R1
figure(1);
plot(dR1,B,'r',dR1,S,'b')
title('Warto�� wra�liwo�ci transmitancji wzgl�dem zmian rezystancji R1');
legend('wra�liwo�� bezwzgl�dna','wra�liwo�� wzgl�dna');
xlabel('dR1');
ylabel('B, S');

 % Wyznaczanie wra�liwo�ci napi�cia wyj�ciowego U2 na zmian� rezystancji
 % R1 - rezystancja zmienia si� od 1% do 10%
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

% Wykres warto�ci napi�cia wyj�ciowego w zale�no�ci od zmiany rezystancji R1 
figure(2);
plot(R1t,Uwyj);
title('Warto�� napi�cia wyj�ciowego w zale�no�ci od zmiany R1');
xlabel('R1');
ylabel('Uwyj'); hold on


