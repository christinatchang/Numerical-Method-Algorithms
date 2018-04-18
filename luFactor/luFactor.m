function [L,U,P] = luFactor(A)
%luFactor determines the LU Factorization of a square matrix
%   Inputs
%A- coefficient matrix
%   Outputs
%L- lower triangular matrix
%U- upper triangular matrix
%P- the pivot matrix

%distinguish the dimensions of the matrix
%set the number of rows and row and number of columns as column
[row,column]=size(A);
%initially makes L a zero matrix and P an identity matrix
L=zeros(row);
P=eye(row);
U=A;
%make sure user is inputting a square matrix
if row~=column
    error 'input must be a coefficient square matrix'
end
if row==1 && column==1
    error 'input cannot be a 1x1 matrix'
end
%set j and i to run through all columns and rows
    for j=1:column
        for i=j:row
%breaks code if i=row because then k will exceed matrix dimensions
            if i==row          
                break
            end
%k runs through all the rows and ends up being the row that is pivoted
%if pivoting is required
            for k=i+1:row
                if max(abs(U(i:row,j)))== abs(U(i,j))
                    break
                elseif max(abs(U(i:row,j)))== abs(U(k,j))
%U, P, and L are all pivoted
                U([i k],i:column)=U([k i],i:column);
                P([i k],:)=P([k i],:);
                L([i k],:)=L([k i],:);
                end
            end
%if demoninator of elimination factor is 0, the loop ends
            if U(i,j) == 0
                break
            end
%gauss elimination
            for x=(i+1):row
                efactor=U(x,j)/U(i,j);
                L(x,j) = efactor;
                erow = efactor * U(i,:);
                U(x,:)= U(x,:) - erow;
            end
        end
    end
%sets L as the elimination factors plus an identity matrix
L_ident=eye(row,column);
L=L+L_ident;
%displays matrices L, U, and P
display(L)
display(U)
display(P)
end


