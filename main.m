clear; clc; close all;
fprintf(' Ομάδα 44 ')
fprintf(' Θέμα 24 ')
fprintf(' 2024-2025')
fprintf(' Αλευρά Άννα ')
fprintf(' Αναστασοπούλου Κατερίνα ')
fprintf(' Βλάχος Γιάννης ')
fprintf(' Μητσόνη Βικτόρια ')
%4a
while true
    pref = input('Enter file prefix: ', 's');
    fn = [pref '.dat']; %Complete filename: prefix
    fr = fopen(fn, 'r');
    if fr > 0
        break;
    end
    fprintf('Can not find/open %s. Please try again.\n', fn);
end
iline = 0;
[d, iline] = getlabelreals(fn, fr, iline, 'DIAMETER', 1, 0); % diametros d
[n, iline] = getlabelreals(fn, fr, iline, 'MANNING', 1, 0); % suntelesths trivhs n
[s_percent, iline] = getlabelreals(fn, fr, iline, 'SLOPE', 1, 0); % klish pososto
s = s_percent / 100; % klish adiastath
[h1, iline] = getlabelreals(fn, fr, iline, 'DEPTH1', 1, 0); % va8os rohs h1
[Q1, iline] = getlabelreals(fn, fr, iline, 'DISCHARGE1', 1, 0); % paroxh Q1

fclose(fr);

fprintf('d: %.1f m\n', d);
fprintf('n: %.3f\n', n);
fprintf('s_percent: %.1f\n', s);
fprintf('s: %.3f\n', s);
fprintf('h1: %.1f m\n', h1);
fprintf('Q1: %.1f m^3/sec\n', Q1);
%4b
[Pw , Aw] = wetPerimeterArea(d , h);
P = Pw;
A = Aw;
%4c
[V, Q] = calculate_flow(d, n, s, h);
%4d
% Υπολογισμός αποτελεσμάτων
[V_h1, Q_h1] = calculate_flow(d, n, s, h1);
%4e
% Εύρεση βάθους για Q1
options = optimset('Display', 'off');
depth_func = @(h) calculate_flow(d, n, s, h) - Q1;
h_Q1 = fsolve(@(h) depth_func(h), d/2, options);
[V_Q1, ~] = calculate_flow(d, n, s, h_Q1);
%4f
% Αποθήκευση αποτελεσμάτων
outputFile = 'results.res';
fileID = fopen(outputFile, 'w');
fprintf(fileID, 'Αποτελέσματα:\n');
fprintf(fileID, 'Για βάθος ροής h1 = %.3f m:\n', h1);
fprintf(fileID, '- Παροχή Q = %.3f m³/s\n', Q_h1);
fprintf(fileID, '- Ταχύτητα V = %.3f m/s\n\n', V_h1);
fprintf(fileID, 'Για παροχή Q1 = %.3f m³/s:\n', Q1);
fprintf(fileID, '- Βάθος ροής h = %.3f m\n', h_Q1);
fprintf(fileID, '- Ταχύτητα V = %.3f m/s\n', V_Q1);
fclose(fileID);

disp(['Αποτελέσματα γραμμένα στο αρχείο: ' outputFile]);
%4g
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
