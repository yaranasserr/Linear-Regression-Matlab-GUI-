%step
h=input('Enter value of step size: '); 
%final time
tf=input('Enter value of end time: ');  
%initial condition
IC=input('Enter the initial value: '); 

dx=[];
t=[];
npoints=(tf)/h;
k=1;
t(k)=0;dx(k)=IC;
while(k <= npoints)
    dx(k+1)=dx(k)+h*f1(t(k),dx(k));
    t(k+1)=t(k)+h;
    k=k+1;
end

%curves
figure;
plot(t,dx);

function dxdt =f1(t,x)
% Equation #1, expressing dxdt 
dxdt = x.*t.^3-1.5.*x;
end
