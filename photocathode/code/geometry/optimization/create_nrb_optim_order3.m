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
% full curve with order 3, 18+3 knots
% ctrl = [crv13.coefs(:,1:end) crv12.coefs(:,1:end) crv9.coefs(:,1:end) crv8.coefs(:,1:end) crv7.coefs(:,1:end) crv6.coefs(:,1:end)];
% reduce to 8+3 knots, only decrease degree in interfaces by one
ctrl = [crv13.coefs(:,1:end-1) crv12.coefs(:,2) crv9.coefs(:,2) crv8.coefs(:,2) crv7.coefs(:,2) crv6.coefs(:,2:end)];
% initial guess for knots, seems to fit in this case, why?
knts = [0 0 0 3/10 4/10 6/10 8/10 9/10 1 1 1];
nrb = nrbmak(ctrl, knts);
% rewrite this with tolerance, impossible to construct exact nurbs since the original geometry is not C^1
for ii=1:100
   pt13 = nrbinverse_mod(nrb, nrbeval(crv13,1));
   pt12 = nrbinverse_mod(nrb, nrbeval(crv12,1));
   pt9 = nrbinverse_mod(nrb, nrbeval(crv9,1));
   pt8 = nrbinverse_mod(nrb, nrbeval(crv8,1));
   pt7 = nrbinverse_mod(nrb, nrbeval(crv7,1));
   knts_new = [0 0 0 pt13 pt12 pt9 pt8 pt7 1 1 1];
   err = (knts(4:end-3)-knts_new(4:end-3))./knts_new(4:end-3);
   if (err < 1e-4)
      fprintf('\nconverged in %d iterations\n', ii);
      break;
   end
   nrb = nrbmak(ctrl, knts_new);
   knts = knts_new;
end
hold on;
nrbctrlplot(nrb);
nrbkntplot(nrb);
hold off;

% test derivatives for outer interfaces, seem to be fine only relevant for trajectory optimization later anywayt
% der = nrbderiv(nrb);
% [pnt, jac] = nrbdeval(nrb, der, 1)
% [pnt, jac] = nrbdeval(nrb, der, 0)

% test degree elevation
% nrb = nrbdegelev(nrb, 1);
% hold on;
% nrbctrlplot(nrb);
% hold off;
return
% test movement
nrb = nrbmodp(nrb, [0 0.05 0]', [3 5 7]);
hold on;
nrbctrlplot(nrb);
hold off;

% test knot insertion to split into multiple nurbs
for ii=2:nrb.order
   nrb = nrbkntins(nrb, [pt13 pt12 pt9 pt8 pt7]);
end
hold on;
nrbctrlplot(nrb);
nrbkntplot(nrb);
hold off;

% 3 control points per nurbs, duplicates at interfaces
% don't forget control points at start and end of total nurbs
figure;
ctrl8 = nrb.coefs(:,1+3*3:10+1+1);
knts8 = [1 1 1 0 0 0];
crv8_new = nrbmak(ctrl8, knts8);
nrbctrlplot(crv8_new);
