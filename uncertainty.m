clear all;
close all;
clc;

%syms U,S,L,rho;
U_val = 9.8; 
U_d = 0.1;
rho_val = 1.21;
rho_d = 0.01;
S_val = 2.45;
S_d = 0.03;
L_val = 56.9;
L_d = 0.2;
CL = L / 0.5 * rho * U * U * S;
s_U = diff(CL,U);
s_S = diff(CL,S);
s_L = diff(CL,L);
s_rho = diff(CL,rho);

CL_val = L_val/0.5*rho_val*U_val*U_val*S_val;

u_CL = abs(subs(s_U,[U,L,S,rho],[U_val,L_val,S_val,rho_val]))*U_d + ...
       abs(subs(s_L,[U,L,S,rho],[U_val,L_val,S_val,rho_val]))*L_d + ...
       subs(s_S,[U,L,S,rho],[U_val,L_val,S_val,rho_val])*S_d + ...
       subs(s_rho,[U,L,S,rho],[U_val,L_val,S_val,rho_val])*rho_d;

disp(double(CL_val),double(u_CL));