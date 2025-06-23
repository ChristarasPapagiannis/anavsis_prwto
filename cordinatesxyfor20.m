function [x , y]=cordinatesxyfor20(xc, yc, R, theta1, theta2)
angles=linspace(theta1,theta2,20);
x=xc+R.*cos(angles);
y=yc+R.*sin(angles);
end
