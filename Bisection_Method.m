clear
clc


prompt2 = 'Give an equation in x: \n';
str = input(prompt2,'s')  ;

prompt2 = 'Enter the start value! \n';
a = input(prompt2);
prompt3 = 'Enter the end value! \n';
b = input(prompt3);
f = inline(str,'x');
A = [];
B = [];
X = [];
Fa = [];
Fb = [];
Fx = [];
I = [];
RPE = [0];


prompt4 = 'Choose stop criterion!\n [a] - Number of iterations\n [b] - Maximum error bound \n ';
check1 = input(prompt4, 's');
if check1 == 'a' || check1 == 'A'
    prompt5 = 'Enter the number of iterations!\n';
    n = input(prompt5);

    i = 1;
    for i = 1 : n
        fa = feval(f, a) ;
        fb = feval(f, b) ;        
        x = (a + b) / 2;
        fx = feval(f, x) ;
        A = [A; a];
        B = [B; b];
        Fa = [Fa; fa];
        Fb = [Fb; fb];
        Fx = [Fx; fx];
        X = [X; x];
        if fa * fx < 0
            
            b = x;
            
            
        elseif fx * fb < 0
            
            a = x;
        
            
        end
        
        if i > 1 && i <= n
            rpe = 100 * abs((X(i) - X(i-1))/X(i));
            RPE = [RPE; rpe];
        end
        I = [I; i];
    end
      
elseif check1 == 'b' || check1 == 'B'
    prompt6 = 'Enter the maximum errors bound!\n';
    e = input(prompt6);
    i = 0;
    I = [];
    eps = Inf;
    while (eps > e)
        fa = feval(f, a);
        fb = feval(f, b);        
        x = (a + b) / 2;
        fx = feval(f, x);
        A = [A; a];
        B = [B; b];
        Fa = [Fa; fa];
        Fb = [Fb; fb];
        Fx = [Fx; fx];
        X = [X; x];
        
        if fa * fx < 0
            
            b = x;
                       
        elseif fx * fb < 0
            
            a = x;
                        
        end
        
        i = i + 1;
        I = [I; i];
        
        if i > 1
            rpe = 100 * abs((X(i) - X(i-1))/X(i));
            RPE = [RPE; rpe];
            eps = abs(X(i) - X(i-1));
        end
        
        
    end
end

T = table(I, A, X, B, Fa, Fx, Fb, RPE,'VariableNames',{'i', 'a', 'x', 'b', 'f(a)', 'f(x)', 'f(b)', 'R.P.E'}); 
disp(T)
t = linspace(min(a)-1,max(b)+1,10);
plot(t,str)
hold on;
plot(x,,'o')
