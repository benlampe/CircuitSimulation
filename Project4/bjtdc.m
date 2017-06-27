function [x, iter] = bjtdc(x0, G, cc)
F = zeros(10,1); J = zeros(10,10);
VT = 25.3e-3; BF = 100; BR = 1; IS = 1e-16;
i = 1;
x = x0;
while ((norm(F,inf) > cc)||(i==1))
    F = G*x;
    F(10) = F(10) - 15;
    J = G;
    
    ID1 = (IS/BR)*(exp((x(1)-x(4))/VT) - 1);
    F(1) = F(1) + ID1;
    F(4) = F(4) - ID1;
    J(1,1) = J(1,1) + (IS/(BR*VT))*exp((x(1)-x(4))/VT);
    J(1,4) = J(1,4) - (IS/(BR*VT))*exp((x(1)-x(4))/VT);
    J(4,1) = J(4,1) - (IS/(BR*VT))*exp((x(1)-x(4))/VT);
    J(4,4) = J(4,4) + (IS/(BR*VT))*exp((x(1)-x(4))/VT);
    
    ID2 = (IS/BF)*(exp((x(1)-x(3))/VT) - 1);
    F(1) = F(1) + ID2;
    F(3) = F(3) - ID2;
    J(1,1) = J(1,1) + (IS/(BF*VT))*exp((x(1)-x(3))/VT);
    J(1,3) = J(1,3) - (IS/(BF*VT))*exp((x(1)-x(3))/VT);
    J(3,1) = J(3,1) - (IS/(BF*VT))*exp((x(1)-x(3))/VT);
    J(3,3) = J(3,3) + (IS/(BF*VT))*exp((x(1)-x(3))/VT);
    
    Io1 = IS*(exp((x(1) - x(3))/VT) - exp((x(1) - x(4))/VT));
    F(3) = F(3) - Io1;
    F(4) = F(4) + Io1;
    J(3,1) = J(3,1) - (Io1/VT);
    J(3,3) = J(3,3) + (IS/VT)*exp((x(1)-x(3))/VT);
    J(3,4) = J(3,4) - (IS/VT)*exp((x(1)-x(4))/VT);
    J(4,1) = J(4,1) + (Io1/VT);
    J(4,3) = J(4,3) - (IS/VT)*exp((x(1)-x(3))/VT);
    J(4,4) = J(4,4) + (IS/VT)*exp((x(1)-x(4))/VT);
    
    ID3 = (IS/BR)*(exp((x(2)-x(5))/VT) - 1);
    F(2) = F(2) + ID3;
    F(5) = F(5) - ID3;
    J(2,2) = J(2,2) + (IS/(BR*VT))*exp((x(2)-x(5))/VT);
    J(2,5) = J(2,5) - (IS/(BR*VT))*exp((x(2)-x(5))/VT);
    J(5,2) = J(5,2) - (IS/(BR*VT))*exp((x(2)-x(5))/VT);
    J(5,5) = J(5,5) + (IS/(BR*VT))*exp((x(2)-x(5))/VT);
    
    ID4 = (IS/BF)*(exp((x(2)-x(4))/VT) - 1);
    F(2) = F(2) + ID4;
    F(4) = F(4) - ID4;
    J(2,2) = J(2,2) + (IS/(BF*VT))*exp((x(2)-x(4))/VT);
    J(2,4) = J(2,4) - (IS/(BF*VT))*exp((x(2)-x(4))/VT);
    J(4,2) = J(4,2) - (IS/(BF*VT))*exp((x(2)-x(4))/VT);
    J(4,4) = J(4,4) + (IS/(BF*VT))*exp((x(2)-x(4))/VT);
    
    Io2 = IS*(exp((x(2) - x(4))/VT) - exp((x(2) - x(5))/VT));
    F(4) = F(4) - Io2;
    F(5) = F(5) + Io2;
    J(4,2) = J(4,2) - (Io2/VT);
    J(4,4) = J(4,4) + (IS/VT)*exp((x(2) - x(4))/VT);
    J(4,5) = J(4,5) - (IS/VT)*exp((x(2) - x(5))/VT);
    J(5,2) = J(5,2) + (Io2/VT);
    J(5,4) = J(5,4) - (IS/VT)*exp((x(2) - x(4))/VT);
    J(5,5) = J(5,5) + (IS/VT)*exp((x(2) - x(5))/VT);
    
    y = -inv(J)*F;
    x = x+y;
    i = i+1;
end
iter = i-1;
end