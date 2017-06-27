G = zeros(10,10);
G(1,1) = 3.75e-4; G(1,2) = -2.5e-4;
G(2,1) = -2.5e-4; G(2,2) = 3.056e-4; G(2,9) = -5.556e-5;
G(3,3) = 3.03e-4;
G(5,5) = 1.667e-4; G(5,9) = -1.667e-4;
G(6,6) = 1; G(7,7) = 1; G(8,8) = 1;
G(9,2) = -5.556e-5; G(9,5) = -1.667e-4; G(9,9) = 2.223e-4; G(9,10) = 1;
G(10,9) = 1;

x0 = [4;6;3.3;5.3;9;0;0;0;15;-1.5e-3];
[x,iter] = bjtdc(x0,G,1e-9)
