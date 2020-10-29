
function showArm( A, B )

% function showArm( A, B )
%  Given angles A and B that each segment 
%  makes with the horizontal plot the shape
%  of the unit length arm segments
%
% To plot multiple cases on one figure type
% >> hold on;
% at the Matlab prompt after the first run
%
% Use 'File->Save As..' to export images

x = [ 0; cos(A); cos(A)+cos(B) ];  % arm segment
y = [ 0; sin(A); sin(A)+sin(B) ];  % coordinates

plot( x,y,'-or' ); % plot the arm
axis([-2.1 2.1 -2.1 2.1]); % set plot limits

end 
