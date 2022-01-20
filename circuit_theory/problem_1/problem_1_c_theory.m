clc
close all
clear all

%  Wiœniewski Olgierd

disp('Autor:'); 
disp('Olgierd Wiœniewski');

% Dane odbiorników

RA=10;
RB=11;
RC=12;
CA=0.1e-3;
CB=0.22e-3;
CC=0.33e-3;
M=2.0e-6; 
LA=12.3e-6;
LB=12.5e-6;
LC=13.0e-6;
ZN=0.01; % Zak³adam, ¿e impedancja ZN jest rezystancj¹
w=314;


% --------------Obliczenia dla 1 harmonicznej--------------%

% Metoda pr¹dów oczkowych

% Impedancje (reaktancje) elementów zale¿ne od harmonicznej
ZLAM1=1i*w*(LA+M);
ZLBM1=1i*w*(LB+M);
ZLC1=1i*w*LC;
ZM1=-1i*w*M;
ZCA1=-1i/w*CA;
ZCB1=-1i/w*CB;
ZCC1=-1i/w*CC;
% Obliczenie sk³adowych impedancji macierzy Z
Z111=RA+ZCA1+ZLAM1+ZLBM1+ZCB1+RB;
Z121=-ZLBM1-ZCB1-RB;
Z131=0;
Z211=-ZLBM1-ZCB1-RB;
Z221=RB+ZCB1+ZLBM1+ZM1+ZCC1+ZLC1+RC;
Z231=-RC-ZLC1-ZCC1;
Z311=0;
Z321=-RC-ZLC1-ZCC1;
Z331=RC+ZLC1+ZCC1+ZN;
% Obliczenie wartoœci skutecznej zespolonej napiêcia zasilania
EA1=(230/sqrt(2));
EB1=(230/sqrt(2))*exp(-1i*2*pi/3);
EC1=(230/sqrt(2))*exp(1i*2*pi/3);
% Obliczenie sk³adowych napiêæ macierzy E
E11=EA1-EB1;
E21=EB1-EC1;
E31=EC1;
% Macierz Z
Z1=[Z111 Z121 Z131
    Z211 Z221 Z231
    Z311 Z321 Z331];
% Macierz E
E1=[E11
    E21
    E31];
