A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration4.csv');
B=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Measured.csv');
C=readtable('C:\Users\GUNA\Downloads\saikumaranna\S11_DataG_Tissue_Loaded.csv');
x1=A{:,1};
x2=B{:,1};
y1=A{:,2};
y2=B{:,2};
y3=C{:,2};
plot(x1,y1,'-','Color',[0 0 0],'LineWidth',2);
hold on
plot(x2,y2,'-.','Color',[0.4940 0.1840 0.5560],'LineWidth',2);
plot(x1,y3,':','Color',[1 0 0],'LineWidth',2);
grid on;
yline(-10,'-','Color',[0 0 0],'LineWidth',1);
legend({'iteration_4','Measured','S11 with tissue'},...
    'Location','southeast','NumColumns',1,'fontweight','bold')
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
xlabel('Frequency / GHz','fontsize',16,'fontweight','bold');
ylabel('S11 (dB)','fontsize',16,'fontweight','bold');
hold off