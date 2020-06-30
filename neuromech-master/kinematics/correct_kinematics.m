function correct_kinematics(filename, varargin)

opt.dssmoothcurve = 0.2;
opt = parsevarargin(opt,varargin, 2);

load(filename,'indpeak','smm','t','mxmm','mymm', 'curve');

if (~exist('indpeak','var'))
    warning('File %s is not analyzed.  Skipping.',filename);
    return;
end

fig = figureseries('Correct Kinematics');
clf;

tpeak = NaN(size(indpeak));
good = isfinite(indpeak);
tpeak(good) = t(indpeak(good));

if (~exist('curve','var'))
    curve = curvature(mxmm,mymm,'spline','smooth',opt.dssmoothcurve);
end;

hax(1) = subplot(2,2,1:2);
hpk = plot(tpeak,smm, 'k.-');
[~,fn] = fileparts(filename);
title(fn);

pk = first(isfinite(indpeak(end,:)));
fr = indpeak(end,pk);
pt = 20;

hsel(1) = addplot(t(fr), smm(pt), 'r*');
set(hpk(pk),'Color','r');

hax(2) = subplot(2,2,3);
hcurve = plot(t,curve(pt,:),'k-');
hsel(2) = addplot(t(fr),curve(pt,fr), 'r*');


axis tight;
xlabel('Time (sec)');
ylabel('Curvature (1/mm)');

hax(3) = subplot(2,2,4);
hmid = plot(mxmm(:,fr),mymm(:,fr), 'k-');
hsel(3) = addplot(mxmm(pt,fr),mymm(pt,fr), 'r*');
axis equal tight;

goodpk = isfinite(tpeak(pt,:));
if all(~goodpk)
    delete(fig);
else
    goodpk(pk) = false;                 % don't show the current peak again
    hother(1,1) = addplot(hax(1), tpeak(pt,goodpk), smm(pt)*ones(1,sum(goodpk)), 'bo');
    hother(1,2) = addplot(hax(2), tpeak(pt,goodpk), curve(pt,indpeak(pt,goodpk)), 'bo');

    ptind = last(indpeak <= fr);
    pkind = 1:size(indpeak,2);
    goodpk = (ptind ~= 0) & (pkind ~= pk);
    ptind = ptind(goodpk);
    pkind = pkind(goodpk);
    ind = sub2ind(size(indpeak),ptind,pkind);

    hother(2,1) = addplot(hax(1), tpeak(ind),smm(ptind), 'gd');
    hother(2,2) = addplot(hax(3), mxmm(ptind,fr),mymm(ptind,fr), 'gd');

    good = true(1,size(indpeak,2));

    data = struct('hpk',hpk,'hsel',hsel,'good',good, 'hcurve',hcurve, 'hmid',hmid, ...
        'hax',hax, 'hother',hother,...
        'tpeak',tpeak, 'indpeak',indpeak, 'curve',curve, ...
        't',t, 'mxmm',mxmm, 'mymm',mymm, 'smm',smm, ...
        'pk',pk, 'pt',pt, 'fr',fr);

    set(fig,'KeyPressFcn',@on_key_press);

    guidata(fig,data);

    uiwait(fig);
end

if (ishandle(fig))
    data = guidata(fig);
    delete(fig);
    
    if (any(~data.good))
        [per,amp,midx,midy,exc,wavevel,wavelen,waver,waven] = ...
            analyzeKinematics(smm,t,mxmm,mymm, indpeak(:,data.good));
        
        F = load(filename,'per','amp','wavevel','wavelen');
        figureseries('Compare kinematics');
        
        subplot(4,1,1);
        plot(tpeak,F.per,'ko-', tpeak(:,data.good),per,'g*-');
        ylabel('Period (sec)');
        axis tight;
        [~,fn] = fileparts(filename);
        title(fn);
        
        subplot(4,1,2);
        plot(tpeak,F.amp,'ko-', tpeak(:,data.good),amp,'g*-');
        ylabel('Amplitude (mm)');
        axis tight;
        
        subplot(4,1,3);
        plot(tpeak(end,:),F.wavevel,'ko', tpeak(end,data.good),wavevel,'g*');
        axis tight;
        ylim([0 1000]);
        nout1 = sum((F.wavevel < 0) | (F.wavevel > 1000));
        nout2 = sum((wavevel < 0) | (wavevel > 1000));
        if (nout1 > 0)
            text(1,1,sprintf('N outliers = %d',nout1),'Color','k', ...
                'Units','normalized','HorizontalAlignment','right');
        end
        if (nout2 > 0)
            text(1,0,sprintf('N outliers = %d',nout1),'Color','g', ...
                'Units','normalized','HorizontalAlignment','right');
        end
        
        subplot(4,1,4);
        plot(tpeak,F.wavelen, tpeak(:,data.good),wavelen);
        
        resp = questdlg('Save new data?','Save?','OK','Cancel','Cancel');
        if (strcmp(resp,'OK'))
            indpeakold = indpeak;
            goodpeak = data.good;
            indpeak = indpeak(:,goodpeak);
            save(filename,'indpeakold','goodpeak','indpeak','per','amp','midx','midy','exc','wavevel',...
                'waven','waver','wavelen','-append');
        end
    end
    fprintf('Done.\n');
