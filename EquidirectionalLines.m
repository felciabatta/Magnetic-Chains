% EQUIDIRECTIONAL Lines

y1 = @(x,alpha) (3+sqrt(8*tan(alpha).^2+9)) ./ (2*tan(alpha)).*x;
y2 = @(x,alpha) (3-sqrt(8*tan(alpha).^2+9)) ./ (2*tan(alpha)).*x;


%% ONE Angle
x = linspace(-2,2,1000);

a = pi/2-.1;
plot([y1(x,a);y2(x,a)], x); hold on
plot([y1(x,-a);y2(x,-a)], x);
grid on
hold off


%% RANGE of Angles
lim = 2;
x = linspace(-lim,lim,1000);
a = (linspace(0,pi/2, 8))';

ax = axes;
plot(ax, [y1(x,a);y2(x,a)], x); hold on
plot(ax, [y1(x,-a);y2(x,-a)], x);

ax.YLim = [-lim, lim];
ax.XLim = [-lim, lim];

grid on
hold off


