function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition estimates the root of a given function

%Inputs
%   func- the function being evaluated
%   xl- the lower guess
%   xu- the upper guess
%   es- the desired relative error(default 0.0001%)
%   maxiter- the number of iterations desired(default 200)
%Outputs
%   root- the estimated root location
%   fx- the function evaluated at the root location
%   ea- the approximate relative error(%)
%   iter- how many iterations were performed

%establish default values for the variables maxiter and es
if nargin<5||isempty(maxiter)
    maxiter = 200;
end
if nargin<4||isempty(es)
    es = 0.0001;
end
%tell the user that 3 or more inputs are needed for the function to run
if nargin < 3
    error('at least 3 inputs needed')
end
%initially define variables
f=func;
ea=100;
old=0;
iter=0;
%check to see if the sign changes within the bracket
%if it does not, the product of the two functions should be positive
if func(xl)*func(xu)>0
    error('no roots found')
end
%allow the function to run while the error is too large, the signs of
%the functions continue to change, and while the number of iterations
%is less than the max iterations
while ea>es && func(xl)*func(xu)<0 && iter<=maxiter
    iter=iter+1;
    root=xu-((f(xu)*(xl-xu))/(f(xl)-f(xu)));    
    ea=abs(root-old)/root*100;
    old=root;
    if func(root)*func(xl)<0
        xu=root;
    else
        xl=root;
    end
end
%define fx as the function of the found root
%display the values of the output variables
fx=func(root);
disp(double(root))
disp(double(fx))
disp(double(ea))
disp(double(iter))
end
