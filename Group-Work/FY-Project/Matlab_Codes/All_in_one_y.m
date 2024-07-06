A=readtable('C:\Users\GUNA\Downloads\saikumaranna\S11_RY204080.csv');
x=A{:,1};
y1=A{:,2};
y2=A{:,3};
y3=A{:,4};
y4=A{:,5};
y5=A{:,6};
y6=A{:,7};
plot(x,y1,'-.','Color',[1 0 0],'LineWidth',2);
hold on
plot(x,y2,'-.','Color',[0 1 0],'LineWidth',2);
plot(x,y3,'-.','Color',[0 0 1],'LineWidth',2);
plot(x,y4,'-.','Color',[1 0 1],'LineWidth',2);
plot(x,y5,'-.','Color',[0 0 0],'LineWidth',2);
plot(x,y6,'-.','Color',[0 1 1],'LineWidth',2);

yline(-10,'-','Color',[0 0 0],'LineWidth',1);

grid on;

legend({'Ry=20(S)','Ry=20(M)','Ry=40(S)','Ry=40(M)','Ry=80(S)','Ry=80(M)'},...
    'Location','southeast','NumColumns',1,'fontname','Times New Roman','fontweight','bold')
ax = gca;
ax.LineWidth=1.5;
ax.XAxis.FontSize=12;
ax.XAxis.LineWidth=2;
ax.XAxis.FontWeight='bold';
ax.YAxis.FontSize=12;
ax.YAxis.LineWidth=2;
ax.YAxis.FontWeight='bold';
ax.GridColor = "black";
ax.GridLineStyle = ':';
ax.GridAlpha = 0.25;
xlabel('Frequency / GHz','fontsize',16,'fontname','Times New Roman','fontweight','bold');
ylabel('S11 (dB)','fontsize',16,'fontname','Times New Roman','fontweight','bold');
hold off


