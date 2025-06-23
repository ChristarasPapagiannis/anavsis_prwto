function c=bmethod(f, a, b, n, e)
if f(a).*f(b)<=0
  for i=1:n
    c=(a+b)./2;
    fprintf('P%d=%.4f\n' ,i,c)
    if abs(c-b)<e || abs(c-a)<e
      return;
    endif
    if f(a).*f(c)<0;
      b=c;
    else
      a=c;
    end
  end
  error("den sygklinei");
elseif
  error("No roots between");
end
end

