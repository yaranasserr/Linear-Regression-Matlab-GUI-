% x = [1 2 3 4 5 6];
% y =[2.1 3.8 5.3 7.6 10.2 11.9];
count = input('Enter the number of elements: ');
x=[];
y=[];
for i=1:count
    x_m= input('Enter the elements of x: ');
    x=[x x_m];
end
x
for i=1:count
    y_m= input('Enter the elements of y: ');
    y=[y y_m];
end
y
%%
xy=[];
for j=1:count
    xy_m = x(i)*y(i);
    xy=[xy xy_m];
end
n = length(x);
t = linspace(min(x)-1,max(x)+1,10); %time base vector for linear regression
x_2 = x.^2;                     %vector of x square
xy = x.*y;                      %vector of x multiply by y
A = [n sum(x);sum(x) sum(x_2)]; % Matrix of LHS
b = [sum(y) ; sum(xy)];         %vector b of RHS
a = linsolve(A,b); %Solve n equation in 2 unkown to get cofficient of line
line = a(1) + a(2).*t;          %line Equation
coff_1 = a(1)
coff_2 = a(2)
figure;
plot(t,line)
hold on;
plot(x,y,'o')

%%
%Statistics Data
Sr = 0;
St = 0;
for i = 1:n
Sr = Sr + (y(i)-a(1)-a(2).*x(i)).^2;
St = St + (y(i) - mean(y))^2;
end
r_2 = (St-Sr)/St;
r = sqrt(r_2) %Correlation Coefficient

