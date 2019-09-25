clear all; close all; clc

N_inc = 1;
N_ctrl = 12*N_inc+8;
x_ini = zeros(N_ctrl,1);

[ptcs] = compute_ptcs (N_inc, x_ini);
plot_ctrl_optim (ptcs);

bnds = nrbextract(ptcs(13));
crv13 = bnds(2);
bnds = nrbextract(ptcs(12));
crv12 = bnds(2);
bnds = nrbextract(ptcs(9));
crv9 = bnds(3);
bnds = nrbextract(ptcs(8));
crv8 = bnds(3);
bnds = nrbextract(ptcs(7));
crv7 = bnds(3);
bnds = nrbextract(ptcs(6));
crv6 = bnds(3);

figure;
% full curve with order 4, 13+4 knots -> need even number for even order
% seems to be impossible because of this!
% odd number of knots -> always 2*order as even number subtracted from total knots
% leaves odd number of knots and we need multiple of odd number of knots
ctrl = [crv13.coefs(:,1:end) crv12.coefs(:,2:end) crv9.coefs(:,1:2:end) crv8.coefs(:,1:2:end) crv7.coefs(:,1:2:end) crv6.coefs(:,2:end)];
% initial guess for knots, seems to fit in this case, why?
knts = [0 0 0 0 3/10 4/10 6/10 8/10 9/10 1 1 1 1];
nrb = nrbmak(ctrl, knts);
for ii=1:50
   pt13 = nrbinverse_mod(nrb, nrbeval(crv13,1));
   pt12 = nrbinverse_mod(nrb, nrbeval(crv12,1));
   pt9 = nrbinverse_mod(nrb, nrbeval(crv9,1));
   pt8 = nrbinverse_mod(nrb, nrbeval(crv8,1));
   pt7 = nrbinverse_mod(nrb, nrbeval(crv7,1));
   knts = [0 0 0 0 pt13 pt13 pt12 pt12 pt9 pt9 pt8 pt8 pt7 pt7 1 1 1 1];
   nrb = nrbmak(ctrl, knts);
end
hold on;
nrbctrlplot(nrb);
nrbkntplot(nrb);
hold off;
return
% test degree elevation
% nrb = nrbdegelev(nrb, 1);
% hold on;
% nrbctrlplot(nrb);
% hold off;

% test movement
nrb = nrbmodp(nrb, [0 0.05 0]', [9 11]);
hold on;
nrbctrlplot(nrb);
hold off;

% knot insertion should not be needed in this case
% 1 control points per nurbs + 2 at each interface, duplicate control points at interfaces
% don't forget control points at start and end of total nurbs
figure;
ctrl8 = nrb.coefs(:,1+3*1+2*2+1+1:10+1+1);
knts8 = [1 1 1 0 0 0];
crv8_new = nrbmak(ctrl8, knts8);
nrbctrlplot(crv8_new);
