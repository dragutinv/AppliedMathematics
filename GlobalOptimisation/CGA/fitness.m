%***********************************
% définition de la fonction fitness
%***********************************

function[y]=fitness(x);
y=sin(10*x)^2/(1+x);
return