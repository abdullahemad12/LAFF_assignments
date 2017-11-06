
% Copyright 2017 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Abdullah Emad
%                abdullahem1997@hotmail.com

function [ C_out ] = Gemm_unb_var2_unb( A, B, C )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ CT, ...
    CB ] = FLA_Part_2x1( C, ...
                         0, 'FLA_TOP' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ C0, ...
      c1t, ...
      C2 ] = FLA_Repart_2x1_to_3x1( CT, ...
                                    CB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
        c1t =  laff_gemv( 'Transpose', 1, B, a1t, 1, c1t);
    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ CT, ...
      CB ] = FLA_Cont_with_3x1_to_2x1( C0, ...
                                       c1t, ...
                                       C2, ...
                                       'FLA_TOP' );

  end

  C_out = [ CT
            CB ];

return
