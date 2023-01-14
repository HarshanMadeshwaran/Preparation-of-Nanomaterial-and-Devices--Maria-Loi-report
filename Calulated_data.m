clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%%  FILE DATA
D = [1:8];

mu_n_lin = [0.0173
0.1626
1.361
0.88
2.369
2.245
1.645
2.08];
mu_p_lin = [0.0255
0.108
1.405
0.725
2.45
2.021
1.808
2.824];

mu_n_sat = [0.1575
0.3095
1.45
1.6323
3.41
5.11
4.47
4.176];
mu_p_sat = [0.06023
0.2577
0.7722
0.767
0.929
0.89
0.6541
0.85385];

Vth_n_lin = [-12.9
11.14
10.028
8.12
11.43
5.55
-1.153
3.85];
Vth_p_lin = [-0.1144
6.719
-3.609
8.4
-7.72
-7.44
-10.906
-8.96];

Vth_n_sat = [-3.053
-3.65
-10.544
-8.95
-6.81
-11.95
-14.89
-12.51];
Vth_p_sat = [24.59
20.89
18.944
25.906
14.028
14.37
10.88
13.08];

onoffratio_n_lin = [4.08E+05
2.62E+05
2.88E+03
1.51E+07
7.61E+04
1.40E+04
5.10E+04
3.58E+04];
onoffratio_p_lin = [3.15E+07
7.73E+04
1.17E+06
2.66E+07
1.78E+07
2.49E+04
1.05E+07
4.31E+05];

onoffratio_n_sat = [1.27E+04
7.42E+03
6.69E+02
9.38E+03
6.43E+02
6.30E+02
4.85E+02
4.86E+02];
onoffratio_p_sat = [1.97E+04
6.99E+03
3.02E+04
1.08E+04
3.15E+03
4.85E+02
2.96E+03
1.65E+03];


%% Plotting Calculated data

% Linear Mobility Calculation 

figure
plot(D,mu_n_lin, 'or','LineWidth', 2, 'MarkerSize', 5);
hold on

plot(D,mu_p_lin,'diamondb','LineWidth', 2, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('Linear Mobility', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);

% Saturation Mobility Calculation 

figure

plot(D,mu_n_sat, 'or','LineWidth', 2, 'MarkerSize', 5);
hold on


plot(D,mu_p_sat,'diamondb','LineWidth', 2, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('Saturation Mobility', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);
% Linear Threshold voltage Calculation 

figure

plot(D,abs(Vth_n_lin), 'or','LineWidth', 2, 'MarkerSize', 5);
hold on


plot(D,abs(Vth_p_lin),'diamondb','LineWidth', 2, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('Linear Threshold voltage', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);

% Saturation Threshold voltage Calculation 

figure

plot(D,abs(Vth_n_sat), 'or','LineWidth', 2, 'MarkerSize', 5);
hold on


plot(D,abs(Vth_p_sat),'diamondb','LineWidth', 2, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('Saturation Threshold voltage', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);

% on_off ration Linear Calculation 

figure
plot(D,onoffratio_n_lin, 'or','LineWidth', 2, 'MarkerSize', 5);
hold on


plot(D,onoffratio_p_lin,'diamondb','LineWidth', 2, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('on off ration linear', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);

% on_off ration saturaion Calculation 

figure

plot(D,onoffratio_n_sat, 'or','LineWidth', 1, 'MarkerSize', 5);
hold on

plot(D,onoffratio_p_sat,'diamondb','LineWidth', 1, 'MarkerSize', 5);

%title('UV-Vis', 'FontSize', 15);
xlabel('Device', 'FontSize', 20);
ylabel('on off ration saturation', 'FontSize', 20);
ax = gca;
ax.FontSize = 20; 
H=gca;
H.LineWidth=2;
hold on 
xlim([0,9]);

%% End of Script 
