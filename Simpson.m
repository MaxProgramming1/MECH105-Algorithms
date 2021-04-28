function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated


%Solving for the length of the y and x matrix.
[z,xlength] = size(x);
[m,ylength] = size(y);


%Checking if both matrices are the same size.
if ylength ~= xlength
    error('Inputs do not have the same size')
end

%Making sure that the matrix is not just one value.
if xlength == 1
    error('A minimum of two values is required.')
end

%For loop solving to see if the matrix has equal spacing.
for k = 2:xlength
    
    before = k-1;
    
    value = x(1,k) - x(1,before);
    
    if k >= 3
        if after ~= value
            error('The matrix is not equally spaced')
        end
    end
    after = value;
end

%Define x0 since it is a universal constant.
x0 = y(1);

%Segment size depending on even or odd number of segments exists.
segmentsEven = xlength - 1;
segmentsOdd = segmentsEven - 1;

%For the case that only two values exist, we do just Trapezoidal.
if xlength == 2
    
    warning('Using trapezoidal rule')
    
    I = (x(xlength) - x(1))*(y(xlength)+y(1))/2;
    
else
    
    %Need to define the value of both as zero. They will store the even and
    %odd value later.
    xOdd = 0;
    xEven  = 0;
    
    %If statement that solves for a remainder. Determines if even or odd
    %number of segments.
    
    if rem(segmentsEven,2) ~= 0
        
        %Telling the user that trap and simpsons is being used.
        warning('Using 1/3 Simpsons and trapezoidal rule')
        
        %Defining x2 and h variable values.
        x2 = y(segmentsEven);
        h = x(segmentsEven)-x(1);
        
        %For loop that sums up the odd values in the matrix.
        for z = 2:2:segmentsOdd-1
            
            xOdd = xOdd + y(z);
            
        end
       
        %For loop that sums the even values of the matrix.
        for z = 3:2:segmentsOdd-2
            
            xEven = xEven + y(z);
            
        end
        
        %Putting it all together and solving for the vlaue of simpsons.
        I_simpsons = (h/(3*segmentsOdd))*(x0+4*xOdd+2*xEven+x2);
        
        %Solving for trapezoidal.
        I_trap = (x(xlength) - x(segmentsEven))*(y(xlength)+x2)/2;
        
        %Adding them together for final integral value.
        I = I_simpsons + I_trap;
     
    %For the case that we only need to do simpsons.    
    else
        
        %For loop to solve for the odd value summation.
        for z = 2:2:segmentsEven
            
            xOdd = xOdd + y(z);
            
        end
        
        %For loop solving for the even value summation.
        for z = 3:2:segmentsEven
            
            xEven = xEven + y(z);
            
        end
        
        %Defining x2 and h.
        x2 = y(xlength); 
        h = x(xlength)-x(1);
        
        %Solving for the integral.
        I = (h/(3*segmentsEven))*(x0+4*xOdd+2*xEven+x2);
    end
     
end

end