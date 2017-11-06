function [ x_out ] = laff_scal(alpha ,x)
    
    % extracts the size of x and y
    
    [m_x, n_x] = size(x);
    
    % x is not a one dimensional vector
    if ((m_x ~= 1 && n_x ~= 1) || isscalar(x))
       x_out = 'FAILED';
       return
    end
    % makes sure alpha is a scalar
    if(~(isscalar(alpha)))
        x_out = 'FAILED';
        return
    end
    
    % x is row vector
    if(m_x == 1)
        for i = 1:n_x
            x(1,i) = x(1,i) * alpha; 
        end
     % x is column vector
    else
         for i = 1:m_x
            x(i,1) = x(i,1) * alpha; 
         end 
    end
print("result")
print(x)
x_out = x;
return 
end
    
    