function nrbctrlplot_dat (nurbs, filename)

if (nargin < 1)
  error ('nrbctrlplot: Need a NURBS to plot!');
end

% Default values
light='on';
cmap='summer';

colormap (cmap);

hold_flag = ishold;

if (iscell (nurbs.knots))
  if (size (nurbs.knots,2) == 3)
    nsub = 100;
    nrbplot (nurbs, [nsub nsub nsub], 'light', light, 'colormap', cmap);
    hold on
% Plot the control points
    coefs = bsxfun (@rdivide, nurbs.coefs(1:3,:,:,:), nurbs.coefs(4,:,:,:));
    coefs = reshape (coefs, 3, []);
    plot3 (coefs(1,:), coefs(2,:), coefs(3,:), 'r.','MarkerSize',20);
% Plot the control net
    for ii = 1:size (nurbs.coefs, 2)
     for jj = 1:size (nurbs.coefs, 3)
      coefs = reshape (nurbs.coefs(1:3,ii,jj,:), 3, []);
      weights = reshape (nurbs.coefs(4,ii,jj,:), 1, []);
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
     end
     for kk = 1:size (nurbs.coefs, 4)
      coefs = reshape (nurbs.coefs(1:3,ii,:,kk), 3, []);
      weights = reshape (nurbs.coefs(4,ii,:,kk), 1, []);
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
     end
    end
    for jj = 1:size (nurbs.coefs, 3)
     for kk = 1:size (nurbs.coefs, 4)
      coefs = reshape (nurbs.coefs(1:3,:,jj,kk), 3, []);
      weights = reshape (nurbs.coefs(4,:,jj,kk), 1, []);
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
     end
    end

  elseif (size (nurbs.knots,2) == 2) % plot a NURBS surface

    nsub = 100;
    nrbplot (nurbs, [nsub nsub], 'light', light, 'colormap', cmap);
    hold on

% And plot the control net
    for ii = 1:size (nurbs.coefs, 2)
      coefs = reshape (nurbs.coefs(1:3,ii,:), 3, []);
      weights = reshape (nurbs.coefs(4,ii,:), 1, []);
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'r.','MarkerSize',20)
    end
    for jj = 1:size (nurbs.coefs, 3)
      coefs = reshape (nurbs.coefs(1:3,:,jj), 3, []);
      weights = reshape (nurbs.coefs(4,:,jj), 1, []);
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
      plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'r.','MarkerSize',20)
    end
  end
else % plot a NURBS curve
  nsub = 2^8;
  nrbplot_dat (nurbs, nsub, [filename '.dat']);
  hold on

% And plot the control polygon
  coefs = nurbs.coefs(1:3,:);
  weights = nurbs.coefs(4,:);
  write_dat([filename '_coefs.dat'], coefs(1,:)./weights, coefs(2,:)./weights);
  write_dat([filename '_net.dat'], coefs(1,:)./weights, coefs(2,:)./weights);
  plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'k--')
  plot3 (coefs(1,:)./weights, coefs(2,:)./weights, coefs(3,:)./weights,'r.','MarkerSize',20)
end

if (~hold_flag)
  hold off
end

end
