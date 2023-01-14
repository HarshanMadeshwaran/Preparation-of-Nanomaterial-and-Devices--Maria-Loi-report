clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%% READING FILE VARIABLES T-Temperature

result1 = readtable('device4_20width_area4_onelayer_extended_01_Copy.txt');

X1 = result1(:,1); % Wavenumber
Y1 = result1(:,2); % Intensity

X1 = table2array(X1);
Y1 = table2array(Y1);

result2 = readtable('device2_20width_area2_twolayer_extended_01_Copy.txt');

X2 = result2(:,1); % Wavenumber
Y2 = result2(:,2); % Intensity

X2 = table2array(X2);
Y2 = table2array(Y2);

result3 = readtable('device8_20width_area2_tenlayer_extended_01_Copy.txt');

X3 = result3(:,1); % Wavenumber
Y3 = result3(:,2); % Intensity

X3 = table2array(X3);
Y3 = table2array(Y3);

result4 = readtable('device8_20width_area2_tenlayer_extended_02_black_spots_Copy.txt');

X4 = result4(:,1); % Wavenumber
Y4 = result4(:,2); % Intensity

X4 = table2array(X4);
Y4 = table2array(Y4);

%% Baseline correction
% detrend(y,n), n is nth order polynomial

Y1 = detrend(Y1,2);
Y2 = detrend(Y2,2);
Y3 = detrend(Y3,2);
Y4 = detrend(Y4,1);

%% Plotting Raman Spectra

% figure
% plot(X,Y, '-r','LineWidth', 2, 'MarkerSize', 1);
% hold on
% grid on;

% Create plots.

t = tiledlayout(3,1);

ax1 = nexttile;
plot(ax1,X1,Y1,'-b','LineWidth', 2, 'MarkerSize', 1)

ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,max(X1)])
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-4)
legendHandle = legend('1 Printing Pass', 'Location', 'northeast');
legendHandle.FontSize = 15;


ax2 = nexttile;
plot(ax2,X2,Y2,'-r','LineWidth', 2, 'MarkerSize', 1)

ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,max(X1)])

yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-4)
legendHandle = legend('2 Printing Passes', 'Location', 'northeast');
legendHandle.FontSize = 15;


ax3 = nexttile;
plot(ax3,X3,Y3,'-o','LineWidth', 2, 'MarkerSize', 1)

ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,max(X1)])
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-4)
legendHandle = legend('10 Printing Passes', 'Location', 'northeast');
legendHandle.FontSize = 15;


% ax4 = nexttile;
% plot(ax4,X4,Y4,'-b','LineWidth', 2, 'MarkerSize', 1)
% ax = gca;
% ax.FontSize = 20; 
% H=gca;
% H.LineWidth=2;
% hold on 
% xlim([-10,max(X1)])
% ylim([-50000,800000])
% legendHandle = legend('Black-Spot', 'Location', 'northeast');
% legendHandle.FontSize = 20;


% Link the axes
linkaxes([ax1,ax2,ax3],'x');
linkaxes([ax1,ax2,ax3],'y');
xlabel(t,'Wavenumber (cm^-^1)' , 'FontSize', 15);
ylabel(t,'Raman Intensity (a.u.) (x 10^4)' , 'FontSize', 15);

% Move plots closer together

t.Padding = 'compact';
t.TileSpacing = 'compact';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(X4,Y4,'-p','LineWidth', 2, 'MarkerSize', 1)
hold on
xlabel('Wavenumber (cm^-^1)' , 'FontSize', 15);
ylabel('Raman Intensity (a.u.)' , 'FontSize', 15);

ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,max(X1)])
ylim([-50000,800000])
hold on
% yt = get(gca, 'YTick');
% set(gca, 'YTick',yt, 'YTickLabel',yt*1E-4)
legendHandle = legend('Black Spot', 'Location', 'northeast');
legendHandle.FontSize = 15;


%% End of Script 
