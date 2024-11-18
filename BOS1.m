clear all;close all;clc;
% symbolic
syms f f_der t
f=sin(t);
fplot(f,t,[0,2*pi]);
f_der=diff(f,t);

% discrete 
n=8;
t_d=linspace(0,2*pi,n);
T=t_d(2)-t_d(1)
f_sampling=1/T
f_d=sin(t_d);
f_d_der=gradient(f_d,t_d);

%plotting
fplot(t,f,[0,2*pi],'-k','LineWidth',2)
hold on
fplot(t,f_der,[0,2*pi],'-b','LineWidth',2)

plot(t_d,f_d,'--or','LineWidth',2,'MarkerFaceColor','r')
plot(t_d,f_d_der,'+r','LineWidth',2,'MarkerFaceColor','r')