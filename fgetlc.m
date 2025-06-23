function [dline, iline] = fgetlc(fr, iline)
    while true
    dline = fgetl(fr);
       if dline == -1;
          break;
       end
 iline = iline + 1;
 dl = strsplit(dline, '#');
 dline = dl{1};
       if ~isempty(strtrim(dline));
           break;
       end
    end
end
