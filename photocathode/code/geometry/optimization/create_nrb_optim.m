clear all; close all; clc;

geometry_file = 'photocathode_200kV_v3';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

plot_ctrl_optim (geometry);

bnds  = nrbextract(geometry(15).nurbs);
crv15 = bnds(3);
bnds  = nrbextract(geometry(16).nurbs);
crv16 = nrbdegelev(bnds(3), 1);
bnds  = nrbextract(geometry(17).nurbs);
crv17 = nrbdegelev(bnds(3), 1);
bnds  = nrbextract(geometry(18).nurbs);
crv18 = nrbdegelev(bnds(3), 1);
bnds  = nrbextract(geometry(19).nurbs);
crv19 = bnds(3);
bnds  = nrbextract(geometry(20).nurbs);
crv20 = bnds(2);
bnds  = nrbextract(geometry(21).nurbs);
crv21 = bnds(2);

% full curve with order 3, 21+3 knots
% ctrl = [crv21.coefs crv20.coefs crv19.coefs crv18.coefs crv17.coefs crv16.coefs crv15.coefs];
% knts = [zeros(1,3) 1/7 1/7 1/7 2/7 2/7 2/7 3/7 3/7 3/7 4/7 4/7 4/7 5/7 5/7 5/7 6/7 6/7 6/7 ones(1,3)];

% reduce to 9+3 knots, only decrease degree in interfaces by one
ctrl = [crv21.coefs(:,1:2) crv20.coefs(:,2) crv19.coefs(:,2) crv18.coefs(:,2) crv17.coefs(:,2) crv16.coefs(:,2) crv15.coefs(:,2:3)];
knts = [zeros(1,3) 2/9 3/9 5/9 6/9 7/9 8/9 ones(1,3)];

nrb = nrbmak(ctrl, knts);
% rewrite this with tolerance, impossible to construct exact nurbs since the original geometry is not C^1
for ii=1:100
   pt21 = nrbinverse_mod(nrb, nrbeval(crv21,1));
   pt20 = nrbinverse_mod(nrb, nrbeval(crv20,1));
   pt19 = nrbinverse_mod(nrb, nrbeval(crv19,1));
   pt18 = nrbinverse_mod(nrb, nrbeval(crv18,1));
   pt17 = nrbinverse_mod(nrb, nrbeval(crv17,1));
   pt16 = nrbinverse_mod(nrb, nrbeval(crv16,1));
   % knts_new = [zeros(1,3) pt20*ones(1,3) pt19*ones(1,3) pt18*ones(1,3) pt17*ones(1,3) pt16*ones(1,3) ones(1,3)];
   knts_new = [zeros(1,3) pt21 pt20 pt19 pt18 pt17 pt16 ones(1,3)];
   err = (knts(4:end-3)-knts_new(4:end-3))./knts_new(4:end-3);
   if (err < 1e-4)
      fprintf('\nconverged in %d iterations\n', ii);
      break;
   end
   nrb  = nrbmak(ctrl, knts_new);
   knts = knts_new;
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
% nrb = nrbmodp(nrb, [0 0.05 0]', [3 5 7]);
% hold on;
% nrbctrlplot(nrb);
% hold off;
return
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
