# Simpson
The Simpson Methods are used to numerically evaluate integrals for 2<sup>nd</sup> or 3<sup>rd</sup> order polynomials. There are two variations of the Simpson's rule: Simpson's 1/3 Rule and Simpson's 3/8 Rule. Simpson's 1/3 rule is ideal when there are an even number of segments while Simpson's 3/8 rule is ideal for an odd number of segments. This algorithm uses Simpson's 1/3 rule and utilizes the trapezoidal rule if there are an odd number of segments.
## How it Works
Simpson's 1/3 rule connects an odd number of evenly spaced points along the function to create an even number of segments under a parabola. The area under the parabola is then taken as the estimate for the integral.
### Equation
I = (b-a) * ( (f(x<sub>0</sub>) + 4 * f(x<sub>1</sub>) + f(x<sub>2</sub>) / b )
### Inputs
* x- independent experimental data set
* y- dependent experimental data set
### Outputs
* I- integral value
## Limitations
The Simpson algorithm only works when 2 experimental data sets are inputted. Additionally, the two inputs must be vectors or columns of the same length with more than 3 data values. The independent experimental data set must also be equally spaced in order for Simpson's rule to apply.
