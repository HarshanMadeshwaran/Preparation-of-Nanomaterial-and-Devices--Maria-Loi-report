clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%% READING FILE VARIABLES

result1 = readtable('s070_HiPCO-PF12_Mw537000_3615_1st_toluene_30krpm_10mm_cuvette.txt');
result2 = readtable('s070_HiPCO-PF12_Mw537000_3615_2nd_o-xylene_30krpm_1mm_cuvette_Storage 164817_RawData.TXT');

X1 = result1(:,1); % Wavelength as prepared
Y1 = result1(:,2); % Absorption Intensity as prepared
X2 = result2(:,1); % Wavelength enriched
Y2 = result2(:,2); % Absorption Intensity enriched


X1 = table2array(X1);
Y1 = table2array(Y1);
X2 = table2array(X2);
Y2 = table2array(Y2);


%% Plotting UV-Vis Absorption

t = tiledlayout(2,1);

ax1 = nexttile;
plot(ax1,X1,Y1, '-r','LineWidth', 2, 'MarkerSize', 1);
hold on
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([300,2000])
ylim([-0.35,4])
legendHandle = legend('As-Dispersed s-CNT', 'Location', 'northeast');
legendHandle.FontSize = 15;

%%%%%%%%%%%%%
ax2 = nexttile;

plot(ax2,X2,Y2, '-.b','LineWidth', 2, 'MarkerSize', 1);
ylim([-0.05,0.5])
hold on

linkaxes([ax1,ax2],'x');
%linkaxes([ax1,ax2],'y');
xlabel(t,'Wavelength (nm)' , 'FontSize', 15);
ylabel(t,'Absorbance (a.u.)' , 'FontSize', 15);

% Move plots closer together

t.Padding = 'compact';
t.TileSpacing = 'compact';

ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([300,2000])

legendHandle = legend('Enriched s-CNT', 'Location', 'northeast');
legendHandle.FontSize = 15;


%% End of Script 
