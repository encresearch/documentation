%% Unbound positive hole equilibrium concentration as a function of x and of carrier concentration at 900 K
 
T=900;                                     %temperature of crystal in K
k=8.62E-5;                                 %Boltzmann's constant in eV/K
q=1.6E-19;                                 %elementary charge in C
e0=8.85E-12;                               %permitivity of free space in F/m
e=9.6;                                     %relative permitivity of MgO
A=q^2/(k*T*e0*e);                          %constant combining the other constants
function pde1;
m=2;
xmesh=linspace(0,9E-9,1E-9);
tspan=linspace(0,100,10);
sol=pdpe(m,pdefun,icfun,bcfun,xmesh,tspan);
u=sol(:,:,1);
function [c,f,s]=pdefun(x,t,u,DuDx);
c=1/A;
f=DuDx;
s=0;
function u0=pdeic(x);
u0=0;
function[pl,ql,pr,qr]=pdebc(xl,ul,xr,ur,t);
pl=0;
ql=1;
pr=0;
qr=1;
