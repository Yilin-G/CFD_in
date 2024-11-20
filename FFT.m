%Consider signals
%S1 = 1 -abs(t) fot t=[-1 , 1]
%S2 = 1 + sin(t) for t=[-1 , 1]
clear all;
close all;
clc;

% Continous
syms S1 S1 t f
S1 = 1 - abs(t);
S2 = 1 + sin(t);
%lim1 = [-1,1];
limf1 = [0,10];
tim1 = [-1,1];
tim2 = [0,2*pi];
limf2 = [0,5];
fplot(S1,[-1,1]);

my_exp = exp(-1i*2*pi*f*t);

S1_hat = eval(int(S1*my_exp,'t', -1,1));
S2_hat = eval(int(S2*my_exp,'t', -pi,pi));
figure(2);
fplot(S1_hat,[-1,1]);
figure(3);
fplot(abs(S2_hat),[-5,5]);
% fplot(f,S1_hat,limf)

% Gaussian funtion 
S = exp(t*2);

% Discrete
 N = 32;
% t_d1 = linspace(limf(1),limf(2),N);
% S1_d_hat =fft(s1_d);
%S2_d =
t_d2 = linspace(tim2(1),tim2(2),N);
S2_d = 1 + sin(t_d2);

%figure(1);
%fplot(t,S1,lim1,'-r','LineWidth',2);
%hold on;
%plot(t_d1,S1_d,'-k','LineWidth',2);

figure(4);
fplot(t,S2,tim2,'-r','LineWidth',2);
hold on;
plot(t_d2,S2_d,'-k','LineWidth',2);
