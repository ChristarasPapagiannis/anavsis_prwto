%5a
DYFB_A=d.*(3-(sqrt(7))./4);
DYEC_A=d./2;
function [Pw , Aw] = wetPerimeterArea(d , h)
    if  h <= DYFB_A
      [Pg,Ag]=wetpart_circle(d,h);
      Pa=0;
      Pb=0;
      Ab=0;
      Aa=0;
    elseif  h <= DYEC_A
      [Pg,Ag]=wetpart_circle(d,DYFB_A);
      [Pb,Ab]=wetblue(d,h);
      Pa=0;
      Aa=0;
    elseif h < d
      [Pg,Ag]=wetpart_circle(d,DYFB_A);
      [Pb,Ab]=wetblue(d,DYEC_A);
      [Pa,Aa]=wetpart_circle(d./2,h);
    elseif h == d
      disp('error');
endif
Pw=Pg+Pb+Pa;
Aw=Ag+Ab+Aa;
fprintf('Pw = %.4f\n', Pw);
fprintf('Aw = %.4f\n', Aw);
end
function [Pw,Aw]=wetpart_circle(R,h)
    if h < R
      Aw=(R.^2).*cos((R-h)./R)./2;
      Pw=R.*cos((R-h)./R);
    elseif h == R
      Aw=pi.*(R.^2)./2;
      Pw=pi.*R;
    elseif h > R
      Pw=2.*pi.*R-R.*cos((h-2.*R)./R);
      Aw=pi.*R.^2-(R.^2).*cos((h-2.*R)./R)./2;
    endif
end
function [Pb,Ab]=wetblue(R,h)
    [~ , bU]=wetpart_circle(R,h+R./4);
    [~ , bF]=wetpart_circle(R,R./4);
    E=bU-bF;
    Ab=E-d.*h;
    [Pb1 , ~] = wetpart_circle(R, h + R./4);
    [Pb2 , ~] = wetpart_circle(R, R./4);
    Pb = Pb1 - Pb2;
end
