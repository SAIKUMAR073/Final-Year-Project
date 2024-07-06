A=readtable('C:\Users\GUNA\Downloads\saikumaranna\Bending_Gain_XY204080_90.csv','ReadVariableNames',false);
x=A{:,16};
y1=A{:,2};
y2=A{:,3};
y3=A{:,4};
y4=A{:,5};
y5=A{:,6};
y6=A{:,7}; 
ax=polaraxes;
polarplot(ax,y1,'-.','LineWidth',2.5);
hold on
polarplot(ax,y2,'-.','LineWidth',2.5);
polarplot(ax,y3,'-.','LineWidth',2.5);
polarplot(ax,y4,'-.','LineWidth',2.5);
polarplot(ax,y5,'-.','LineWidth',2.5);
polarplot(ax,y6,'-.','LineWidth',2.5);
rlim([-27 10]);
ax.LineWidth=1.5;
ax.ThetaDir = 'clockwise';
ax.ThetaZeroLocation = 'top';
ax.ThetaAxis.FontSize=12;
ax.ThetaAxis.FontWeight='bold';
ax.RAxis.FontSize=10;
ax.RAxis.FontWeight='bold';
ax.GridColor = "black";
ax.GridLineStyle = ':';
ax.GridAlpha = 0.25;
title('Φ = 90^{\circ}','fontsize',10,'fontname','Times New Roman','fontweight','normal');
hold off
