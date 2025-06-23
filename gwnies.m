clear; clc; close all;
h = input('h: ');
R = input('R: ');

function [theta1,theta2]=gwnies(R,h)
  if h>=0 && h<=R
   xt1=sqrt(R.^2+(h-R).^2);
   xt2=-sqrt(R.^2+(h-R).^2);
   theta1=3.*pi./2+acos((R-h)./R);
   theta2=pi+acos((R-h)./R);
   disp(theta1);
   disp(theta2);
  elseif h>R && h<=2.*R
   xt1=sqrt(R.^2+(h-R).^2);
   xt2=-sqrt(R.^2+(h-R).^2);
   theta1=asin((h-R)./R);
   theta2=pi./4+acos((h-R)./R);
   disp(theta1);
   disp(theta2);
  elseif h>2.*R
   disp('error');
  end
end
