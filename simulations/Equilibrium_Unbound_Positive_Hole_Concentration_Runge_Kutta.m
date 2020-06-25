%% Unbound positive hole equilibrium concentration as a function of x and of carrier concentration at 900 K
 
T=900;                                         %temperature of crystal in K
k=8.62E-5;                                     %Boltzmann's constant in eV/K
q=1.6E-19;                                     %elementary charge in C
eps0=8.85E-12;                                 %permitivity of free space in F/m
eps=9.6;                                       %relative permitivity of MgO
A=q^2/(k*T*eps0*eps);                          %constant combining the other constants

F=@(x,y)(A*y*x);
[OutputX,OutputY]=FunctionBeta_Executor(F);

function[x,y]=FunctionBeta_Executor(F)
h=1E-9;                                        %step size
x=0:h:10E-9;                                   %crystal depth range in m
y=zeros(1,length(x));                          %memory allocation
y(1)=1E26;                                     %initial concentration of positive holes in m^-3

for i=1:(length(x)-1)                          %calculation loop
    k1=F(x(i),y(i));
    k2=F(x(i)+0.5*h,y(i)+0.5*h*k1);
    k3=F(x(i)+0.5*h,y(i)+0.5*h*k2);
    k4=F(x(i)+h,y(i)+k3*h);
    y(i+1)=y(i)+(1/6)*(k1+k2+k3+k4)*h;         %main equation
end
figure, plot(x,y)
end


    
