%system
b=[7.85;-19.3;71.4];
disp('Enter square matrix ');
a = input('Enter the number of rows & columns: ');
b=a;
for i=1:a    %square matrix coeffecients
    for j=1:b
        A(i,j)=input('Enter the elements: ');
    end
end
A=reshape(A,a,b)

p=[];
for k=1:a     %free terms
p(k)= input('Enter the free terms: ');
end
B=p'

%solution
n = input('Enter the number of iterations: ');
x=ones(1,n);
    for i=1:n
        sigma=0;
        for j=1:n 
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
        end
        x(i)=(1/A(i,i))*(B(i)-sigma);
    end
    
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f\n%f ',x);
