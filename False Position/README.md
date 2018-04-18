# False Position
The False Position method is a closed method that can be used to determine the root of a function. Since it is a closed method, it requires two guesses that bracket the root. Although closed methods might take a little more computational time, they *always* work.
## How it Works
The idea behind the False Position method is to take two points on the function and connect them with a straight line. Where the lines cross the x-axis is the guess for the root. From there, the upper and lower bounds are tested with the root to find where a sign change occurs and the two points between which the sign change occurs become the new upper and lower bounds.
### Equation
x<sub>r</sub> = x<sub>u</sub>-( ( f(x<sub>u</sub>) * (x<sub>l</sub>-x<sub>u</sub>) ) / ( f(x<sub>l</sub>) - f(x<sub>u</sub>) ) )
### Inputs
* func- the function being evaluated
* x<sub>l</sub>- the lower guess
* x<sub>u</sub>- the upper guess
* e<sub>s</sub>- the relative error (default 0.0001%)
* maxiter- the number of iterations desired (default 200)
### Outputs
* root- the estimated root location
* f<sub>x</sub>- the function evaluated at the root location
* e<sub>a</sub>- the approximate relative error (%)
* iter- how many iterations were performed
## Limitations
The False Position algorithm will throw an error at the user if there are less than 3 inputs provided. Between 3 and 5 inputs will be accepted because there are default values for inputs e<sub>s</sub> and maxiter. Additionally, there will be an error if the user inputs a function that does not have a root. 
