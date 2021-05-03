function [L, U, P] = luFactor(A)
% luFactor(A)
% 	LU decomposition with pivoting
% inputs:
% 	A = coefficient matrix
% outputs:
% 	L = lower triangular matrix
% 	U = upper triangular matrix
%       P = the permutation matrix

%Want to understand the size of the matric to ensure it has same dimensions
%and to enable us to adhere to any size matrix inputted by the user.
[r,c] = size(A);
if r~=c
    error('Matrix must have same size rows and columns')
end

%Setting up the L and P matrices and putting the band of ones into it soon
%after.
L = zeros(r,c);
P = zeros(r,c);

for z = 1:r
    P(z,z) = 1;
end

for z = 1:r
    L(z,z) = 1;
end

%Storing the matrices into another matrix so it is much easier to
%manipulate for later.
U = A;
P_old = P;

%This was hard to tackle, but a for loop for column allows us to solve for
%the zeros in the upper triangular matrix.
for column = 1:c-1
    
    %Solving for the largest value in the first column in the matrix
    placeHolder = max(abs(U(column:r,column)));
    
    
    %A for loop that searches for the largest value and placing it into
    %highest row of iteration.
    for i = column:r
        if placeHolder == abs(U(i,column))
            
            %Replacing the highest row of that iteration with the largest value row.
            U(column,:)= A(i,:);
            U(i,:) = A(column,:);
            
            %Must reflect that change in the P matrix so we do the same for it.
            P(column,:)= P_old(i,:);
            P(i,:) = P_old(column,:);
           
        end
    end
    
    %For loop to go through the rows starting at row 1 plus the cokumn.
    %This is to ensure we evaluate the correct values when solving for the
    %factor.
    for row = 1+column:r
        
        %Solving for the factor.
        Factor = U(row,column)/U(column,column);
        
        %Placing the factor value into the L matrix.
        L(row,column) = Factor;
        
        %Rewriting the values for the U matrix.
        U(row,:) = -Factor*U(column,:) + U(row,:);
     

        
    end
    %Converts A to the New U value to allow pivoting to work.
    A=U;
    P_old = P;
end


end
