A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration0.csv');
B=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration1.csv');
C=readtable('C:\Users\GUNA\Downloads\saikumaranna\Data_G_Iteration2.csv');
D=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration3.csv');
E=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration4.csv');
x=A{:,1};
y1=A{:,2};
y2=B{:,2};
y3=C{:,2};
y4=D{:,2};
y5=E{:,2};
plot(x,y1,':','Color',[1 0 0],'LineWidth',2);
hold on
plot(x,y2,':','Color',[0 1 0],'LineWidth',2);
plot(x,y3,':','Color',[0 0 1],'LineWidth',2);
plot(x,y4,':','Color',[1 0 1],'LineWidth',2);
plot(x,y5,':','Color',[0 0 0],'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',1);

grid on;

legend({'iteration_0','iteration_1','iteration_2','iteration_3','iteration_4'},...
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


