clc;
clear all;
S=[];
X=dlmread('G:\DSP project\documents-export-2016-07-15\Rajat_ssvep\r7.txt');
x=X(50:560,18);
%for i=50:5120:15412
x=x';
y=refer(13);
S(1)=(ind(x,y));

y=refer(7.5);
S(2)=(ind(x,y));

y=refer(14);
S(3)=(ind(x,y));

y=refer(8.57);
S(4)=(ind(x,y));

y=refer(10);
S(5)=(ind(x,y));

y=refer(12);
S(6)=(ind(x,y));

y=refer(11);
S(7)=(ind(x,y));

i=max(S);

for j=1:7;%loop to find the index number
    if S(j)==max(S)
        display(j);
    end
end
      
%     
%end