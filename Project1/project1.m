%Load graph data
load pwsys.dat
A = spconvert(pwsys)

%% Part 1: Unpermuted matrix
figure(1)
spy(A)
title('Unpermuted matrix')
figure(2)
[La,Ua] = lu(A)
spy(La+Ua)
title('LU factorization of unpermuted matrix')

%% Part 2: Permuted by hand
figure(3)
p = [30,31,32,33,34,20,19,35,36,37,38,28,29,...
      1, 3, 4, 5, 7, 6, 8, 9,10,12,11,13,15,...
     21,22,23,24,16,14,18,25,26,27, 2,17,39]
B = A(p,p)
spy(B)
title('Matrix permuted by hand')
figure(4)
[Lb,Ub] = lu(B)
spy(Lb+Ub)
title('LU factorization of matrix permuted by hand')

%% Part 3: Permuted by MATLAB
figure(5)
q = symamd(A)
C = A(q,q)
spy(C)
title('Matrix permuted by MATLAB')
figure(6)
[Lc,Uc] = lu(C)
spy(Lc+Uc)
title('LU factorization of matrix permuted by MATLAB')

%% Part 4: Test of Pulse Function
figure(7)
a = [1,2,0.3,0.1,0.05,1,2]
h = 0.01
time = h
out = []
tout = []
while time < 5
    v = pulse(a,time)
    out = [out,v]
    tout = [tout,time]
    time = time+h
end

plot(tout,out)
axis([0 5 0 3])
xlabel('time')
ylabel('voltage')
title('Pulse Function')