end

%--------------------------------------------------------------------------
function on_key_press(obj, event)

data = guidata(obj);
switch event.Key
    case 'q'
        uiresume(obj);
    case 'uparrow'
        data = update_selection(data,1,0);
    case 'downarrow'
        data = update_selection(data,-1,0);
    case 'leftarrow'
        data = update_selection(data,0,-1);
    case 'rightarrow'
        data = update_selection(data,0,1);
        
    case {'delete','backspace'}
        data.good(data.pk) = false;
        set(data.hpk(data.good), 'LineStyle','-');
        set(data.hpk(~data.good), 'LineStyle',':');
        
    case 't'
        data.good(data.pk) = ~data.good(data.pk);
        set(data.hpk(data.good), 'LineStyle','-');
        set(data.hpk(~data.good), 'LineStyle',':');
end
guidata(obj,data);


%--------------------------------------------------------------------------
function data = update_selection(data, dpt,dpk, setpt,setpk)

pk1 = data.pk;
pt1 = data.pt;
if (nargin == 3)
    pk1 = pk1 + dpk;
    pt1 = pt1 + dpt;
elseif (nargin == 5)
    pk1 = setpk;
    pt1 = setpt;
end

npk = size(data.indpeak,2);
npt = size(data.indpeak,1);
if ((pk1 >= 1) && (pk1 <= npk) && (pt1 >= 1) && (pt1 <= npt) && ...
        isfinite(data.indpeak(pt1,pk1)))
    fr1 = data.indpeak(pt1,pk1);

    if (data.pk ~= pk1)
        set(data.hpk(data.pk),'Color','k');
        set(data.hpk(pk1),'Color','r');
    end
    
    set(data.hcurve,'YData',data.curve(pt1,:));
    axis(data.hax(2),'tight');
    set(data.hmid,'XData',data.mxmm(:,fr1), 'YData',data.mymm(:,fr1));
    axis(data.hax(3),'equal','tight');

    set(data.hsel(1), 'XData',data.tpeak(pt1,pk1), 'YData',data.smm(pt1));
    set(data.hsel(2), 'XData',data.t(fr1), 'YData',data.curve(pt1,fr1));
    set(data.hsel(3), 'XData',data.mxmm(pt1,fr1), 'YData',data.mymm(pt1,fr1));
    
    goodpk = isfinite(data.tpeak(pt1,:));
    goodpk(pk1) = false;                 % don't show the current peak again
    
    set(data.hother(1,1),'XData',data.tpeak(pt1,goodpk), 'YData',data.smm(pt1)*ones(1,sum(goodpk)));
    set(data.hother(1,2),'XData',data.tpeak(pt1,goodpk), 'YData',data.curve(pt1,data.indpeak(pt1,goodpk)));
    
    ptind = last(data.indpeak <= fr1);
    pkind = 1:size(data.indpeak,2);
    goodpk = (ptind ~= 0) & (pkind ~= pk1);
    ptind = ptind(goodpk);
    pkind = pkind(goodpk);
    ind = sub2ind(size(data.indpeak),ptind,pkind);
    
    set(data.hother(2,1), 'XData', data.tpeak(ind), 'YData', data.smm(ptind));
    set(data.hother(2,2), 'XData',data.mxmm(ptind,fr1), 'YData',data.mymm(ptind,fr1));
    
    data.pk = pk1;
    data.pt = pt1;
end
    




