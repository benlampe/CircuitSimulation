G = zeros(8,8);
E = zeros(8,8);

G(1,7) = 1; G(7,1) = 1;
G(2,8) = 1; G(8,2) = 1;
G(5,6) = 1; G(6,5) = 1;

E(1,1) = 6e-15; E(1,3) = -2e-15; E(1,4) = -2e-15;
E(2,2) = 6e-15; E(2,3) = -1e-15; E(2,4) = -1e-15; E(2,5) = -2e-15;
E(3,1) = -2e-15; E(3,2) = -1e-15; E(3,3) = 2.53e-13;
E(4,1) = -2e-15; E(4,2) = -1e-15; E(4,4) = 3e-15;
E(5,2) = -2e-15; E(5,5) = 2e-15;

VDD = [0,5,0,1e-9,1e-9,11e-9,12e-9];
VG1 = [0,5,0,1e-9,1e-9,1e-7,2e-7];
VG2 = [0,0,0,1e-9,1e-9,1e-7,2e-7];
[tout1, out1, iter1] = nor(10e-9,2e-10,E,G,VDD);

x0=out1(:,size(out1,2))

[x,iter2]=newt1(x0,1e-9,G)

[tout3,out3,iter3]=nordc(1.5e-7,2e-10,E,G,VG1,VG2,x);

V_out3 = out3(3,:);
V_out4 = out3(4,:);

figure(1)
plot(tout3,V_out3)
grid on
title('Transient analysis of V3')
xlabel('time')
ylabel('voltage (V)')


figure(2)
plot(tout3,V_out4)
grid on
title('Transient analysis of V4')
xlabel('time')
ylabel('voltage (V)')

