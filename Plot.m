function [] = Plot(  )
%PLOT Summary of this function goes here
%   Detailed explanation goes here

A = [ 3 2 ; 2 6 ];
b = [ 2 ; -8 ];

c = 10;

f = @(x,y) [x;y]'*A*[x;y]+ b'*[x;y] + c;

[X,Y] = meshgrid(-3:.2:3, -3:.2:3);

Z = zeros(size(X));

for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = f(X(i,j),Y(i,j));
    end
end

subplot(1, 2, 1); surf(X, Y, Z);
subplot(1, 2, 2); contour(X, Y, Z);

end
