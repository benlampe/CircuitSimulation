load Gmat.dat
load Cmat.dat
load wmat.dat

G = spconvert(Gmat)
C = spconvert(Cmat)
w = spconvert(wmat)

dec = [1,2,3,4,5,6,7,8,9]
z = [.1*dec dec 10*dec 100*dec 1000]

[mag, phase] = bode1(G,C,w,z)

V1 = mag(1,:)
V2 = mag(2,:)
V3 = mag(3,:)

V1db = 20*log10(V1)
V2db = 20*log10(V2)
V3db = 20*log10(V3)

figure(1)
semilogx(z,V1db)
grid on
title('Bode Plot of V1')
xlabel('frequency (Hz)')
ylabel('voltage (dB)')

figure(2)
semilogx(z,V2db)
grid on
title('Bode Plot of V2')
xlabel('frequency (Hz)')
ylabel('voltage (dB)')

figure(3)
semilogx(z,V3db)
grid on
title('Bode Plot of V3')
xlabel('frequency (Hz)')
ylabel('voltage (dB)')

figure(4)
semilogx(z,phase(1,:))
grid on
title('Phase Plot of V1')
xlabel('frequency (Hz)')
ylabel('phase angle (rad)')

figure(5)
semilogx(z,phase(2,:))
grid on
title('Phase Plot of V2')
xlabel('frequency (Hz)')
ylabel('phase angle (rad)')

figure(6)
semilogx(z,phase(3,:))
grid on
title('Phase Plot of V3')
xlabel('frequency (Hz)')
ylabel('phase angle (rad)')
