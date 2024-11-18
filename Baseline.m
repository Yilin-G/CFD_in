clear all;
close all;
clc;
% load data - Vel[m/s];y [mm]
load('HotWireData_Baseline.mat')

my_Umean = flip(mean(Vel));
my_Ustd = flip(std(Vel));
figure(1);
plot(y+yOffset,my_Umean,'-k','LineWidth',2);
hold on;
figure(2);
plot(y+yOffset,U,'-r');
xlabel('y [mm]')
ylabel('u [m/s]')

%figure(2);
%plot(t,Vel(:,1));


