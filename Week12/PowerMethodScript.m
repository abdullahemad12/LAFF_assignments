format long

% Choose the maximum number of iterations of the power method that will be performed. 
k = 20;

% Choose the eigenvalues
disp( 'input a vector of eigenvalues. e.g.: [ 4; 3; 2; 1 ]   ' );
eigs = input('');

n = size( eigs,1);

% Make sure that the first entry is equal to largest in absolute value
[ eig_max ] = max( abs( eigs( 2:n ) ) );
if eig_max > abs( eigs( 1 ) )
    abort( 'The first entry should be equal to largest in absolute value.' );
end

% Create a diagonalizable matrix A with eigenvalues given by eigs and
% matrix V the columns of which are the corresponding eigenvectors,
% normalized to have length 1.
[ A, V ] = CreateMatrixForEigenvalueProblem( eigs )

% extract the number of eigenvalues
n = size( eigs, 1 );

% Print A
disp( 'Matrix A:' )
disp( A );

% Print V
disp( 'Matrix of eigenvectors:' );
disp( V );

% Print eigenvalues
disp( 'Eigenvalues:' );
disp( eigs );

% Create a random initial vector x, and normalize it to have unit length
x = rand( n, 1 );
x = x / norm( x );

disp( 'Initial random vector:' )
disp( x )

disp( 'iteration' );
disp( 0 );
    
% Print the length of the component of x orthogonal to the eigenvector
% associated with the largest eigenvalue (in magnitude)
disp( 'The length of the component of x orthogonal to V( :, 1 ) is ' );
disp( norm( x - x' * V( :, 1 ) * V( :, 1 ) ) );
    
% Compute the Rayleigh quotient (no need to divide by x' * x since x is
% of unit length)
disp( 'Rayleigh quotient:' );
disp( x' * A * x );

cont = 1;

% Perform at most k steps of the power method
for i=1:k
    cont = input( 'continue? (0=NO, return = YES)' );
    if cont == 0
        error( 'exiting' ) ;
    end
    
    disp( 'iteration' )
    disp( i );
    
    % Next step of Power Method
    x = A * x;
    x = x / norm( x );
    
    % Print the length of the component of x orthogonal to the eigenvector
    % associated with the largest eigenvalue (in magnitude)
    disp( 'The length of the component of x orthogonal to V( :, 1 ) is ' );
    disp( norm( x - x' * V( :, 1 ) * V( :, 1 ) ) );
    
    % Compute the Rayleigh quotient (no need to divide by x' * x since x is
    % of unit length)
    sigma = x' * A * x;
    
    disp( 'sigma (Rayleigh quotient):' );
    disp( sigma );
end

disp( 'Final vector x:' );
disp( x );

disp( 'A * x - sigma * x (should equal, approximately, the zero vector)' );
disp( A * x - sigma * x );

