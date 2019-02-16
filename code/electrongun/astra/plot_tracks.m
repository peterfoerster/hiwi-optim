%clear all;close all;clc;
filename = "electrongun.track.001";
data = dlmread(filename);
r = data(:,3:5);
%figure;
hold on;
for ip=1:6
  scatter3(r(ip:6:end,2), r(ip:6:end,1), r(ip:6:end,3));
end
hold off;
%xlabel('x');ylabel('y');zlabel('z');
%view(3);
