%%Electric Field Equation
q=1.6E-19;                                               %elementary charge in C
eps0=8.85E-12;                                           %permittivity of free space in F/m
eps=9.6;                                                 %relative permittivity of MgO
n=0;                                                     %concentration of negative species in m^-3
p1=10^24;                                                %concentration of first trial positive holes in m^-3
p2=10^23;                                                %concentration of second trial positive holes in m^-3
x1=0:0.1E-8:6.3E-8;                                      
x2=0:0.1E-8:2.12E-8;
E1=(-q/(eps0*eps))*(p1-n).*x2+(4E7);                     %Electric field versus crystal depth for first trial
E2=(-q/(eps0*eps))*(p2-n).*x1+(1.2E7);                   %Electric field versus crystal depth for second trial
figure(1)
plot(x2,E1)
hold on
plot(x1,E2), xlabel('depth'), ylabel('Electric Field'), title('Figure 20: Electric Field v Depth'), legend('10^2^4 m^-3', '10^2^3 m^-3')
hold off

%%Voltage Equation
x4=0:0.1E-8:6E-8;
x3=0:0.1E-8:2.2E-8;
V1=(q/(eps0*eps))*(p1-n).*((x3.^2)/2)-4E7.*x3+0.43;     %Voltage versus crystal depth for first trial
V2=(q/(eps0*eps))*(p2-n).*((x4.^2)/2)-1.2E7.*x4+0.43;   %Voltage versus crystal depth for second trial   
figure(2)
plot(x3,V1)
hold on
plot(x4,V2), xlabel('depth'), ylabel('Voltage'), title('Figure 21: Voltage v Depth'), legend('10^2^4 m^-3', '10^2^3 m^-3')
hold off