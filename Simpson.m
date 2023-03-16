func=input('enter the function: ');%type function by this way "  inline('your function')    "
L_limit=input('enter lower value:');
U_limit=input('enter higher value:');
n=input('enter no. of intervals:');
h=(U_limit-L_limit)/n;
t = linspace(L_limit,U_limit,100);

if rem(n,2)==1
    fprintf('enter even no of intervals!!');
    n=input('enter no. of intervals:');
end;
sigmaodd=0;
sigmaeven=0;
for k=1:1:n-1
    x(k)=L_limit+k*h;
    y(k)=func(x(k));
    if rem(k,2)==1
        sigmaodd=sigmaodd+y(k);
    else
        sigmaeven=sigmaeven+y(k);
    end
end
value=(h/3)*(func(L_limit)+func(U_limit)+4*sigmaodd+2*sigmaeven);
fprintf('the result of integration = %f',value);
plot(t,func(t))