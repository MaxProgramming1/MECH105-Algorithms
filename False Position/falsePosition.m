function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%This funtion solves for the root of a given funtion using the falsePosition Method.
%Inputs:
%
%func- the function to be analyzed by the code
%xl- the left bound
%xr- the right bound
%es- the percent error we are looking for. How close we want to get to the root.
%maxit- the maximum number of iterations. A cap as to how far we want to go independent of the es.
%varargin- any bonus values that should be incorporated in solving the function.
%Outputs:
%
%root- the root that was solved for using the input criteria.
%fx- the cuntional value at that root.
%ea- the approximate error solved for using the es criteria.
%iter- the number of iterations the function falePosition was iterated to solve for the root given the criteria.


%If statement that presents an error if the teo parameters have the same f_xl and f_xu sign.
if func(xl)*func(xu) > 0
    error('There must be a difference of sign to solve with false position.')

else
    %if and elseif statement for the cases that defaults are needed to get the code to work.    
    if nargin <= 4
        maxit = 200;
        es = 0.0001;
        
    elseif nargin < 5
        maxit = 200;

    end
    
    %defining the iteration variable and giving a value to error to get the while loop to initiate.
    iter = -1;
    
    ea = 100;
    
    %While loop that terminates once we are near the error defined by the user or at the max number of iterations.
    while ea >= es && iter < maxit
        %Defining the old variable values before manipulating them.
        xl_old = xl;
        xu_old = xu;
        
        %Solving for the functional values of the three parameters.
        f_xl = func(xl,varargin{:});
        
        f_xu = func(xu,varargin{:}); 

        %Solve for the root.
        root = xu-(f_xu*(xl-xu))/(f_xl-f_xu);
      
        f_xr = func(root,varargin{:});
        
        %Comparing the functional value of xl to root, if they have the same sign, we give xl to value of xr. 
        %If this is not the case we give the value of root to xu.
        if f_xl*f_xr > 0
            xl = root;
            %Solving for the stopping criterium.
            ea = abs((xl - xl_old)/xl*100);
        else
            xu = root;
            %solve for the stopping criterium.
            ea = abs((xu - xu_old)/xu*100);
            
        end
        
        %Keep track of number of loop iterations.
        iter = iter + 1;
        
        %Defining what fx is for the outputs.
        fx = func(root);
    end
end

root
fx
ea
iter
end