% Wyliczenia pr¹dów oczkowych - macierz Io
Io1=Z1\E1;
% Wyliczenia pr¹dów w ga³êziach
I11=Io1(1);
I21=Io1(2)-Io1(1);
I31=Io1(3)-Io1(2);
I41=Io1(3);
I51=Io1(2);
% Wyliczenia napiêæ na elementach
URA1=I11*RA;
UCA1=I11*ZCA1;
ULAM1=I11*ZLAM1;
URB1=I21*RB;
UCB1=I21*ZCB1;
ULBM1=I21*ZLBM1;
UM1=I51*ZM1;
URC1=I31*RC;
ULC1=I31*ZLC1;
UCC1=I31*ZCC1;
UZN1=I41*ZN;
% Moce Ÿróde³
SEA1=EA1*conj(I11);
SEB1=EB1*conj(I21);
SEC1=EC1*conj(I31);
% Moce odbiorników
SRA1=URA1*conj(I11);
SCA1=UCA1*conj(I11);
SLAM1=ULAM1*conj(I11);
SM1=UM1*conj(I51);
SRB1=URB1*conj(I21);
SCB1=UCB1*conj(I21);
SLBM1=ULBM1*conj(I21);
SRC1=URC1*conj(I31);
SLC1=ULC1*conj(I31);
SCC1=UCC1*conj(I31);
SZN1=UZN1*conj(I41);
% Bilans pr¹dów w wêz³ach
bilw11=I11+I21+I31-I41;
bilw21=I51-I11-I21;
bilw31=I41-I31-I51;
% % Bilans napiêæ w oczkach
bilo11=EA1-EB1-URA1-UCA1-ULAM1+ULBM1+UCB1+URB1;
bilo21=-URB1-UCB1-ULBM1-UM1+UCC1+ULC1+URC1-EC1+EB1;
bilo31=-URC1-ULC1-UCC1-UZN1+EC1;
bilwso1=bilo11+bilo21+bilo31;
% Bilans mocy
bilmocy1=SRA1+SCA1+SLAM1+SM1+SRB1+SCB1+SLBM1+SRC1+SLC1+SCC1+SZN1-SEA1-SEB1-SEC1;
% Wyprowadzenia na obszar roboczy wyników
disp(['Pr¹d I1 dla pierwszej harmonicznej=',num2str(I11)]);
disp(['Pr¹d I2 dla pierwszej harmonicznej=',num2str(I21)]);
disp(['Pr¹d I3 dla pierwszej harmonicznej=',num2str(I31)]);
disp(['Pr¹d I4 dla pierwszej harmonicznej=',num2str(I41)]);
disp(['Pr¹d I5 dla pierwszej harmonicznej=',num2str(I51)]);
disp(['Bilans pr¹du w wêŸle nr 1 dla pierwszej harmonicznej=',num2str(bilw11)]);
disp(['Bilans pr¹du w wêŸle nr 2 dla pierwszej harmonicznej=',num2str(bilw21)]);
disp(['Bilans pr¹du w wêŸle nr 3 dla pierwszej harmonicznej=',num2str(bilw31)]);
disp(['Bilans napiêæ w oczku nr 1 dla pierwszej harmonicznej=',num2str(bilo11)]);
disp(['Bilans napiêæ w oczku nr 2 dla pierwszej harmonicznej=',num2str(bilo21)]);
disp(['Bilans napiêæ w oczku nr 3 dla pierwszej harmonicznej=',num2str(bilo31)]);
disp(['Bilans napiêæ dla wszystkich oczek dla pierwszej harmonicznej=',num2str(bilwso1)]);
disp(['Bilans mocy dla pierwszej harmonicznej=',num2str(bilmocy1)]);


% --------------Obliczenia dla 3 harmonicznej--------------%

% Metoda pr¹dów oczkowych

% Impedancje (reaktancje) elementów zale¿ne od harmonicznej
ZLAM3=1i*(3*w)*(LA+M);
ZLBM3=1i*(3*w)*(LB+M);
ZLC3=1i*(3*w)*LC;
ZM3=-1i*(3*w)*M;
ZCA3=-1i/(3*w)*CA;
ZCB3=-1i/(3*w)*CB;
ZCC3=-1i/(3*w)*CC;
% Obliczenie sk³adowych impedancji macierzy Z
Z113=RA+ZCA3+ZLAM3+ZLBM3+ZCB3+RB;
Z123=-ZLBM3-ZCB3-RB;
Z133=0;
Z213=-ZLBM3-ZCB3-RB;
Z223=RB+ZCB3+ZLBM3+ZM3+ZCC3+ZLC3+RC;
Z233=-RC-ZLC3-ZCC3;
Z313=0;
Z323=-RC-ZLC3-ZCC3;
Z333=RC+ZLC3+ZCC3+ZN;
% Obliczenie wartoœci skutecznej zespolonej napiêcia zasilania
EA3=(73/sqrt(2));
EB3=(73/sqrt(2))*exp(-1i*2*pi/3);
EC3=(73/sqrt(2))*exp(1i*2*pi/3);
% Obliczenie sk³adowych napiêæ macierzy E
E13=EA3-EB3;
E23=EB3-EC3;
E33=EC3;
% Macierz Z
Z3=[Z113 Z123 Z133
    Z213 Z223 Z233
    Z313 Z323 Z333];
% Macierz E
E3=[E13
    E23
    E33];
