function [mag, phase] = bode1(G,C,w,z)
mag = []
phase = []
for i=1:length(z)
    omega = 2*pi*z(i)
    A = G + j*omega*C
    x = A\w
    mag = [mag abs(x)]
    phase = [phase angle(x)]
end
end