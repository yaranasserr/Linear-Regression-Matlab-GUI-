count = input('Enter the number of elements: ');
x=[];
Y=[];
syms X ;%Assign Symbolic Variables to MATLAB Variables
for i=1:count
    x_m= input('Enter the elements of x: ');
    x=[x x_m];
end
   for k=1:count
    y_m= input('Enter the elements of y: ');
    Y=[Y y_m];
end
 
    
%%
% example from lecture
%x = [0 1 2 3 4 5];
% Y =[1.98 0.6 0.25 0.1 0.027 0.011];
y=log(Y);

n = length(x);
t = linspace(min(x),max(x)+1,10); %time base vector for linear regression
x_2 = x.^2;                     %vector of x square
xy = x.*y;                      %vector of x multiply by y
A = [n sum(x);sum(x) sum(x_2)]; % Matrix of LHS
b = [sum(y) ; sum(xy)];         %vector b of RHS
a = linsolve(A,b); %Solve n equation in 2 unkown to get cofficient of line
co_1 = exp(a(1))
co_2 = a(2)
line = co_1.*exp(co_2.*t);%line Equation
eqn = co_1.*exp(co_2.*X)
figure;
plot(t,line)
hold on;
plot(x,Y,'o')