% Wyliczenia pr¹dów oczkowych - macierz Io
Io3=Z3\E3;
% Wyliczenia pr¹dów w ga³êziach
I13=Io3(1);
I23=Io3(2)-Io3(1);
I33=Io3(3)-Io3(2);
I43=Io3(3);
I53=Io3(2);
% Wyliczenia napiêæ na elementach
URA3=I13*RA;
UCA3=I13*ZCA3;
ULAM3=I13*ZLAM3;
URB3=I23*RB;
UCB3=I23*ZCB3;
ULBM3=I23*ZLBM3;
UM3=I53*ZM3;
URC3=I33*RC;
ULC3=I33*ZLC3;
UCC3=I33*ZCC3;
UZN3=I43*ZN;
% Moce Ÿróde³
SEA3=EA3*conj(I13);
SEB3=EB3*conj(I23);
SEC3=EC3*conj(I33);
% Moce odbiorników
SRA3=URA3*conj(I13);
SCA3=UCA3*conj(I13);
SLAM3=ULAM3*conj(I13);
SM3=UM3*conj(I53);
SRB3=URB3*conj(I23);
SCB3=UCB3*conj(I23);
SLBM3=ULBM3*conj(I23);
SRC3=URC3*conj(I33);
SLC3=ULC3*conj(I33);
SCC3=UCC3*conj(I33);
SZN3=UZN3*conj(I43);
% Bilans pr¹dów w wêz³ach
bilw13=I13+I23+I33-I43;
bilw23=I53-I13-I23;
bilw33=I43-I33-I53;
% Bilans napiêæ w oczkach
bilo13=-EA3-EB3-URA3-UCA3-ULAM3+ULBM3+UCB3+URB3;
bilo23=-URB3-UCB3-ULBM3-UM3+UCC3+ULC3+URC3-EC3+EB3;
bilo33=-URC3-ULC3-UCC3-UZN3+EC3;
bilwso3=bilo13+bilo23+bilo33;
% Bilans mocy
bilmocy3=SRA3+SCA3+SLAM3+SM3+SRB3+SCB3+SLBM3+SRC3+SLC3+SCC3+SZN3-SEA3-SEB3-SEC3;
% Wyprowadzenia na obszar roboczy wyników
disp(['Pr¹d I1 dla trzeciej harmonicznej=',num2str(I13)]);
disp(['Pr¹d I2 dla trzeciej harmonicznej=',num2str(I23)]);
disp(['Pr¹d I3 dla trzeciej harmonicznej=',num2str(I33)]);
disp(['Pr¹d I4 dla trzeciej harmonicznej=',num2str(I43)]);
disp(['Pr¹d I5 dla trzeciej harmonicznej=',num2str(I53)]);
disp(['Bilans pr¹du w wêŸle nr 1 dla trzeciej harmonicznej=',num2str(bilw13)]);
disp(['Bilans pr¹du w wêŸle nr 2 dla trzeciej harmonicznej=',num2str(bilw23)]);
disp(['Bilans pr¹du w wêŸle nr 3 dla trzeciej harmonicznej=',num2str(bilw33)]);
disp(['Bilans napiêæ w oczku nr 1 dla trzeciej harmonicznej=',num2str(bilo13)]);
disp(['Bilans napiêæ w oczku nr 2 dla trzeciej harmonicznej=',num2str(bilo23)]);
disp(['Bilans napiêæ w oczku nr 3 dla trzeciej harmonicznej=',num2str(bilo33)]);
disp(['Bilans napiêæ dla wszystkich oczek dla trzeciej harmonicznej=',num2str(bilwso3)]);
disp(['Bilans mocy dla trzeciej harmonicznej=',num2str(bilmocy3)]);


% --------------Obliczenia dla 7 harmonicznej--------------%

% Metoda pr¹dów oczkowych

