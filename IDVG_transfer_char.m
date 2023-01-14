clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%% READING FILE VARIABLES T-Temperature

result = readtable('20um_10mm_dev3_IDVG.dat');

X = result(:,1); % V_drain
Y = result(:,2); % V_gate
A = result(:,3); % I_drain

X = table2array(X);
Y = table2array(Y);
A = table2array(A);
% B = table2array(B);
% C = table2array(C);

%% Calculating I_DS and V_DS

%   VG = X;
%   IDS = A;


 [dim1,dim2] = size(Y); % n-rows & 1-column
 k = dim1;
 m = 1;
 n = 1;
 for i = 1:k
     if (i == k)
       IDS2(n,1) = abs(A(i,1));
       VG2(n,1) = Y(i,1);  
     elseif (X(i,1) > 0)
         if (Y(i+1,1) > Y(i,1))
             IDS1(m,1) = A(i,1);
             VG1(m,1) = Y(i,1);
             VDS1(m,1) = X(i,1);
             m = m + 1;
         end
     elseif (X(i,1) < 0)
         if (Y(i+1,1) < Y(i,1))
             IDS2(n,1) = abs(A(i,1));
             VG2(n,1) = Y(i,1);
             VDS2(n,1) = X(i,1);
             n = n + 1;
         end
     end     
 end
 
%  for c = 1:n/2
%      dummy2 = Y(c+1,1);
%      if dummy2 > dummy1
%          IDS1(m,1) = A(c,1);
%          VG1(m,1) = Y(c,1);
%          m = m + 1;
%      end
%      dummy1 = Y(c,1);
%  end
% 
%  m = 1;
%  k = n/2+1;
%  dummy1 = Y(1206,1);
%   for c = k:n
%      dummy2 = Y(c+1,1);
%      if dummy2 > dummy1
%          IDS2(m,1) = abs(A(c,1));
%          VG2(m,1) = Y(c,1);
%          m = m + 1;
%      end
%      dummy1 = Y(c,1);
%  end

%% Seperating Data into seperate arrays

% n channel 
i = 1;
col = 1;
j = 1;
for i = 1:601
    VGn (j,col) = VG1 (i,1);
    Idn (j,col) = IDS1 (i,1); 
    sIdn (j,col) = log(IDS1 (i,1));
    sqIdn (j,col) = sqrt(IDS1 (i,1)); 
    Vdsn (j,col) = VDS1 (i,1);
    j = j + 1;
     if (VG1(i,1) == 59)
        col = col + 1;
        j = 1;
    end
end

% p channel
i = 1;
col = 1;
j = 1;
for i = 1:600    
    VGp (j,col) = VG2 (i,1);
    Idp (j,col) = IDS2 (i,1);
    sIdp (j,col) = log(IDS2 (i,1));
    sqIdp (j,col) = sqrt(IDS2 (i,1)); 
    Vdsp (j,col) = VDS2 (i,1);
    j = j + 1;
    if (VG2(i,1) == -59)
        col = col + 1;
        j = 1;
    end
end


% %% Linear CURVE FITTING
% % n channel
% XF1 = VGn(find(VG1 >=40 & VG1 <= 60));
% ZF1 = Vdsn(find(VG1 >=40 & VG1 <= 60));
% YF1 = Idn(find(VG1 >=40 & VG1 <= 60));
% % p channel
% XF2 = VGp(find(VG2 >=-60 & VG2 <= -55));
% ZF2 = Vdsp(find(VG2 >=-60 & VG2 <= -55));
% YF2 = Idp(find(VG2 >=-60 & VG2 <= -55));
% 
% % n channel calculation
% j = 1;
% for i = 1:6
% lin = polyfit(XF1(j:j+19,1),YF1(j:j+19,1),1);
% slope = lin(1);
% c = lin(2);
% derivative_n(i,1) = slope;
% Vdrain_n(i,1) = ZF1(j+19,1);
% if (j < 120)
%     j = j + 20;
% end
% end
% 
% % p channel
% j = 1;
% for i = 1:6
% lin = polyfit(XF2(j:j+10,1),YF2(j:j+10,1),1);
% slope = lin(1);
% c = lin(2);
% derivative_p(i,1) = slope;
% Vdrain_p(i,1) = ZF2(j+10,1);
% if (j < 36)
%     j = j + 11;
% end
% end

%% Linear CURVE FITTING

