clear all;
close all;
clc;

domain=76;
N=[inf, 18000, 8000, 4500];
L=[0, 6.063, 5.972, 5.863];
p =1.53;
tol_wanted =1e-4;
tol =1;
q_old =0;
cter=1;
%%Grid convergence analysis
%average grid size
h = sqrt(1./N);
r32 = h(4)/h(3);
r21 = h(3)/h(2);

while tol>tol_wanted
    p_est =1/log(r21)*log((L(4)-L(3))/(L(3)-L(2)))+q_old;
    q_new = log((r21^p_est - sign((L(4)-L(3))/(L(3)-L(2)/r32^p_est - sign((L(4)-L(3))/(L(3)-L(2)))))));
    tol = abs(q_new-q_old);
    q_old = q_new;
    disp(p_est)
    cter = cter+1
end
p=p_est;
%%Grid convergence analysis
%average grid size
h = sqrt(1./N);
r32 = h(4)/h(3);
r21 = h(3)/h(2);

%Richdson 
L(1)= (r21^p*L(2)-L(3)) / (r21^p-1);
%realtive change
eps21=abs(L(3)-L(2)/L(2));
eps32=abs(L(4)-L(3)/L(3));

%GCI
GCI21 =1.25*eps21/(r21^p-1);
GCI32 =1.25*eps32/(r32^p-1);

%asymptotic range
AR = r21^p*GCI21/GCI32;

%visualisation
figure(1);
plot(h(2:end)/h(2),L(2:end),'-ko','MarkerSize',8,'MarkerFaceColor','k')
hold on;
plot(h(1)/h(2),L(1),'rd','MarkerSize',10,'MarkerFaceColor','r')
xlabel('NGS')
ylabel('Non_dimensional length')