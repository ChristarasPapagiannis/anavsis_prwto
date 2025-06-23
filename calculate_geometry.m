function [P, A] = calculate_geometry(d, h)
    if h <= d./2
        theta = 2 .* acos(1 - 2 .* h ./ d);
        A = 0.5 * d^2 * (theta - sin(theta));
        P = d .* theta;
    elseif h <= d
        A1 = 0.25 .* pi .* (d./2).^2;
        A2 = (h - d./2) .* d;
        A = A1 + A2;
        P1 = pi .* d ./ 2;
        P2 = 2 .* (h - d./2);
        P = P1 + P2;
    else
        A = 0.5 .* pi .* (d./2).^2 + d.^2;
        P = pi .* d + 2 .* d;
    end
end
