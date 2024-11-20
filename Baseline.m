clear all;
close all;
clc;
% load data - Vel[m/s];y [mm]
load('HotWireData_Baseline.mat')
my_Y = flip(y+yOffset);
idx1=50;
idx2=51;

my_Umean = flip(mean(Vel));
my_Ustd = flip(std(Vel));
my_Uske = flip(skewness(Vel));
my_Ukur = flip(kurtosis(Vel));

my_uprime = Vel - my_Umean;
S1 = my_uprime(:,50);
S2 = my_uprime(:,51);
[R,p] = corrcoef(S1,S2);

%Plot
figure(1);
plot(my_Umean,my_Y,'-k','LineWidth',2);
hold on;
figure(2);
plot(U,my_Y,'-r');
xlabel('y [mm]')
ylabel('u [m/s]')

figure(3);
plot(t,Vel(:,54));
xlabel('t [s]')
ylabel('u [m/s]')

figure(4);
plot(my_Ustd,my_Y);

figure(5);
plot(my_Uske,my_Y);

figure(6);
histogram(S1);

%figure(7);
%scatter(S1(1,100),S2(1,100),50)

%figure(8);
%set(gcf, 'Units', 'pixels', 'Position', [100, 100, 1600, 1000]);
%set(gcf, 'Paperunits', 'centimeters');
%set(gcf, 'Paperszie',)

