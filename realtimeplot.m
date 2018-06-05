%%
clear all;
clc;

h = animatedline;

XBandWidth = 2*pi;
YLimUpInit = 0.5;
YLimDownInit = -0.5;

axis([0,XBandWidth,YLimDownInit,YLimUpInit]);

%x = linspace(0,6*pi,5000);
x = [0:6*pi/10000:6*pi];

y = exp(0.1*x).*sin(2*pi*2*x);
xmin = 0;
ymax = y(1);
ymin = y(1);

for k = 1:length(x)
    if and((y(k) >= ymax), (y(k) >= YLimUpInit))
        ymax = y(k);
    elseif ymax <= YLimUpInit
        ymax = YLimUpInit;
    end
    
    if and((y(k) <= ymin), (y(k) <= YLimDownInit))
        ymin = y(k);
    elseif ymin >= YLimDownInit
        ymin = YLimDownInit;
    end
    
    if k*6*pi/10000 >= XBandWidth
        xmin = k*6*pi/10000 - XBandWidth;
    else
        xmin = 0;
    end
    
    axis([xmin,XBandWidth+xmin,1.25*ymin,1.25*ymax]);
    addpoints(h,x(k),y(k));
    drawnow 
end
