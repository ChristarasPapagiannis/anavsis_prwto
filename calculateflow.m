function [V, Q] = calculateflow(d, n, s, h)
    [P, A] = wetPerimeterArea(d, h);
    Rh = A ./ P;
    V = (1 ./ n) * Rh^(2./3) * sqrt(s);
    Q = V .* A;
end
