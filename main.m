clc
clear all
close all

for i=1:10000
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
%FigHandle = figure('Position', [100, 100, 1049, 895]);
plot(x1,x2,'.b');
hold on;
plot(w1,w2,'or');
plot(w1,w2,'k','linewidth',2);
plot(w1',w2','k','linewidth',2);
hold off;
%=======Initialize parameters=======
T=10000;
MapRadius=5;

for i=1:10000
    
    eta=(1-i/T);
    radius=round(MapRadius*(1-i/T));
    
    distance=(x1(i)-w1).^2+(x2(i)-w2).^2;
    min_d=min(min(distance));
    [winner_row,winner_col] = find(distance==min_d);
    %winner
    winner_row=winner_row(1,1);
    winner_col=winner_col(1,1);

    w1(winner_row,winner_col)=w1(winner_row,winner_col)+eta*(x1(i)-w1(winner_row,winner_col));
    w2(winner_row,winner_col)=w2(winner_row,winner_col)+eta*(x2(i)-w2(winner_row,winner_col));
    %neighbor
    for neighbor_distance=1:1:radius
        %row+ column!
        neighbor_row = winner_row + neighbor_distance;
        neighbor_col = winner_col;
        if (neighbor_row<=10)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row- column!
        neighbor_row = winner_row - neighbor_distance;
        neighbor_col = winner_col;
        if (neighbor_row>=1)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row! column+
        neighbor_row = winner_row;
        neighbor_col = winner_col + neighbor_distance;
        if (neighbor_col<=10)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row! column-
        neighbor_row = winner_row;
        neighbor_col = winner_col - neighbor_distance;
        if (neighbor_col>=1)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row+ column+
        neighbor_row = winner_row + neighbor_distance;
        neighbor_col = winner_col + neighbor_distance;
        if (neighbor_row<=10 && neighbor_col<=10)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row+ column-
        neighbor_row = winner_row + neighbor_distance;
        neighbor_col = winner_col - neighbor_distance;
        if (neighbor_row<=10 && neighbor_col>=1)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row- column+
        neighbor_row = winner_row - neighbor_distance;
        neighbor_col = winner_col + neighbor_distance;
        if (neighbor_row>=1 && neighbor_col<=10)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
        %row- column-
        neighbor_row = winner_row - neighbor_distance;
        neighbor_col = winner_col - neighbor_distance;
        if (neighbor_row>=1 && neighbor_col>=1)
            w1(neighbor_row,neighbor_col)=w1(neighbor_row,neighbor_col)+eta*(x1(i)-w1(neighbor_row,neighbor_col));
            w2(neighbor_row,neighbor_col)=w2(neighbor_row,neighbor_col)+eta*(x2(i)-w2(neighbor_row,neighbor_col));
        end
    end
    if (i==0)
        wx_0=w1;
        wy_0=w2;
    end
    if (i==25)
        wx_25=w1;
        wy_25=w2;
    end
    if (i==100)
        wx_100=w1;
        wy_100=w2;
    end
    if (i==500)
        wx_500=w1;
        wy_500=w2;
    end
    if (i==1000)
        wx_1000=w1;
        wy_1000=w2;
    end
    if (i==5000)
        wx_5000=w1;
        wy_5000=w2;
    end 
    if (i==7500)
        wx_7500=w1;
        wy_7500=w2;
    end  
    if (i==9000)
        wx_9000=w1;
        wy_9000=w2;
    end 
    if (i==10000)
        wx_10000=w1;
        wy_10000=w2;
    end 
end

figure(2);
plot(x1,x2,'.b');
hold on;
plot(w1,w2,'or');
plot(w1,w2,'k','linewidth',2);
plot(w1',w2','k','linewidth',2);
title('result');
    
figure(3);
plot(x1,x2,'.b');
hold on;
plot(wx_25,wy_25,'or');
plot(wx_25,wy_25,'k','linewidth',2);
plot(wx_25',wy_25','k','linewidth',2);
title('25');

figure(4);
plot(x1,x2,'.b');
hold on;
plot(wx_100,wy_100,'or');
plot(wx_100,wy_100,'k','linewidth',2);
plot(wx_100',wy_100','k','linewidth',2);
title('100');

figure(5);
plot(x1,x2,'.b');
hold on;
plot(wx_500,wy_500,'or');
plot(wx_500,wy_500,'k','linewidth',2);
plot(wx_500',wy_500','k','linewidth',2);
title('500')

figure(6);
plot(x1,x2,'.b');
hold on;
plot(wx_1000,wy_1000,'or');
plot(wx_1000,wy_1000,'k','linewidth',2);
plot(wx_1000',wy_1000','k','linewidth',2);
title('1000')

figure(7);
plot(x1,x2,'.b');
hold on;
plot(wx_5000,wy_5000,'or');
plot(wx_5000,wy_5000,'k','linewidth',2);
plot(wx_5000',wy_5000','k','linewidth',2);
title('5000');

figure(8);
plot(x1,x2,'.b');
hold on;
plot(wx_7500,wy_7500,'or');
plot(wx_7500,wy_7500,'k','linewidth',2);
plot(wx_7500',wy_7500','k','linewidth',2);
title('7500');

figure(9);
plot(x1,x2,'.b');
hold on;
plot(wx_9000,wy_9000,'or');
plot(wx_9000,wy_9000,'k','linewidth',2);
plot(wx_9000',wy_9000','k','linewidth',2);
title('9000');

figure(10);
plot(x1,x2,'.b');
hold on;
plot(wx_10000,wy_10000,'or');
plot(wx_10000,wy_10000,'k','linewidth',2);
plot(wx_10000',wy_10000','k','linewidth',2);
title('10000');