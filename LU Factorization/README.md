
# LU Factorization

## Summary
- This is a numerical method that solves a series of equations.
- Quickly analyzes and outputs the answer in the form of three matrices.
- Has pivoting built in.
- Does not fully work.

## Input
1. (A) A singular matrix filled with the coefficients of each value of each equation.
## Output
1. (L) The first output matrix is an L matrix. This contains the coefficents used to eliminate each x value by iteration.
2. (U) A matrix that stores the post manipulated values of the A matrix. Can use backward cancellation to solve for each x value.
3. (P) A matrix that portrays pivoting. Any pivoting that occurred will reordr the matrix and shift the ones in each row.