% Impedancje (reaktancje) elementów zale¿ne od harmonicznej
ZLAM7=1i*(7*w)*(LA+M);
ZLBM7=1i*(7*w)*(LB+M);
ZLC7=1i*(7*w)*LC;
ZM7=-1i*(7*w)*M;
ZCA7=-1i/(7*w)*CA;
ZCB7=-1i/(7*w)*CB;
ZCC7=-1i/(7*w)*CC;
% Obliczenie sk³adowych impedancji macierzy Z
Z117=RA+ZCA7+ZLAM7+ZLBM7+ZCB7+RB;
Z127=-ZLBM7-ZCB7-RB;
Z137=0;
Z217=-ZLBM7-ZCB7-RB;
Z227=RB+ZCB7+ZLBM7+ZM7+ZCC7+ZLC7+RC;
Z237=-RC-ZLC7-ZCC7;
Z317=0;
Z327=-RC-ZLC7-ZCC7;
Z337=RC+ZLC7+ZCC7+ZN;
% Obliczenie wartoœci skutecznej zespolonej napiêcia zasilania
EA7=(46/sqrt(2));
EB7=(46/sqrt(2))*exp(-1i*2*pi/3);
EC7=(46/sqrt(2))*exp(1i*2*pi/3);
% Obliczenie sk³adowych napiêæ macierzy E
E17=EA7-EB7;
E27=EB7-EC7;
E37=EC7;
% Macierz Z
Z7=[Z117 Z127 Z137
    Z217 Z227 Z237
    Z317 Z327 Z337];
% Macierz E
E7=[E17
    E27
    E37];
% Wyliczenia pr¹dów oczkowych - macierz Io
Io7=Z7\E7;
% Wyliczenia pr¹dów w ga³êziach
I17=Io7(1);
I27=Io7(2)-Io7(1);
I37=Io7(3)-Io7(2);
I47=Io7(3);
I57=Io7(2);
% Wyliczenia napiêæ na elementach
URA7=I17*RA;
UCA7=I17*ZCA7;
ULAM7=I17*ZLAM7;
URB7=I27*RB;
UCB7=I27*ZCB7;
ULBM7=I27*ZLBM7;
UM7=I57*ZM7;
URC7=I37*RC;
ULC7=I37*ZLC7;
UCC7=I37*ZCC7;
UZN7=I47*ZN;
% Moce Ÿróde³
SEA7=EA7*conj(I17);
SEB7=EB7*conj(I27);
SEC7=EC7*conj(I37);
% Moce odbiorników
SRA7=URA7*conj(I17);
SCA7=UCA7*conj(I17);
SLAM7=ULAM7*conj(I17);
SM7=UM7*conj(I57);
SRB7=URB7*conj(I27);
SCB7=UCB7*conj(I27);
SLBM7=ULBM7*conj(I27);
SRC7=URC7*conj(I37);
SLC7=ULC7*conj(I37);
SCC7=UCC7*conj(I37);
SZN7=UZN7*conj(I47);
% Bilans pr¹dów w wêz³ach
bilw17=I17+I27+I37-I47;
bilw27=I57-I17-I27;
bilw37=I47-I37-I57;
% Bilans napiêæ w oczkach
bilo17=-EA7-EB7-URA7-UCA7-ULAM7+ULBM7+UCB7+URB7;
bilo27=-URB7-UCB7-ULBM7-UM7+UCC7+ULC7+URC7-EC7+EB7;
bilo37=-URC7-ULC7-UCC7-UZN7+EC7;
bilwso7=bilo17+bilo27+bilo37;
% Bilans mocy
bilmocy7=SRA7+SCA7+SLAM7+SM7+SRB7+SCB7+SLBM7+SRC7+SLC7+SCC7+SZN7-SEA7-SEB7-SEC7;
% Wyprowadzenia na obszar roboczy wyników
disp(['Pr¹d I1 dla siódmej harmonicznej=',num2str(I17)]);
disp(['Pr¹d I2 dla siódmej harmonicznej=',num2str(I27)]);
disp(['Pr¹d I3 dla siódmej harmonicznej=',num2str(I37)]);
disp(['Pr¹d I4 dla siódmej harmonicznej=',num2str(I47)]);
disp(['Pr¹d I5 dla siódmej harmonicznej=',num2str(I57)]);
disp(['Bilans pr¹du w wêŸle nr 1 dla siódmej harmonicznej=',num2str(bilw17)]);
disp(['Bilans pr¹du w wêŸle nr 2 dla siódmej harmonicznej=',num2str(bilw27)]);
disp(['Bilans pr¹du w wêŸle nr 3 dla siódmej harmonicznej=',num2str(bilw37)]);
disp(['Bilans napiêæ w oczku nr 1 dla siódmej harmonicznej=',num2str(bilo17)]);
disp(['Bilans napiêæ w oczku nr 2 dla siódmej harmonicznej=',num2str(bilo27)]);
disp(['Bilans napiêæ w oczku nr 3 dla siódmej harmonicznej=',num2str(bilo37)]);
disp(['Bilans napiêæ dla wszystkich oczek dla siódmej harmonicznej=',num2str(bilwso7)]);
disp(['Bilans mocy dla siódmej harmonicznej=',num2str(bilmocy7)]);

