t = [0:2:20];
g = 9.81; m = 68.1; cd = 0.25;
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);

plot(t, v);

title('Velocity vs time');
xlabel('time');
ylabel('velocity');