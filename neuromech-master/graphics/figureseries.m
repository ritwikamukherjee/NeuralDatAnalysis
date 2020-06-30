function fig = figureseries(name)

fig = findobj('Type','figure', 'Name',name);

if (isempty(fig))
    fig = figure('Name',name, 'Color','w');
end
figure(fig(1));


