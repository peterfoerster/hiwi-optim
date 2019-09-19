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

% full curve with order 5 == degree 4, derivatives do not match at circular segments -> unable to achieve exact curve
% proper way of finding the glued curve goes:
% 1) find projective control points and weights
% 2) apply procedure from 12.2 using polar forms of B-splines
% seems unpractical, since its impossible to glue exactly with higher continuity
figure;
ctrl = [crv13.coefs(:,1:end) crv12.coefs(:,2:end) crv9.coefs(:,end) crv8.coefs(:,end) crv7.coefs(:,end) crv6.coefs(:,2:end)];
% initial guess for knots
knts = [0 0 0 0 0 2/10 4/10 6/10 8/10 9/10 1 1 1 1 1];
nrb = nrbmak(ctrl, knts);
for ii=1:50
   pt13 = nrbinverse_mod(nrb, nrbeval(crv13,1));
   pt12 = nrbinverse_mod(nrb, nrbeval(crv12,1));
   pt9 = nrbinverse_mod(nrb, nrbeval(crv9,1));
   pt8 = nrbinverse_mod(nrb, nrbeval(crv8,1));
   pt7 = nrbinverse_mod(nrb, nrbeval(crv7,1));
   knts = [0 0 0 0 0 pt13 pt12 pt9 pt8 pt7 1 1 1 1 1];
   nrb = nrbmak(ctrl, knts);
end
hold on;
nrbctrlplot(nrb);
nrbkntplot(nrb);
hold off;

% test degree elevation
% nrb = nrbdegelev(nrb, 1);
% hold on;
% nrbctrlplot(nrb);
% hold off;

% test movement
nrb = nrbmodp(nrb, [0 0.05 0]', [5 8]);
hold on;
nrbctrlplot(nrb);
hold off;

% test knot insertion to split into multiple nurbs
figure;
for ii=1:4
   nrb = nrbkntins(nrb, [pt13 pt12 pt9 pt8 pt7]);
end
hold on;
nrbctrlplot(nrb);
nrbkntplot(nrb);
hold off;

% test splitting
% 3 control points per nurbs + 2 at each interface, duplicate control points at interfaces
% don't forget control points at start and end of total nurbs
figure;
ctrl8 = nrb.coefs(:,1+3*3+2*2+1+1:16+3+1);
knts8 = [1 1 1 1 1 0 0 0 0 0];
crv8_new = nrbmak(ctrl8, knts8);
nrbctrlplot(crv8_new);
