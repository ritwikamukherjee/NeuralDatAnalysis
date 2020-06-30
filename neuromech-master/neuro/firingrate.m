function varargout = firingrate(spiket, binsize, smooth, varargin)
% function rate = firingrate(spiket, binsize, smooth, method)
% smooth time interval over which to perform a moving average
% if binsize is zero and smooth is zero, returns the spike-wise instantaneous firing rate.
% if binsize is zero, but smooth is non-zero, returns the spike-wise instantaneous firing
% rate, smoothed using csaps and interpolated on to evenly spaced samples with spacing
% specified by resamp

opt.truncategaussian = 0.005;
opt.method = 'hist';

if (nargin > 3)
    opt = parsevarargin(opt,varargin,4, ...
        'multival',{'method',{'hist','spline','gaussian','gaussianfilt'}});
elseif (nargin == 2)
    smooth = 0;
end;

if (iscell(spiket)),
    for ch = 1:length(spiket),
        spiket{ch} = makecol(spiket{ch});
    end;
    
    spiket = catuneven(2,spiket{:});
end;

if (size(spiket,1) < size(spiket,2)),
    spiket = spiket';
    istransposed = true;
else
    istransposed = false;
end;

nchan = size(spiket,2);
iseven = true;
edges = [];

if (numel(smooth) == 1),
    smooth = smooth(ones(1,nchan),1);
end;

if (numel(binsize) > 1),
    edges = binsize(:);

    binsize = edges(2)-edges(1);
    if (all(abs((diff(edges)-binsize)/binsize) < 0.001)),
        iseven = true;
        binsize = edges(2)-edges(1);
    else
        iseven = false;
        binsize = NaN;
    end;
end;

