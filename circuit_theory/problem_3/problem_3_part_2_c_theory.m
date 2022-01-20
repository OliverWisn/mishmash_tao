clc
close all
clear all

%  Wi�niewski Olgierd

f=12000;
C1=0.000001;
L1=1;
X=L1+C1;
B=-1/X;
R1=1000;
G=1/R1;
k=0.5;
 
%obliczanie element�w na 2 uk�adzie
L2=1/(C1*(2*pi*f)^2);
C2=k*C1/2;
 
 
N=1000;
w=1i*pi*2;
J=zeros(1,N);
for n=1:N
    p=w*(n-1)*2*f/N+eps;
    Y11=((C1+C2)*p)+G+(1/(p*L2));
    Y12=-p*C2;
    Y=[Y11 Y12;Y12 Y11];        
 
    U=inv(Y)*[1 0]';            %Rozwi�zanie r�wnania macierzowego
    J(n)=U(2,1);                % Funkcja przenoszenia
end
%WYZNACZANIE PARAMETR�W FUNKCJI PRZENOSZENIA
 
K=abs(J)>0.707*max(abs(J));
deltaK=diff(K);                      %r�nica mi�dzy s�siednimi parametrami wektora
p=2*f*deltaK/N;
Bo=p(2)-p(1);                          %szeroko�� funkcji przenoszenia    
fs=(p(1,1)+p(1,2))/2;                   %cz�stotliwo�� �rodkowa
 
%Wykresy
 
%wykres f. prznoszenia
f=2*f*(1:N)/N;
plot(f,abs(J),'k')




