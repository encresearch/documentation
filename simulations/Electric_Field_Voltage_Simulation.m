%%Electric Field Equation
wp=1.27E-7;                                     %positive side depletion width in m
wn=2.6E-7;                                     %negative side depletion width in m
ND=1E16;                                        %concentration of donor dopant in cm^-3
NA=2E16;                                        %concentration of acceptor dopant in cm^-3
%Note: wp/wn=ND/NA
e=1.6E-19;                                      %elementary charge in C
epsilon0=8.85E-12;                              %permittivity of free space in F*m^-1
epsilonr=11.9;                                  %relative permittivity of silicon
epsilon=epsilon0*epsilonr;                      %permittivity of semiconductor in F*m^-1
x1=-wp:.1E-7:0;                                 %x values of p side
x2=0:.1E-7:wn;                                  %x values of n side
E1=(-e*NA/epsilon)*(x1+wp);                     %for -wp<x<0
E2=(e*ND/epsilon)*(x2-wn);                      %for 0<x<wn
xfinal=[x1,x2];                                 %vector combining x1 and x2
Efinal=[E1,E2];                                 %vector combining E1 and E2
figure(1), plot(xfinal,Efinal), xlabel('x'), ylabel('E(x)'), title('Figure 15: Electric Field v Position of an Abrupt P-N Junction')
%%Voltage Equation
w0=wp+wn;                                       %total depletion width in m
V0=(e/(2*epsilon))*(w0^2)*((NA*ND)/(NA+ND));    %built in voltage in V
V1=((e*NA)/(2*epsilon))*(x1+wp).^2;             %for -wp<x<0
V2=V0-(((e*ND)/(2*epsilon))*(x2-wn).^2);        %for 0<x<wn
Vfinal=[V1,V2];                                 %vector combining V1 and V2
figure(2), plot(xfinal,Vfinal), xlabel('x'), ylabel('V(x)'), title('Figure 16: Voltage v Position of an Abrupt P-N Junction')
