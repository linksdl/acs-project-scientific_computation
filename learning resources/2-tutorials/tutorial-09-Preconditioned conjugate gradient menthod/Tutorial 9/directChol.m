function x = directChol(A,b)
L = chol(A);
z = forwardSubstitution(L, b, size(b,1));
x = backSubstitution(L',z,size(z,1));