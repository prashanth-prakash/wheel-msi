clc;
clear all;
S=[];
k=0;
X=dlmread('G:\DSP project\documents-export-2016-07-15\Rajat_ssvep\r1.txt');
z_act=zeros(61,1);
i=1;
z_act=[];
z_req=ones(1,61)*1
out = buffer(X(:,18)',511,255);
q = size(out);
while(i<=q(2))
%     z=z+1;
    x=out(:,i);
    
    x=x';
    y=refer(13);
    S(i,1)=(ind(x,y));
    
    y=refer(7.5);
    S(i,2)=(ind(x,y));
    
    y=refer(14);
    S(i,3)=(ind(x,y));
    
    y=refer(8.57);
    S(i,4)=(ind(x,y));
    
    y=refer(10);
    S(i,5)=(ind(x,y));
    
    y=refer(12);
    S(i,6)=(ind(x,y));
    
    y=refer(11);
    S(i,7)=(ind(x,y));
    k=k+256;
%     j(z)=max(S(i,:));
    i=i+1;
end
i=1;
while(i<62)
    for j=1:7;%loop to find the index number
        if S(i,j)==max(S(i,:))
            display(j);
            z_act(i)=j;
           
        end
    end
    i=i+1;
end
[C,order]=confusionmat(z_act,z_req);
