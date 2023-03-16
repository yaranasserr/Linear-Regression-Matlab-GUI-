count = input('Enter the number of elements: ');
X=[];
Y=[];
%syms X ;%Assign Symbolic Variables to MATLAB Variables
for i=1:count
    x_m= input('Enter the elements of x: ');
    X=[X x_m];
end
   for k=1:count
    y_m= input('Enter the elements of y: ');
    Y=[Y y_m];
   end
% X=[2.5 3.5 5 6 7.5 10 12.5 15 17.5 20]  
%Y=[5 3.4 2 1.6 1.2 0.8 0.6 0.4 0.3 0.3]
y=log10(Y);
x=log10(X);
sigmax=sum(x);
sigmay=sum(y);
sigmaxsquared=sum(x.*x);
N=length(x);
t = linspace(min(X),max(X)+1,10);
xy=zeros(N,1);
xy=x.*y;
sigmaxy=sum(xy);

E1=[N sigmax ;sigmax sigmaxsquared];
E2=[sigmay ; sigmaxy ]
answer = linsolve(E1,E2);
a0=answer(1)
a1=answer(2)
a=10^a0;
b=a1;
line = a.*t.^(b);

figure;
plot(t,line);
hold on;
plot(X,Y,'o')





