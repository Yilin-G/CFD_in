clear all;
close all;
clc;

%Parameter
x0=0;
x1=10;
A=1;

%spacing type
spacing_type='log';

syms f1 f2 f t f_d1 f_d2
f1=1 + t * sin(t) * sin(t);
f2=1 - t * sin(t) * sin(t);
mean_symb1 = eval(int(f1,[x0,x1])/(x1-x0));
mean_symb2 = eval(int(f2,[x0,x1])/(x1-x0));
std_symb1 = eval(sqrt(int(f1-mean_symb1,[x0,x1])^2/(x1-x0)));
std_symb2 = eval(sqrt(int(f2-mean_symb2,[x0,x1])^2/(x1-x0)));
skewness1 = eval(int(f1-mean_symb1,[x0,x1])^3/(x1-x0)/std_symb1^3);
skewness2 = eval(int(f2-mean_symb2,[x0,x1])^3/(x1-x0)/std_symb2^3);
kurtosis1 = eval(int(f1-mean_symb1,[x0,x1])^4/(x1-x0)/std_symb1^4);
kurtosis2 = eval(int(f2-mean_symb2,[x0,x1])^4/(x1-x0)/std_symb2^4);

fplot(t,f1,[0,2*pi]);
hold on;
fplot(t,f2,[0,2*pi]);

% discrete sample
n=108;
t_d=linspace(x0,x1,n);
T=t_d(2)-t_d(1);
f_sampling=1/T;
disp(f_sampling);
f_d1=1+t_d.*sin(t_d).*sin(t_d);
f_d2=1-t_d.*sin(t_d).*sin(t_d);
disp([mean(f_d1), std(f_d1), skewness(f_d1), kurtosis(f_d1)]);

% Polynomial reconstruction
%p_order = 5;
%coeff1 = polyfit(t,f1,p_order);
%coeff2 = polyfit(t,f2,p_order);
%f_rec1 = polyval(coeff1,t);
%f_rec2 = polyval(coeff2,t);

%plotting
%fplot(t,f_d1,[0,2*pi],'-k','LineWidth',2)
%hold on
%fplot(t,f_d2,[0,2*pi],'-b','LineWidth',2)

plot(t_d,f_d1,'--or','LineWidth',2,'MarkerFaceColor','r')
plot(t_d,f_d2,'--or','LineWidth',2,'MarkerFaceColor','r')

mu=mean(f1)+mean(f2);
