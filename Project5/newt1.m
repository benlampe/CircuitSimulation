function [x,iter]=newt1(x0,e,G)

F=zeros(8,1);J=zeros(8,8);
VTN=1;VTP=-1;k=2e-5;

i=1;
x=x0;

while(norm(F,inf)>e)|(i==1)
    F = G*x;
    F(6) = F(6) - 5;
    J = G;
     %M1, NMOS, D=3, G=1, S=0
        VGS = x(1);
        VDS = x(3);
        if VGS >= VTN
            if VDS >= VGS - VTN
                IN=0.5*k*(VGS-VTN)^2;
                F(3) = F(3) + IN;
                J(3,1) = J(3,1) + k*(VGS-VTN);
            else
                IN=k*((VGS-VTN)*VDS-0.5*VDS^2);
                F(3) = F(3) + IN;
                J(3,1) = J(3,1) + k*VDS;
                J(3,3) = J(3,3) + k*((VGS-VTN)-VDS);
            end
        end
        
        %M2, PMOS, D=3, G=1, S=4
        VGS = x(1)-x(4);
        VDS = x(3)-x(4);
        if VGS <= VTP
            if VDS < VGS - VTP
                IP=0.5*k*(VGS-VTP)^2;
                F(3) = F(3) - IP;
                F(4) = F(4) + IP;
                J(3,1) = J(3,1) - k*(VGS-VTP);
                J(3,4) = J(3,4) + k*(VGS-VTP);
                J(4,1) = J(4,1) + k*(VGS-VTP);
                J(4,4) = J(4,4) - k*(VGS-VTP);
            else
                IP = k*((VGS-VTP)*VDS - .5*VDS^2);
                dIP1 = k*VDS;
                dIP3 = k*(x(1)-x(3)-VTP);
                dIP4 = -k*(VGS-VTP);
                F(3) = F(3) - IP;
                F(4) = F(4) + IP;
                J(3,1) = J(3,1) - dIP1;
                J(3,3) = J(3,3) - dIP3;
                J(3,4) = J(3,4) - dIP4;
                J(4,1) = J(4,1) + dIP1;
                J(4,3) = J(4,3) + dIP3;
                J(4,4) = J(4,4) + dIP4;
            end
        end
        
        %M3, NMOS, D=3, G=2, S=0
        VGS = x(2);
        VDS = x(3);
        if VGS >= VTN
            if VDS >= VGS - VTN
                IN=0.5*k*(VGS-VTN)^2;
                F(3) = F(3) + IN;
                J(3,2) = J(3,2) + k*(VGS-VTN);
            else
                IN=k*((VGS-VTN)*VDS-0.5*VDS^2);
                F(3) = F(3) + IN;
                J(3,2) = J(3,2) + k*VDS;
                J(3,3) = J(3,3) + k*((VGS-VTN)-VDS);
            end
        end
        
        %M4, PMOS, D=4, G=2, S=5
        VGS = x(2) - x(5);
        VDS = x(4) - x(5);
        if VGS <= VTP
            if VDS < VGS - VTP
                IP=0.5*k*(VGS-VTP)^2;
                F(4) = F(4) - IP;
                F(5) = F(5) + IP;
                J(4,2) = J(4,2) - k*(VGS-VTP);
                J(4,5) = J(4,5) + k*(VGS-VTP);
                J(5,2) = J(5,2) + k*(VGS-VTP);
                J(5,5) = J(5,5) - k*(VGS-VTP);
            else
                IP = k*((VGS-VTP)*VDS - .5*VDS^2);
                dIP2 = k*VDS;
                dIP4 = k*(x(2)-x(4)-VTP);
                dIP5 = -k*(VGS-VTP);
                F(4) = F(4) - IP;
                F(5) = F(5) + IP;
                J(4,2) = J(4,2) - dIP2;
                J(4,4) = J(4,4) - dIP4;
                J(4,5) = J(4,5) - dIP5;
                J(5,2) = J(5,2) + dIP2;
                J(5,4) = J(5,4) + dIP4;
                J(5,5) = J(5,5) + dIP5;
            end
        end
        
        y =-J\F;
        x=x+y;
        i=i+1;
end
iter = i-1;
end