function [x,y]=cordinatescircle(xc, yc, R , theta)
x=xc+R.*cos(theta);
y=yc+R.*sin(theta);
end
