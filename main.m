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

for i=1:1000
    d=(x1(i)-w1).^2+(x2(i)-w2).^2;
    min=min(min(d));
    [row,col] = find(d==min);
end

