clc
close all
clear all

%  Wi�niewski Olgierd

%WPROWADZANIE DANYCH
fo=input('fo=');
deltaf=input('deltaf=');
G=input('G=');
k=input('k=');
%WYZNACZANIE WARTO�CI ELEMENT�W
C1=G/(pi*deltaf);
L1=1/(C1*(2*pi*fo)^2);
C=k*C1/2;
%WYZNACZANIE ADMITANCJI
a=1i*2*pi;
N=10^3;
K=zeros(1,N);
for n=1:N
    s=a*(n-1)*2*fo/N+eps;
    Y11=s*(C1+C)+G+1/(s*L1);
    Y12=-s*C;
    Y=[Y11 Y12;Y12 Y11];        %Macierz admitancji
%WYZNACZANIE FUNKCJI PRZENOSZENIA
    U=inv(Y)*[1 0]';            %Rozwi�zanie r�wnania macierzowego
    K(n)=U(2,1);                % Funkcja przenoszenia
end
%WYZNACZANIE PARAMETR�W FUNKCJI PRZENOSZENIA
P=abs(K)>0.707*max(abs(K));
PD=diff(P);
p=2*fo*find(PD)/N;
'Szeroko�� pasma przenoszenia [Hz]';
Bo=p(2)-p(1);
'Cz�stotliwo�� �rodkowa [ Hz]';
fc=(p(1,1)+p(1,2))/2;
%WYKRES FUNKCJI PRZENOSZENIA
f=2*fo*(1:N)/N;
plot(f,abs(K),'k')




