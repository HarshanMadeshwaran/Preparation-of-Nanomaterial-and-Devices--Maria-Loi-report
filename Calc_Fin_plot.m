clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%%  FILE DATA
D = [1;2;6;10];

mu_n_lin = [0.0173

1.59

2.19

2.2157];
mu_p_lin = [0.0589

2.522

3.78

5.217];

mu_n_sat = [0.1575
1.54

4.76

4.17];
mu_p_sat = [0.00622

0.0432

0.0388

0.0493];

Vth_n_lin = [-12.9

11.924

5.287

3.91];
Vth_p_lin = [-38.25

-36.95


-37.37

-38.59];

Vth_n_sat = [-3.053

-10.544

-12.38

-12.577];
Vth_p_sat = [-6.435

3.56

5.57

3.99];

onoffratio_n_lin = [4.08E+05

2.72E+04

1.40E+04

3.58E+04];
onoffratio_p_lin = [8.62E+04

7.67E+03

1.67E+04

1.39E+04];

onoffratio_n_sat = [1.27E+04

6.69E+02

6.30E+02

4.86E+02];
onoffratio_p_sat = [3.39E+03

4.21E+02

2.96E+02

2.72E+02];


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
ylim([-0.25,6.5])

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
ylim([0,50])


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
ylim([0,15])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% on_off ration Linear Calculation 

figure
plot(D,onoffratio_n_lin, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on
plot(D,onoffratio_p_lin,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('On-Off Ratio (x 10^4), |V_D_S| = 5V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-4)
xlim([0,12]);



% on_off ration saturation Calculation 

figure

plot(D,onoffratio_n_sat, ':or','LineWidth', 2, 'MarkerSize', 7);
hold on

plot(D,onoffratio_p_sat,'-.diamondb','LineWidth', 2, 'MarkerSize', 7);

%title('UV-Vis', 'FontSize', 15);
xlabel('N^o Printing Passes', 'FontSize', 15);
ylabel('On-Off Ratio (x 10^3), |V_D_S| = 30V', 'FontSize', 15);
legendHandle = legend('n Channel','p Channel', 'Location', 'northeast');
legendHandle.FontSize = 15;
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E-3)
xlim([0,12]);

%% End of Script 
