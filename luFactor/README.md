# luFactor
LU Factorization is a method of decomposing matrices into an upper matrix and lower matrix that can be used to manually calculate inverse 
matrices.
## How it Works
When given a coefficient matrix [A], LU Factorization uses Gauss elimination to eliminate components of the matrix using forward 
elimination to create the [U] matrix. After forward elimination, the last equation can be solved for one unknown value and that value can be used in backwards 
subsitution to solve for the rest of the values manually. The values used to eliminate each element are then recorded 
into the [L] matrix which can be used to solve for the inverse matrix. Additionally, this algorithm tracks where pivotting is used to avoid
the complications of dividing by zero or of subtracting two very similar values.
### Details
Initially, the algorithm addresses the first column of the matrix and pivots the rows to have the value with the greatest magnitude 
at the top of the matrix. From there, it places the remaining rows in decreasing order based on the magnitudes of their first element.
The elements are then eliminated by multiplying the element intended to be eliminated by the value with greatest magnitude in that column
and subtracting that product from the row with the element intended to be eliminated. This process is repeated through each column of the
matrix while the products used in the elimination process are recorded in the [L] matrix and the [A] matrix is transformed into the [U] matrix.
The pivot matrix is just an identity matrix that switches along with the rows as they are placed in decreasing order throughout the steps.
### Inputs
* A- coefficient matrix
### Outputs
* L- lower triangular matrix
* U- upper triangular matrix
* P- pivot matrix
## Limitations
This algrithm only works for square matrices, meaning that the number or rows must equal the number of columns. Additionally, this algorithm
does not work for a 1x1 matrix.