% n channel
XF1 = VGn(find(VG1 >=40 & VG1 <= 50));
ZF1 = Vdsn(find(VG1 >=40 & VG1 <= 50));
YF1 = Idn(find(VG1 >=40 & VG1 <= 50));
% p channel
XF2 = VGp(find(VG2 >=-50 & VG2 <= -15));
ZF2 = Vdsp(find(VG2 >=-50 & VG2 <= -15));
YF2 = Idp(find(VG2 >=-50 & VG2 <= -15));

[n,m] = size(XF1);
[p,q] = size(XF2);
inc1 = n/6 -1;
inc2 = p/6 -1;

 % n channel calculation
j = 1;
for i = 1:6
lin = polyfit(XF1(j:j+inc1,1),YF1(j:j+inc1,1),1);
slope = lin(1);
c = lin(2);
derivative_n(i,1) = slope;
Vdrain_n(i,1) = ZF1(j+inc1,1);
linVth_n(i,1) = (-1 * c / slope) - Vdrain_n(i,1)/2;
if (j < n)
    j = j + n/6;
end
end

% p channel
j = 1;
for i = 1:6
lin = polyfit(XF2(j:j+inc2,1),YF2(j:j+inc2,1),1);
slope = lin(1);
c = lin(2);
derivative_p(i,1) = slope;
Vdrain_p(i,1) = ZF2(j+inc2,1);
linVth_p(i,1) = (-c / slope) - Vdrain_p(i,1)/2;
if (j < p)
    j = j + p/6;
end
end

%% Saturation regime

% n channel
XF3 = VGn(find(VG1 >=10 & VG1 <= 20));
ZF3 = Vdsn(find(VG1 >=10 & VG1 <= 20));
YF3 = sqIdn(find(VG1 >=10 & VG1 <= 20));
% p channel
XF4 = VGp(find(VG2 >=-20 & VG2 <= -10));
ZF4 = Vdsp(find(VG2 >=-20 & VG2 <= -10));
YF4 = sqIdp(find(VG2 >=-20 & VG2 <= -10));

[n,m] = size(XF3);
[p,q] = size(XF4);
inc1 = n/6 - 1;
inc2 = p/6 - 1;

% n channel calculation
j = 1;
for i = 1:6
lin = polyfit(XF3(j:j+inc1,1),YF3(j:j+inc1,1),1);
slope = lin(1);
c = lin(2);
satderivative_n(i,1) = slope;
satVdrain_n(i,1) = ZF3(j+inc1,1);
satVth_n(i,1) = (-1 * c / slope) - satVdrain_n(i,1)/2;
if (j < n)
    j = j + n/6;
end
end

% p channel
j = 1;
for i = 1:6
lin = polyfit(XF4(j:j+inc2,1),YF4(j:j+inc2,1),1);
slope = lin(1);
c = lin(2);
satderivative_p(i,1) = slope;
satVdrain_p(i,1) = ZF4(j+inc2,1);
satVth_p(i,1) = (-c / slope) - satVdrain_p(i,1)/2;
if (j < p)
    j = j + p/6;
end
end


% Fit Parameters are barrier height (phi in Volts), barrier thickness(s in Angstroms)
% Thickness : 1, Work Function: 2
% V(:,1) voltage, V(:,2) temperature
% Making a function with input parameters p and input data (V)

% fun = @(x,Vdsn)(x(1) * Vdsn + x(2));
% % Initial point for parameters (Guess values to start with make your best guess)
% x0 = [25,1];
% 
% % Upper and lower bounds
% lb = [0,0];
% ub = [50,5];
% 
% % LSQ curve fit algorithm to find optimal value for data set parameters p
% x = lsqcurvefit(fun,x0,A,Y,lb,ub);
% -------------------------------------------------------------------------



%% Calculating Mobility in linear region

W = 0.01;
C = 15*10^(-9);
L = 20*10^(-6);
 
% n channel
for i = 1:6
mu_lin_n(i,1) = L /(W * C .* Vdrain_n(i,1)) .* abs(derivative_n(i,1));
end

% p channel
for i = 1:6
mu_lin_p(i,1) = L /(W * C .* abs(Vdrain_p(i,1))) .* abs(derivative_p(i,1));
end


%% Calculating Mobility in Saturation region

W = 0.01;
C = 15*10^(-9);
L = 20*10^(-6);
 
% n channel
for i = 1:6
mu_sat_n(i,1) = (2 * L /(W * C)) * (satderivative_n(i,1) .* satderivative_n(i,1));
end

% p channel
for i = 1:6
mu_sat_p(i,1) = (2 * L /(W * C)) * (satderivative_p(i,1) .* satderivative_p(i,1));
end

