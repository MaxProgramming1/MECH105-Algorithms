
# False Position

## Summary
- False Position is a root finding method that solves for xr.
- To do so, a secant line is created between two points, once with a positive y value and one with a negative.
- Then the xr value is calculated as the poiunt where the secant line crosses the x axis. 
- A comparison is made between xr and the two ponts. Whichever matches the xr's y value is set as the new xr.
- This process is then repeated until the correct error is achieved or max iterations is acheived. 
## Inputs
1. (func) The function is first.
2. (xl) The left estimate.
3. (xu) the right estimate
4. (es) The error stopping criterium in percent.
5. (maxit) The max number of iterations.
6. (varargin) Other variablest that may effect the result.
## Outputs
1. (root) The xr value or the root
2. (fx) The functional value at xr.
3. (ea) The stopped at error below the stopping criterium created by the user.
4. (iter) The iteration, how many times false position was applied.




