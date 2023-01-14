clear;
close all;
clc

format long g;
format compact;
fontsize = 20;

%% READING FILE VARIABLES T-Temperature

result = readtable('20um_10mm_dev4_IV.dat');

X = result(:,1); % V_drain
Y = result(:,2); % V_gate
A = result(:,3); % I_drain
B = result(:,4); % I_gate
C = result(:,5); % I_source

X = table2array(X);
Y = table2array(Y);
A = table2array(A);
B = table2array(B);
C = table2array(C);

%% Calculating I_DS and V_DS

%  VDS = X;
%  IDS = A - C;

 m = 1;
 [dim1,dim2] = size(A); % n-rows & 1-column
 n = dim1;
col = 1;
j = 1;
 for c = 1:n
     if(j == 1)
         Vds(j,col) = 0;
         j = j + 1;
     else 
         Vds(j,col) = X(c,1);
         Ids(j,col) = A(c,1)-C(c,1);
         j = j + 1;
     end
         
     if (abs(X(c,1)) == 50 || abs(X(c,1)) == 0)
             col = col + 1;
             j = 1;
         end

 end
% k = -1;
%  for i=1:6
%      k = k + 3;
%      for j=1:200
%          
%          if(j>101)
%              VDS(j,i) = Vds(j-100,k+18);
%              IDS(j,i) = Ids(j-100,k+18);
%          elseif(j<=100)
%              VDS(j,i) = Vds(j,k);
%              IDS(j,i) = Ids(j,k);
%          end
%          
%      end
%  end

 k = -1;
 for i=1:6
     k = k + 3;
     for j=1:200
         
         if(j>=101)
             VDS(j,i) = Vds(j-100,k+18);
             IDS(j,i) = Ids(j-100,k+18);
         elseif(j<=99)
             VDS(j,i) = Vds(100-j,k);
             IDS(j,i) = Ids(100-j,k);
         end
         
     end
 end

%  for c = 1:n
%      dummy2 = X(c,1);
%      if abs(dummy2) > abs(dummy1)
%          IDS(m,1) = abs(A(c,1) - C(c,1));
%          VDS(m,1) = X(c,1);
%           m = m+1;
%      end
%      dummy1 = X(c,1);
%  end
%% Seperating continuous data set into arrays

% XF = VDS(find(VDS >=0.5 & VDS <= 50));
% YF = IDS(find(VDS >=0.5 & VDS <= 50));
% XB = VDS(find(VDS >=-50 & VDS <= -0.5));
% YB = IDS(find(VDS >=-50 & VDS <= -0.5));
% 
% % Forward
% dummy = 1;
% unit=1;
% for i=1:length(XF)
%     XFa(dummy,unit) = XF(i);
%     YFa(dummy,unit) = YF(i);
%     unit = unit+1;
%     if(XF(i)== 50)
%         dummy = dummy+1;
%         unit = 1;
%     end
% end
% XFa = XFa';
% YFa = YFa';
% 
% % Backward
% dummy = 1;
% unit=1;
% for i=1:length(XB)
%     XBa(dummy,unit) = XB(i);
%     YBa(dummy,unit) = YB(i);
%     unit = unit+1;
%     if(XB(i)== -50)
%         dummy = dummy+1;
%         unit = 1;
%     end
% end
% XBa = XBa';
% YBa = YBa';

%% Combinig data sets with same gate voltage
% col = 1;
% j = 1;
% for i=1:6
%     VDS(j,col) = 
% 
% end

%% Plotting Output Characteristics Curve
figure
box on;
hold on

for j=1:6
    plot(VDS(:,j),abs(IDS(:,j)),'LineWidth', 2, 'MarkerSize', 1);
end
box off;

xlabel('V_D_S (V)', 'FontSize', 25);
ylabel('|I_D_S| (mA)', 'FontSize', 25);

ax = gca;
box(ax,'on');
ax.FontSize = 25;
H=gca;
H.LineWidth=2;
yt = get(gca, 'YTick');
set(gca, 'YTick',yt, 'YTickLabel',yt*1E3)
hold on
xlim([min(X),max(X)])
ylim([-0.00005,0.025])

legendHandle = legend('S3-D4', 'Location', 'northwest');
legendHandle.FontSize = 25;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')
%% End of Script 