clc;
clear all;
X=dlmread('G:\DSP project\documents-export-2016-07-19\Anish_ssvep\r1.txt');
x=X(50:5170,18);
x=x';

t=0:5120;
Y=[sin(2*pi*13*t/256);cos(2*pi*13*t/256) ; sin(2*pi*6.5*t/256);cos(2*pi*6.5*t/256) ;sin(2*pi*26*t/256);cos(2*pi*26*t/256)];
[b,a] = butter(4,[5/256 30/256],'bandpass');
x = filter(b,a,x);
x=x-mean(x(:));
x=x/std(x(:));
y=Y-mean(Y(:));
y=y/std(y(:));
[n,m]=size(x);
k=(1/m);
c12=k*x*y';
c21=c12';
c11=k*x*x';
c22=k*y*y';
C=[c11 c12;c21 c22];
C11=c11^-0.5;
C22=c22^-0.5;
U=zeros(7,7);
U(1,1)=C11;
U(2:7,2:7)=C22;
R=U*C*U';
% R12=C11*c12*C22;
% R21=C22*c21*C11;
e=eig(R);
E=e/sum(e);%normalised eigen value
S=1+(sum(E.*log(E)))/log(7);



