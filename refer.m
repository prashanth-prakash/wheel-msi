
function tr = refer(x)
% x=10;
ref=[];
fr = [];
y=[0.5 1 2 3 4];
Y=y*x;
for value = Y
    if(value>4) 
        if(value<31)
            fr = [fr value];
        end
    end
end
n=length(fr);
tr=zeros(2*n,511);
i=1;
while i<=n
    for t=1:511;
     ref(1,t)=sin(2*pi*fr(i)*t/256);
     ref(2,t)=cos(2*pi*fr(i)*t/256);
    end
    %disp(ref(1));
    %tr(i)=ref(1);
    %tr(i+1)=ref(2);
    for t=1:511;
        tr((2*i)-1,t)=ref(1,t);
        tr(2*i,t)=ref(2,t);
    end
    
    i=i+1;
    end    
       