% %% Subthreshold Slope S
% 
% % n channel
% XF5 = VGn(find(VG1 >=15 & VG1 <= 25));
% ZF5 = Vdsn(find(VG1 >=15 & VG1 <= 25));
% YF5 = logIdn(find(VG1 >=15 & VG1 <= 25));
% % p channel
% XF6 = VGp(find(VG2 >=-50 & VG2 <= -40));
% ZF6 = Vdsp(find(VG2 >=-50 & VG2 <= -40));
% YF6 = logIdp(find(VG2 >=-50 & VG2 <= -40));
% 
% [n,m] = size(XF5);
% [p,q] = size(XF6);
% inc1 = n/6 - 1;
% inc2 = p/6 - 1;
% 
% % n channel calculation
% j = 1;
% for i = 1:6
% lin = polyfit(XF5(j:j+inc1,1),YF5(j:j+inc1,1),1);
% slope = lin(1);
% c = lin(2);
% ssderivative_n(i,1) = slope;
% ssVdrain_n(i,1) = ZF5(j+inc1,1);
% if (j < n)
%     j = j + n/6;
% end
% end
% 
% % p channel
% j = 1;
% for i = 1:6
% lin = polyfit(XF6(j:j+inc2,1),YF6(j:j+inc2,1),1);
% slope = lin(1);
% c = lin(2);
% ssderivative_p(i,1) = slope;
% ssVdrain_p(i,1) = ZF6(j+inc2,1);
% if (j < p)
%     j = j + p/6;
% end
% end

%% Plotting Transfer characteristics curve

figure
hold on
for i=1:6
    plot(VGn(:,i),Idn(:,i),'LineWidth', 2, 'MarkerSize', 2);
end

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E3)
xlim([-40,60]) 
ylim([-0.0005,0.0025])
title('n Channel', 'FontSize', 20);

xlabel('V_G (V)', 'FontSize', 20);
ylabel('I_D_S (mA)', 'FontSize', 20);
% legendHandle = legend('S8-D1 n channel', 'Location', 'Northwest');
% legendHandle.FontSize = 20;
xlim([-40,60])
ylim([-0.0005,0.005])

% semi log transfer curve of n channel
figure
hold on
for i=1:6
    semilogy(VGn(:,i),Idn(:,i),'LineWidth', 2, 'MarkerSize', 2);
    set(gca, 'YScale', 'log') % But you can explicitly force it to be logarithmic
end

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([-40,60]) 
title('n Channel', 'FontSize', 20);


xlabel('V_G (V)', 'FontSize', 20);
ylabel('I_D_S (A)', 'FontSize', 20);
% legendHandle = legend('S8-D1 n channel', 'Location', 'northwest');
% legendHandle.FontSize = 20;
xlim([-40,60])

% vth sqrt transfer curve of n channel

figure
hold on
for i=1:6
     plot(VGn(:,i),sqIdn(:,i),'LineWidth', 2, 'MarkerSize', 2);
 end
 ax = gca;
 box(ax,'on');
 ax.FontSize = 20;
 H=gca;
 H.LineWidth=2;
 hold on
 xlim([-40,60]) 
 title('n Channel', 'FontSize', 20);

 
 xlabel('V_G (V)', 'FontSize', 20);
 ylabel('I_D_S^1^/^2 (A^1^/^2)', 'FontSize', 20);
%  legendHandle = legend('S7-D2 n channel', 'Location', 'northwest');
%  legendHandle.FontSize = 20;
 xlim([-40,60])

%-------------------------------------------------------------------------
% p channel transfer curve

figure
hold on
for i=1:6
    plot(VGp(:,i),Idp(:,i),'LineWidth', 2, 'MarkerSize', 2);
end

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E3)
xlim([-60,40])
ylim([-0.00005,0.001])
title('p Channel', 'FontSize', 20);

xlabel('V_G (V)', 'FontSize', 20);
ylabel('I_D_S (mA)', 'FontSize', 20);
% legendHandle = legend('S8-D1 p channel', 'Location', 'northwest');
% legendHandle.FontSize = 20;

% semilog plots of p channel

figure
hold on
for i=1:6
    semilogy(VGp(:,i),Idp(:,i),'LineWidth', 2, 'MarkerSize', 2);
    set(gca, 'YScale', 'log') % But you can explicitly force it to be logarithmic
end

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([-60,40])
title('p Channel', 'FontSize', 20);

