function [v, iline] = getlabelreals(fn, fr, iline, lab, n, icod)
 [dline, iline] = fgetlc(fr, iline);
    if dline == -1
    error('Unexpected end of file %s after line %d', fn, iline);
    end
 dline = checklabel(fn, fr, iline, lab, dline);
 dl = strsplit(strtrim(dline));
 v = str2double(dl);
    if length(v) < n
        error('Error at line %d of file %s: Expected %d real numbers, but found %d', iline, fn, n, length(v));
    elseif any(isnan(v)) || any(v <= 0)
        fprintf('Error at line %d of file %s:\n', iline, fn);
        error('2 positive real numbers were expected');
    end
end
function dline = checklabel(fn, fr, iline, lab, dline)
 dl = strsplit(dline, ':');
    if ~strcmp(lab, strtrim(dl{1}))
    error('Error at line %d of file %s: "%s" was expected', iline, fn, lab);
    end
 dline = strjoin(dl(2:end), ':');
end


