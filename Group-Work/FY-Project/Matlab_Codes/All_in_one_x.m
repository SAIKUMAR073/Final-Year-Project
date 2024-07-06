A=readtable('C:\Users\GUNA\Downloads\saikumaranna\S11_Rx20.csv');
B=readtable('C:\Users\GUNA\Downloads\saikumaranna\S11_Rx40.csv');
C=readtable('C:\Users\GUNA\Downloads\saikumaranna\S11_Rx80.csv');
x=A{:,1};
y1=A{:,4};
y2=A{:,5};
y3=B{:,4};
y4=B{:,6};
y5=C{:,4};
y6=C{:,6};
plot(x,y1,':','Color',[1 0 0],'LineWidth',2);
hold on
plot(x,y2,'-.','Color',[0 1 0],'LineWidth',2);
plot(x,y3,'-.','Color',[0 0 1],'LineWidth',2);
plot(x,y4,'-.','Color',[1 0 1],'LineWidth',2);
plot(x,y5,'-.','Color',[0 0 0],'LineWidth',2);
plot(x,y6,'-.','Color',[0 1 1],'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',1);

grid on;

legend({'Rx=20(S)','Rx=20(M)','Rx=40(S)','Rx=40(M)','Rx=80(S)','Rx=80(M)'},...
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


