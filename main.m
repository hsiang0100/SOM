clc
clear all
close all

for i=1:1000
    x1(i)=rand*10;
    x2(i)=rand*10;
end
for j1=1:10
    for j2=1:10
        w1(j1,j2)=rand*(5.2-4.8)+4.8;
        w2(j1,j2)=rand*(5.2-4.8)+4.8;
    end
end
figure(1);
plot(x1,x2,'.b');
hold on;
plot(w1,w2,'or');
plot(w1,w2,'k','linewidth',2);
plot(w1',w2','k','linewidth',2);
hold off;
%=======Initialize parameters=======
T=300;
MapRadius=5;

for t=0:300
    eta=(1-t/T);

    for i=1:1000
        d=(x1(i)-w1).^2+(x2(i)-w2).^2;
        min_d=min(min(d));
        [row,col] = find(d==min_d);
        %winner
        w1(row,col)=w1(row,col)+eta*(x1(i)-w1(row,col));
        w2(row,col)=w2(row,col)+eta*(x2(i)-w2(row,col));
        %neighbor
        TimeConstant = T/log(MapRadius);
        NeighbourhRadius = m_dMapRadius * exp(-(double)m_iIterationCount/m_dTimeConstant);
    end
    
end

