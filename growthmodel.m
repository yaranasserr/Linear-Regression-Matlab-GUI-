% Y = 1/y
% • X = 1/x
% • a0 = 1/a
% • a1 = b/a
% growth model
count = input('Enter the number of elements: ');
X=[];
Y=[];
for i=1:count
    x_m= input('Enter the elements of x: ');
    X=[X x_m];
end
   for k=1:count
    y_m= input('Enter the elements of y: ');
    Y=[Y y_m];
end
 
    
%%
% example from lecture
% x 1 3 5 7 9
% y 0.85 1.4 1.73 1.68 1.96
y=1./Y;
x=1./X
n = length(x);
t = linspace(min(X),max(X)+1,10); %time base vector for linear regression
x_2 = x.^2;                     %vector of x square
xy = x.*y;                      %vector of x multiply by y
A = [n sum(x);sum(x) sum(x_2)]; % Matrix of LHS
b = [sum(y) ; sum(xy)];         %vector b of RHS
a = linsolve(A,b); %Solve n equation in 2 unkown to get cofficient of line
co_1 = 1./a(1)
co_2 =a(2)./ a(1)
%y=ax/b+x
line =(co_1.*t)./(co_2+t)  ;%line Equation

figure;
plot(t,line)
hold on;
plot(X,Y,'o')
