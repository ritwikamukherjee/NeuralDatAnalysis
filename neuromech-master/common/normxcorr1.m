function [C,xs] = normxcorr1(win, search)
% function [C,xs] = normxcorr1(win, search)
% 1D equivalent of normxcorr2 from the image processing toolbox.
%
% Mercurial revision hash: $Revision$ $Date$
% Copyright (c) 2010, Eric Tytell <tytell at jhu dot edu>

if (length(win) == length(search)),
	w2 = ceil(length(win)/2);
	
	search = shiftdim(search);
	search = [NaN([w2 1]); search; NaN([w2 1])];
end;

w2 = (length(search)-length(win))/2;
xs = -ceil(w2):floor(w2);

win = shiftdim(win);

winmean = nanmean(win);
win = win - winmean;
winvar = nansum(win.^2);

search = shiftdim(search);
S = im2col(search, [length(win) 1], 'sliding');

Smean = nanmean(S);
S = S - repmat(Smean, [size(S,1) 1]);
Svar = nansum(S.^2);

C = nansum(repmat(win, [1 size(S,2)]) .* S)  ./  sqrt(winvar .* Svar);

