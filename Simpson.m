function [I] = Simpson(x,y)
%Simpson is a function that will integrate experimental data using
%Simpson's 1/3 rule with the application of the trapezoidal rule if needed.
%   Inputs
%x- independent experimental data set
%y- dependent experimental data set
%   Outputs
%I- integral value
I=0; %initially define variable I
if nargin~=2 %make sure there are only two inputs
    error ('two data sets needed') %if there are not two inputs, throw error
end
if isvector(x)~= 1 || isvector(y)~= 1 %make sure inputs are vectors
    error ('inputs must be vectors or scalars') %if inputs are not vectors, throw error
end
if iscolumn (x)%in case data is given as a column vector
    x = x.';%transpose to make it into a row vector
end
if iscolumn (y)
    y = y.';
end
if length(x)~= length(y)%make sure inputs are the same length
    error('inputs x and y must be same length')%if inputs are not the same length, throw error
end
if length(x) < 3 %make sure user has inputed data with at least 3 entries
    error ('inputs must have at least 3 components') %if there are less than 3 entries, throw error
end
format short %format short to avoid roundoff error
if range(diff(x))>= 10^-5 %check to see if entries are evenly spaced
    error('x inputs must be equally spaced') %if entries are unevenly spaced, throw error
end
format long %format long again to keep precision
if mod(length(x),2)==0 %checks to see if there is an even or odd number of entries
    warning('trapezoidal rule must be used on last interval')%warns user that trapezoidal rule will be used with even number of entries
    for num=1:2:length(x)-3%for loop that runs through data and calculates the integral using Simpson's 1/3 rule
        I = ((x(3)-x(1))/6)*(y(num)+4*y(num+1)+y(num+2))+ I;
    end
    trap = (y(end)+ y(end-1))/2*(x(2)-x(1));%trapezoidal rule formula
    I = I + trap;%makes integral equal to Simpson's rule plus trapezoidal rule
else %if the number of entries is odd
    for num = 1:2:length(x)-2 %calcules integral using Simpson's 1/3 rule
        I = (x(3)-x(1)/6)*(y(num)+4*y(num+1)+y(num+2))+ I;
    end
end
end

