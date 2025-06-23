%erwthma4z
clear; clc; close all;
d = input('d: ');
xc = input('xc: ');
yc = input('yc: ');
theta = input('theta: ');
R = input('R: ');
theta2 = input('theta2: ');
theta1 = input('theta1: ');
h = input('h: ');

%sxediasmos kyklvn
DYFB_A=d.*(3-(sqrt(7))./4);
[xa,ya]=cordinatescircle(0, 0, d./2 , theta);
[xg,yg]=cordinatescircle(0, d./2, d , theta);
[xbr,ybr]=cordinatescircle(d./2, 0, d , theta);
[xbl,ybl]=cordinatescircle(-d./2, 0, d , theta);

%sxediasmos diatomhs , shmeio 0,0 to xamhlotero shmeio toy aristeroy mple kykloy
[theta1g,theta2g]=gwnies(d,DYFB_A);
[Dxg , Dyg]=cordinatesxyfor20(d./2, 3.*d./2 , d, theta1g, theta2g);

[theta1a_u,theta2a_u]=gwnies(d./2,d);
[xa_u , ya_u]=cordinatesxyfor20(xc, yc, R, theta1a_u, theta2a_u);
[theta1a,theta2a]=gwnies(d./2,d./2);
[xa_j , ya_j]=cordinatesxyfor20(d./2, d, R, theta1a_j, theta2a_j);
Dxa = xa_u-xa_j ;
Dya = ya_u-ya_j ;

YBF=(d./2)+DYFB_A;
[thetabr_u,thetabr_u]=gwnies(d,d);
[xbr_u , ybr_u]=cordinatesxyfor20(d, d, d, thetabr_u, thetabr_u);
[thetabr_j,thetabr_j]=gwnies(d,YBF);
[xbr_j , ybr_j]=cordinatesxyfor20(d, d, d, thetabr_j, thetabr_j);
z = xbr_u - xbr_j;
c = ybr_u - ybr_j;
if z < 0
    Dxbr = z;
    Dybr = c;
end
[thetabl_u,thetabl_u]=gwnies(d,d);
[xbl_u , ybl_u]=cordinatesxyfor20(0, d, d, thetabl_u, thetabl_u);
[thetabl_j,thetabl_j]=gwnies(d,YBF);
[xbl_j , ybl_j]=cordinatesxyfor20(0, d, d, thetabl_j, thetabl_j);
z = xbl_u - xbl_j;
c = ybl_u - ybl_j;
 if z > 0
    Dxbl = z;
    Dybl = c;
end
%grafhma
figure;
plot( xa, ya, 'k*-','LineWidth',2 );
hold on;
plot( xg, yg, 'g*-','LineWidth',2 );
plot( xbr, ybr, 'b*-','LineWidth',2 );
plot( xbl, ybl, 'b*-','LineWidth',2 );
plot( Dxa, Dya, 'k-','LineWidth',5 );
plot( Dxg, Dyg, 'g-','LineWidth',5 );
plot( Dxbr, Dybr, 'b-','LineWidth',5 );
plot( Dxbl, Dybl, 'b-','LineWidth',5 );
hold off;
title('GRAFHMA');
legend('DIATOMH');
axis equal;
grid on;

