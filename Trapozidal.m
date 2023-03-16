f=@(x) (sin(x));   
 a = input('Enter lower limit, a: ');
 b = input('Enter upper limit, b: ');
 n = input('Enter no. of subintervals, n: ');

 h=(b-a)/n;
 s0=f(a)+f(b);
 s1=0;
 for i=1:n-1
    x=a+i*h;
    s1=s1+f(x);
 end
 s=(h/2)*(s0+2*s1);
 fprintf('The approximate integral is: %11.8f\n\n',s);