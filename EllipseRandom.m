function [ ] = EllipseRandom( input_args )
%ELIPSERANDOM Summary of this function goes here
%   Detailed explanation goes here

  t = linspace(-pi,pi,60);
  
  Rx = 300;
  Ry = 200;
  Cx = 250;
  Cy = 150;
  Rotation = .4; % Radians
  
  NoiseLevel = 3.8; % Will add Gaussian noise of this std.dev. to points
  
  x = Rx * cos(t);
  y = Ry * sin(t);
  nx = x*cos(Rotation)-y*sin(Rotation) + Cx + randn(size(t))*NoiseLevel; 
  ny = x*sin(Rotation)+y*cos(Rotation) + Cy + randn(size(t))*NoiseLevel;
  
  % Clear figure
  clf
  % Draw it
  plot(nx,ny,'o');
  % Show the window
  figure(gcf)

end
