%% Part I

load Gmat1.dat;
load Cmat1.dat;
load wmat1.dat;

G1 = spconvert(Gmat1);
C1 = spconvert(Cmat1);
w1 = spconvert(wmat1);

dec = [1,2,3,4,5,6,7,8,9];
z = [10*dec 100*dec 1e3*dec 1e4*dec 1e5*dec 1e6*dec 1e7*dec 1e8];

[mag_1, phase_1] = bode1(G1,C1,w1,z);

V6_1 = mag_1(6,:);

V6db_1 = 20*log10(V6_1);

figure(1)
semilogx(z,V6db_1)
grid on
title('Bode Plot of Common Emitter Amp Output')
xlabel('frequency (Hz)')
ylabel('voltage (dB)')

%% Part II

load Gmat2.dat;
load Cmat2.dat;
load wmat2.dat;

G2 = spconvert(Gmat2);
C2 = spconvert(Cmat2);
w2 = spconvert(wmat2);

[mag_2, phase_2] = bode1(G2,C2,w2,z);

V6_2 = mag_2(6,:);

V6db_2 = 20*log10(V6_2);

figure(2)
semilogx(z,V6db_2)
grid on
title('Bode Plot of Cascode Amp Output')
xlabel('frequency (Hz)')
ylabel('voltage (dB)')