switch lower(opt.method),
%     case 'gaussian2'
%         if (isempty(edges))
%             tstart = floor(min(spiket(:))/binsize)*binsize - binsize/2;
%             tend = ceil(max(spiket(:))/binsize)*binsize + binsize;
%             
%             t = (tstart:binsize:tend)';
%         else
%             t = edges;
%             tstart = edges(1);
%         end;
% 
%         spikebin = floor((spiket - tstart) / binsize) + 1;
% 
%         maxbinwidth = ceil(smooth * sqrt(-2*log(opt.truncategaussian)));
%         coef = 1./(sqrt(2*pi) * smooth);
%         
%         for c = 1:nchan
%             for i = 1:nbin
%                 a = find(spikebin >= i-maxbinwidth(c), 1, 'first');
%                 b = find(spikebin <= i+maxbinwidth(c), 1, 'last');
%                 
%                 spiket1 = spiket(a:b,c);
%                 weight = coef(c) * exp(-0.5*((spiket1 - t(i)) / smooth(c)).^2);
                
                
    case 'gaussianfilt',
        if (isempty(edges)),
            t0 = floor(min(spiket(:))/binsize)*binsize - binsize/2;
            t1 = ceil(max(spiket(:))/binsize)*binsize + binsize/2;
            
            edges = (t0:binsize:t1)';
            edges(end) = Inf;
        end;
        
        n = zeros(length(edges),nchan);
        
        bin = NaN(size(spiket));
        for ch = 1:nchan,
            good = isfinite(spiket(:,ch));
            [n(:,ch),bin1] = histc(spiket(good,ch),edges);
            bin(good,ch) = bin1;
        end;
        
        if (iseven),
            rate = n / binsize;
            t = edges + binsize/2;
        else
            rate = n ./ diff(edges);
            t = (edges(1:end-1) + edges(2:end))/2;
        end;
        
        if (smooth ~= 0),
            maxbinwidth = ceil(smooth/binsize * sqrt(-2*log(opt.truncategaussian)));
            if all(smooth == smooth(1))
                d = (1:2*maxbinwidth(1)+1)*binsize;
                d = d - d(maxbinwidth(1)+1);
                b = exp(-0.5 * (d/smooth(1)).^2);
                a = sum(b);
                rate = filtfilt(b,a, rate);
            else
                for i = 1:nchan,
                    d = (1:2*maxbinwidth(i)+1)*binsize;
                    d = d - d(maxbinwidth(i)+1);
                    b = exp(-0.5 * (d/smooth(i)).^2);
                    a = sum(b);
                    rate1 = filtfilt(b,a, rate(:,i));
                    rate(:,i) = rate1;
                end;
            end
        end;

    case 'gaussian',
        rate0 = zeros(size(spiket));
        spikedt = diff(spiket);
        
        rate0(2:end-1,:) = 1 ./ ((spikedt(1:end-1,:) + spikedt(2:end,:))/2);
        t0 = spiket;
        
        if (isempty(edges))
            tstart = floor(min(spiket(:))/binsize)*binsize - binsize/2;
            tend = ceil(max(spiket(:))/binsize)*binsize + binsize;
            
            t = (tstart:binsize:tend)';
        else
            t = edges;
            tstart = edges(1);
        end;
        nbin = length(t);

        [t0,ord] = sort(t0);
        
        bin = floor((t0 - tstart)/binsize)+1;
        maxbinwidth = ceil(smooth/binsize * sqrt(-2*log(opt.truncategaussian)));
        coef = 1./(sqrt(2*pi) * smooth);
        
        rate = zeros(nbin,nchan);
        for c = 1:nchan,
            aprev = 1;
            for i = 1:nbin,
                a = find(bin(aprev:end,c) >= i-maxbinwidth(c), 1, 'first') + aprev-1;
                b = find(bin(aprev:end,c) <= i+maxbinwidth(c), 1, 'last') + aprev-1;
                
                if (~isempty(a) && ~isempty(b) && (b >= a))
                    spikeind1 = a:b;
                
                    spiket1 = spiket(spikeind1,c);
                    rate1 = rate0(spikeind1,c);
                    
                    weight = coef(c) * exp(-0.5*((spiket1 - t(i))/smooth(c)).^2);
                    %[~,j] = max(weight);
                    
                    rate(i,c) = sum(weight.*rate1) / sum(weight);
                    
                    aprev = a;
                else
                    rate(i,c) = 0;
                end;
            end;
            
        end;
            
    case 'spline',
        rate0 = NaN(size(spiket));
        rate0(2:end-1,:) = 1 ./ ((spiket(3:end,:) - spiket(1:end-2,:))/2);
        t0 = spiket;
        
        if (nargin >= 3),
            t = t0;
            if (nargin == 4),
                tstart = floor(min(spiket(:))/binsize)*binsize - binsize/2;
                tend = ceil(max(spiket(:))/binsize)*binsize + binsize/2;
                
                t = (tstart:binsize:tend)';
            end;
            
            rate = NaN(length(t),size(rate0,2));
            for i = 1:size(rate,2),
                good = isfinite(rate0(:,i));
                a = ceil((first(t0(:,i),good) - tstart) / binsize) + 1;
                b = floor((last(t0(:,i),good) - tstart) / binsize);
                
                rate1 = windavg(t0(good,i),rate0(good,i), smooth(i)*binsize,t(a:b));
                rate1(isnan(rate1)) = 0;
                rate(a:b,i) = rate1;
            end;
        else
            t = t0;
            rate = rate0;
        end;
        
        bin = [];
        
    case 'hist',
        if (isempty(edges)),
            t0 = floor(min(spiket(:))/binsize)*binsize - binsize/2;
            t1 = ceil(max(spiket(:))/binsize)*binsize + binsize/2;
            
            edges = (t0:binsize:t1)';
            edges(end) = Inf;
        end;
        
        n = zeros(length(edges),nchan);
        
        bin = NaN(size(spiket));
        for ch = 1:nchan,
            good = isfinite(spiket(:,ch));
            [n(:,ch),bin1] = histc(spiket(good,ch),edges);
            bin(good,ch) = bin1;
        end;
        
        if (iseven),
            rate = n / binsize;
            t = edges + binsize/2;
        else
            rate = n ./ diff(edges);
            t = (edges(1:end-1) + edges(2:end))/2;
        end;
        
        if (smooth ~= 0),
            for i = 1:nchan,
                rate(:,i) = runavg(rate(:,i),ceil(smooth(i)/binsize));
            end;
        end;
end;

if (istransposed),
    t = t';
    rate = rate';
    bin = bin';
end;

switch nargout,
    case 1,
        varargout = {rate};
    case 2,
        varargout = {t,rate};
    case 3,
        varargout = {t,rate,bin};
end;

    