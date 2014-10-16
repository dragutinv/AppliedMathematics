function [] = GoldenRatio()
%GOLDENRATIO Summary of this function goes here
%   Detailed explanation goes here

x = (-10:0.2:10);
y = arrayfun(@(x) exp((-(x-1)^2)) - exp(-(x+1)^2), x);

p1 = -2;
p2 = -1.5;
p3 = 2;

a = Func(p1);
b = Func(p2);
c = Func(p3);

for i = 1:10
    subplot(5, 2, i);
    plot(x, y);
    line([p1 p1], [0 a], 'Color','r','LineWidth',1);
    line([p2 p2], [0 b], 'Color','r','LineWidth',1);
    line([p3 p3], [0 c], 'Color','r','LineWidth',1);
    
    distance1 = abs(p2 - p1);
    distance2 = abs(p3 - p2);
 
    p4 = p2 - distance1 * 0.38;
    p5 = p2 + distance2 * 0.38;
    d = Func(p4);
    e = Func(p5);
    
    line([p4 p4], [0 d], 'Color',[.8 .8 .8]);
    line([p5 p5], [0 e], 'Color',[.8 .8 .8]);
    
    if (d < a && d < b) 
        p3 = p2;
        p2 = (p4);
    elseif (e < c && e < b)
        p1 = p2;
        p2 = (p5);
    else
        error('Stuck!! I can not find min');
    end
    
    a = Func(p1);
    b = Func(p2);
    c = Func(p3);
end

end


function [y] =  Func(x)

y = exp((-(x-1)^2)) - exp(-(x+1)^2);
y = floor(y*1000)/1000;

end




