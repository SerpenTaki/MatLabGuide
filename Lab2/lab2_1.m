clear all;
clc;

t = linspace(0,1,100);

f = @(x) cos(x).^3 - 3*sin(2*x).^3;

y1 = f(t);

g = @(x) cos(x).^5 + 3*sin(2*x).^4;

y2 = g(t); %feval(f,t)

figure(1)
plot(t,f(t))
hold on
plot(t,g(t),"k");
%hold off
figure(2)
plot(t,t);