xlabel('V_G (V)', 'FontSize', 20);
ylabel('I_D_S (A)', 'FontSize', 20);
% legendHandle = legend('S8-D1 p channel', 'Location', 'northwest');
% legendHandle.FontSize = 20;

% vth sqrt transfer curve of p channel

figure
hold on
for i=1:6
     plot(VGp(:,i),sqIdp(:,i),'LineWidth', 2, 'MarkerSize', 2);
 end
 ax = gca;
 box(ax,'on');
 ax.FontSize = 20;
 H=gca;
 H.LineWidth=2;
 hold on
 xlim([-60,40])

 title('p Channel', 'FontSize', 20);

 xlabel('V_G (Volt)', 'FontSize', 20);
 ylabel('I_D_S^1^/^2 (A^1^/^2)', 'FontSize', 20);
%  legendHandle = legend('S7-D2 p channel', 'Location', 'northwest');
%  legendHandle.FontSize = 20;
 xlim([-60,40])

%--------------------------------------------------------------------------
% plotting mobility of n and p channel
% Linear Regime
figure
hold on 

plot(Vdrain_n,mu_lin_n,'--pentagramr', 'LineWidth', 1, 'MarkerSize', 5);
plot(abs(Vdrain_p),mu_lin_p,'-squareb', 'LineWidth', 1, 'MarkerSize', 5);


ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([0,32.5]);
ylim([0,9]);

%title('transfer char', 'FontSize', 15);
xlabel('|V_D| (Volt)', 'FontSize', 20);
ylabel('Linear Mobility (Cm^2/V.s)', 'FontSize', 20);
legendHandle = legend('Linear Mobility of n channel','Linear Mobility of p channel', 'Location', 'northwest');
legendHandle.FontSize = 15;

% saturation Regime
figure
hold on 

plot(satVdrain_n,mu_sat_n,'--pentagramr', 'LineWidth', 1, 'MarkerSize', 5);
plot(abs(satVdrain_p),mu_sat_p,'-squareb', 'LineWidth', 1, 'MarkerSize', 5);

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([0,32.5]);
ylim([-0.1,5]);

%title('transfer char', 'FontSize', 15);
xlabel('|V_D| (Volt)', 'FontSize', 20);
ylabel('Saturation Mobility (Cm^2/V.s)', 'FontSize', 20);
legendHandle = legend('n channel','p channel', 'Location', 'northwest');
legendHandle.FontSize = 15;

%Threshold Voltage Saturation Regime
figure
hold on 

plot(Vdrain_n,linVth_n,'--pentagramr', 'LineWidth', 1, 'MarkerSize', 5);
plot(abs(Vdrain_p),linVth_p,'-squareb', 'LineWidth', 1, 'MarkerSize', 5);

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([0,35]);
ylim([-50,50]);

title('Linear V_th', 'FontSize', 15);
xlabel('V_drain', 'FontSize', 20);
ylabel('V_th (Volt)', 'FontSize', 20);
legendHandle = legend('n Channel','p Channel', 'Location', 'northwest');
legendHandle.FontSize = 15;

%Threshold Voltage Saturation Regime
figure
hold on 

plot(satVdrain_n,satVth_n,'--pentagramr', 'LineWidth', 1, 'MarkerSize', 5);
plot(abs(satVdrain_p),satVth_p,'-squareb', 'LineWidth', 1, 'MarkerSize', 5);

ax = gca;
box(ax,'on');
ax.FontSize = 20;
H=gca;
H.LineWidth=2;
hold on
xlim([0,35]);
ylim([-100,100]);

title('Saturartion V_th', 'FontSize', 15);
xlabel('V_drain', 'FontSize', 20);
ylabel('V_th (Volt)', 'FontSize', 20);
legendHandle = legend('n Channel','p Channel', 'Location', 'northwest');
legendHandle.FontSize = 15;

% %% SubThreshold Slope
% %ln p channel plot
% figure
% hold on
% for i=1:6
%     plot(VGp(:,i),lnIdp(:,i),'LineWidth', 2, 'MarkerSize', 2);
%     set(gca, 'YScale', 'log') % But you can explicitly force it to be logarithmic
% end
% 
% ax = gca;
% box(ax,'on');
% ax.FontSize = 20;
% H=gca;
% H.LineWidth=2;
% hold on
% xlim([-60,40])
% 
% xlabel('V_G (V)', 'FontSize', 20);
% ylabel('I_D_S (A)', 'FontSize', 20);
% legendHandle = legend('S8-D1 p channel', 'Location', 'northwest');
% legendHandle.FontSize = 20;


