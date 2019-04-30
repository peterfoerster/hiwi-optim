clear all; close all; clc;
filename = 'electrongun.ref.001';
data = dlmread(filename);
z = data(:,1);
p_z = data(:,3);
p_x = data(:,8);
p_y = data(:,9);
plot(z, p_z);
xlabel('z in [m]');
ylabel('p_z in [MeV/c]');

figure;
plot(z, p_x, z, p_y);
xlabel('z in [m]');
ylabel('p in [eV/c]');
legend('p_x', 'p_y');
