A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration0.csv');
figure;
x=A{:,1};
y=A{:,2};
r=plot(x,y,'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',3);
grid on;
ax = gca;
ax.GridColor = "black";
ax.GridLineStyle = '--';
ax.GridAlpha = 0.75;
r.Color = "red";
title('S-parameters[Magnitude in dB]');
xlabel('Frequency / GHz');
ylabel('dB');


A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration1.csv');
figure;
x=A{:,1};
y=A{:,2};
hold on
k=plot(x,y,'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',3);
grid on;
ax = gca;
ax.GridColor = "black";
ax.GridLineStyle = '--';
ax.GridAlpha = 0.75;
k.Color = "red";
title('S-parameters[Magnitude in dB]');
xlabel('Frequency / GHz');
ylabel('dB');
hold off;


A=readtable('C:\Users\GUNA\Downloads\saikumaranna\Data_G_Iteration2.csv');
figure;
x=A{:,1};
y=A{:,2};
hold on
p=plot(x,y,'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',3);
grid on;
ax = gca;
ax.GridColor = "black";
ax.GridLineStyle = '--';
ax.GridAlpha = 0.75;
p.Color = "red";
title('S-parameters[Magnitude in dB]');
xlabel('Frequency / GHz');
ylabel('dB');
hold off;


A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration3.csv');
figure;
x=A{:,1};
y=A{:,2};
hold on
m=plot(x,y,'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',3);
grid on;
ax = gca;
ax.GridColor = "black";
ax.GridLineStyle = '--';
ax.GridAlpha = 0.75;
m.Color = "red";
title('S-parameters[Magnitude in dB]');
xlabel('Frequency / GHz');
ylabel('dB');
hold off;


A=readtable('C:\Users\GUNA\Downloads\saikumaranna\DataG_Iteration4.csv');
figure;
x=A{:,1};
y=A{:,2};
hold on
a=plot(x,y,'LineWidth',2);
yline(-10,'-','Color',[0 0 0],'LineWidth',3);
grid on;
ax = gca;
ax.GridColor = "black";
ax.GridLineStyle = '--';
ax.GridAlpha = 0.75;
a.Color = "red";
title('S-parameters[Magnitude in dB]');
xlabel('Frequency / GHz');
ylabel('dB');
hold off;







