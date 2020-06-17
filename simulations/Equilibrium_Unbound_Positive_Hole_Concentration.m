%% Unbound positive hole equilibrium concentration as a function of x and of carrier concentration at 900 K
 
global A
T=900;                                     %temperature of crystal in K
k=8.62E-5;                                 %Boltzmann's constant in eV/K
q=1.6E-19;                                 %elementary charge in C
e0=8.85E-12;                               %permitivity of free space in F/m
e=9.6;                                     %relative permitivity of MgO
A=q^2/(k*T*e0*e);                          %constant combining the other constants
m=0;
x=0:1E-9:9E-9;
t=0:10:100;
sol=pdpe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);
u=sol(:,:,1);
function [c,f,s]=pdex1pde(x,t,u,DuDx);
global A
c=1/A;
f=exp(u).*x^2;
s=0;
function u0=pdex1ic(x);
u0=0;
function[pl,ql,pr,qr]=pdex1bc(xl,ul,xr,ur,t);
pl=0;
ql=1;
pr=0;
qr=1;
figure(1)
plot(x,u)
end
end
end
