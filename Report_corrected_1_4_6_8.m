clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%%  FILE DATA
D = [1;2;6;10];

mu_n_lin = [0.0173

0.88

2.245

2.08];
mu_p_lin = [0.0226

0.725

2.021

2.824];

mu_n_sat = [0.1575

1.6323

5.11

4.176];
mu_p_sat = [0.06023

0.767

0.89

0.85385];

Vth_n_lin = [-12.9

8.12

5.55

3.85];
Vth_p_lin = [2.435

8.4

-7.44

-8.96];

Vth_n_sat = [-3.053

-8.95

-11.95

-12.51];
Vth_p_sat = [24.59

25.906

14.37

13.08];

onoffratio_n_lin = [4.08E+05

1.51E+07

1.40E+04

3.58E+04];
onoffratio_p_lin = [3.15E+07

2.66E+07

2.49E+04

4.31E+05];

onoffratio_n_sat = [1.27E+04

9.38E+03

6.30E+02

4.86E+02];
onoffratio_p_sat = [1.97E+04

1.08E+04

4.85E+02

1.65E+03];


%% Plotting Calculated data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linear Mobility Calculation 

figure
plot(D,mu_n_lin, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,mu_p_lin,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('\mu_l_i_n_e_a_r (cm^2V^-^1s^-^1), |V_D_S| = 5V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,12]);
ylim([-0.25,5.5])

% Saturation Mobility Calculation 

figure

plot(D,mu_n_sat, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,mu_p_sat,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('\mu_s_a_t_u_r_a_t_i_o_n (cm^2V^-^1s^-^1), |V_D_S| = 30V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,12]);
ylim([-0.25,5.5])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Linear Threshold voltage Calculation 

figure

plot(D,abs(Vth_n_lin), ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,abs(Vth_p_lin),'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('|V_t_h| (V), |V_D_S| = 5V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,12]);
ylim([-0.05,30])


% Saturation Threshold voltage Calculation 

figure

plot(D,abs(Vth_n_sat), ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,abs(Vth_p_sat),'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('|V_t_h| (V), |V_D_S| = 30V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([0,12]);
ylim([-0.05,30])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% on_off ration Linear Calculation 

figure
plot(D,onoffratio_n_lin, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,onoffratio_p_lin,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('On-Off Ratio x 10^6, |V_D_S| = 5V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-6)
xlim([0,11]);



% on_off ration saturation Calculation 

figure

plot(D,onoffratio_n_sat, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on

plot(D,onoffratio_p_sat,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('On-Off Ratio x 10^3, |V_D_S| = 30V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-3)
xlim([0,11]);

%% End of Script 