% Wartoœæ skuteczna zespolona pr¹dów w ga³êziach z wszystkich harmonicznych
I1h=I11+I13+I17;
I2h=I21+I23+I27;
I3h=I31+I33+I37;
I4h=I41+I43+I47;
I5h=I51+I53+I57;
% Wartoœæ skuteczna pr¹dów w ga³êziach z wszystkich harmonicznych w A
I1hs=abs(I1h);
I2hs=abs(I2h);
I3hs=abs(I3h);
I4hs=abs(I4h);
I5hs=abs(I5h);
% Wyprowadzenia na obszar roboczy wyników
disp(['Pr¹d I1 dla wszystkich harmonicznych=',num2str(I1h)]);
disp(['Pr¹d I2 dla wszystkich harmonicznych=',num2str(I2h)]);
disp(['Pr¹d I3 dla wszystkich harmonicznych=',num2str(I3h)]);
disp(['Pr¹d I4 dla wszystkich harmonicznych=',num2str(I4h)]);
disp(['Pr¹d I5 dla wszystkich harmonicznych=',num2str(I5h)]);
disp(['Pr¹d I1 skuteczny dla wszystkich harmonicznych w A =',num2str(I1hs)]);
disp(['Pr¹d I2 skuteczny dla wszystkich harmonicznych w A =',num2str(I2hs)]);
disp(['Pr¹d I3 skuteczny dla wszystkich harmonicznych w A =',num2str(I3hs)]);
disp(['Pr¹d I4 skuteczny dla wszystkich harmonicznych w A =',num2str(I4hs)]);
disp(['Pr¹d I5 skuteczny dla wszystkich harmonicznych w A =',num2str(I5hs)]);


% Wykresy

% Wykres wektorowe wartoœci skutecznych pr¹dów z harmonicznymi
% Wykres wektorowy pr¹dów w ga³êziach A, B i C
figure (1)
subplot(1,2,1); compass([I1h,I2h,I3h]); title('Pr¹dy ga³êziowe I1, I2 i I3');
subplot(1,2,2);compass([I4h,I5h]); title('Pr¹dy ga³êziowe I4 i I5');

% Wykresy wartoœci chwilowych pr¹dów I1, I2 i I3
t=0:0.0001:0.05;
figure(2)
I1ch=sqrt(2)*abs(I11)*sin(w*t+angle(I11))+sqrt(2)*abs(I13)*sin(3*w*t+angle(I13))+sqrt(2)*abs(I17)*sin(7*w*t+angle(I17));
I2ch=sqrt(2)*abs(I21)*sin(w*t+angle(I21))+sqrt(2)*abs(I23)*sin(3*w*t+angle(I23))+sqrt(2)*abs(I27)*sin(7*w*t+angle(I27));
I3ch=sqrt(2)*abs(I31)*sin(w*t+angle(I31))+sqrt(2)*abs(I33)*sin(3*w*t+angle(I33))+sqrt(2)*abs(I37)*sin(7*w*t+angle(I37));
subplot(1,1,1); plot(t,I1ch,'-r', t,I2ch,'-b', t,I3ch,'-k'); grid
xlabel('t'), ylabel('Pr¹dy I1,I2 i I3')
legend('Pr¹d I1-czerwony','Pr¹d I2-niebieski','Pr¹d I3-czarny')









