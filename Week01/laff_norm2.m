function [alpha] = laff_norm2( x )
    % dots the x with itself to get the length of x
    tmp = laff_dot(x, x) ;
    if(tmp == 'FAILED')
        alpha = tmp;
        return
    else
        alpha = tmp ^ (1/2);
        return
    end