clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%% READING FILE VARIABLES T-Temperature

result = readtable('20um_10mm_dev4_IDVG.dat');

Z = result(:,1); % V_drain
X = result(:,2); % V_gate
Y = result(:,3); % I_drain

Z = table2array(Z);
X = table2array(X);
Y = table2array(Y);
% B = table2array(B);
% C = table2array(C);


%  [dim1,dim2] = size(Y); % n-rows & 1-column
%  k = dim1;
%  m = 1;
%  n = 1;
%  for i = 1:k
%      if (i == k)
%        IDS2(n,1) = abs(A(i,1));
%        VG2(n,1) = Y(i,1);  
%      elseif (X(i,1) > 0)
%          if (Y(i+1,1) > Y(i,1))
%              IDS1(m,1) = A(i,1);
%              VG1(m,1) = Y(i,1);
%              VDS1(m,1) = X(i,1);
%              m = m + 1;
%          end
%      elseif (X(i,1) < 0)
%          if (Y(i+1,1) > Y(i,1))
%              IDS2(n,1) = abs(A(i,1));
%              VG2(n,1) = Y(i,1);
%              VDS2(n,1) = X(i,1);
%              n = n + 1;
%          end
%      end     
%  end
 

%% Selecting only the VDS = +- 5V with Forward and Backward Sweeps

% n channel
Xn_lin = X(find(Z == 5));
Zn_lin = Z(find(Z == 5));
Yn_lin = Y(find(Z == 5));

% p channel
Xp_lin = X(find(Z ==-5));
Zp_lin = Z(find(Z ==-5));
Yp_lin = abs(Y(find(Z ==-5)));

%% Selecting only the VDS = +- 30V with Forward and Backward Sweeps

% n channel
Xn_sat = X(find(Z ==30));
Zn_sat = Z(find(Z ==30));
Yn_sat = Y(find(Z ==30));

% p channel
Xp_sat = X(find(Z ==-30));
Zp_sat = Z(find(Z ==-30));
Yp_sat = abs(Y(find(Z ==-30)));

%% Plotting Transfer Curves

t = tiledlayout(1,2);

ax1 = nexttile;
semilogy(ax1,Xp_lin,Yp_lin,Xp_sat,Yp_sat, '-r','LineWidth', 2, 'MarkerSize', 1);
set(gca, 'YScale', 'log') 
hold on
ax = gca;
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([-60,40])

legendHandle = legend('V_D_S = -5 V','V_D_S = -30 V', 'Location', 'north');
legendHandle.FontSize = 10;


ax2 = nexttile;
plot(ax2,Xn_lin,Yn_lin,Xn_sat,Yn_sat, '-r','LineWidth', 2, 'MarkerSize', 1);
set(gca, 'YScale', 'log') 
hold on
ax = gca;
ax.YAxisLocation = "right";
ax.FontSize = 15; 
H=gca;
H.LineWidth=1.5;
hold on 
xlim([-40,60])

legendHandle = legend('V_D_S = 5 V','V_D_S = 30 V', 'Location', 'north');
legendHandle.FontSize = 10;


%linkaxes([ax1,ax2],'x');
linkaxes([ax1,ax2],'y');
xlabel(t,'V_G (V)' , 'FontSize', 15);
ylabel(t,'|I_D_S| (A)' , 'FontSize', 15);

% Move plots closer together

t.Padding = 'compact';
t.TileSpacing = 'compact';

