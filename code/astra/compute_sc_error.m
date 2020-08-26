% INPUT:
%       - nI_ref
%       - nr_ref
%       - nc_ref
%       - nl_ref
%       - nI_it
%       - nr_it
%       - nc_it
%       - nl_it
%       - rho
%       - dz
% OUTPUT:
%       - err_linf

function [err_linf] = compute_sc_error (nI_ref, nr_ref, nc_ref, nl_ref, nI_it, nr_it, nc_it, nl_it, rho, dz)
    % [nI_it, nr_it, nc_it, nl_it, x/y, xrms/emit]
    err_linf = NaN(length(nI_it),length(nr_it),length(nc_it),length(nl_it),2,2);

    % filename = ['photogun_I=' num2str(2^nI_ref) '_Nr=' num2str(2^nr_ref) '_Cv=' num2str(2^nc_ref) ...
    %             '_Nl=' num2str(2^nl_ref) '.Xemit.001'];
    % x_ref = dlmread(filename);
    % x_ref = [x_ref(:,1) x_ref(:,4) x_ref(:,6)*pi];
    filename = ['photogun_I=' num2str(2^nI_ref) '_Nr=' num2str(2^nr_ref) '_Cv=' num2str(2^nc_ref) ...
                '_Nl=' num2str(2^nl_ref) '.Yemit.001'];
    y_ref = dlmread(filename);
    y_ref = [y_ref(:,1) y_ref(:,4) y_ref(:,6)*pi];

    % figure(1);
    % hold on;
    % plot(x_ref(:,1), x_ref(:,2));
    % plot(y_ref(:,1), y_ref(:,2));
    % xlabel('z in m');
    % ylabel('x_{rms} in mm');
    % hold off;

    figure(2);
    hold on;
    % plot(x_ref(:,1), x_ref(:,3));
    plot(y_ref(:,1), y_ref(:,3));
    write_dat1D (['photogun_sc_emit_ref_nI=' num2str(2^nI_ref) '_nr=' num2str(2^nr_ref) '_nc=' num2str(2^nc_ref) ...
                  '_nl=' num2str(2^nl_ref) '.dat'], y_ref(:,1), y_ref(:,3));
    xlabel('z in m');
    ylabel('\epsilon in mrad mm');
    hold off;

    for inI=1:length(nI_it)
        for inr=1:length(nr_it)
            for inc=1:length(nc_it)
                for inl=1:length(nl_it)
                    nI = 2^nI_it(inI);
                    nr = 2^nr_it(inr);
                    nc = 2^nc_it(inc);
                    nl = 2^nl_it(inl);

                    % filename = ['photogun_I=' num2str(nI) '_Nr=' num2str(nr) '_Cv=' num2str(nc) ...
                    %             '_Nl=' num2str(nl) '.Xemit.001'];
                    % x_it = dlmread(filename);
                    % x_it = [x_it(:,1) x_it(:,4) x_it(:,6)*pi];
                    filename = ['photogun_I=' num2str(nI) '_Nr=' num2str(nr) '_Cv=' num2str(nc) ...
                                '_Nl=' num2str(nl) '.Yemit.001'];
                    y_it = dlmread(filename);
                    y_it = [y_it(:,1) y_it(:,4) y_it(:,6)*pi];

                    % err_x = interp1(x_it(:,1), x_it(:,2:3), x_ref(:,1)) - x_ref(:,2:3);
                    % ix    = ~isnan(err_x(:,1)) & ~isnan(err_x(:,2));
                    % err_x = err_x(ix,:);
                    err_y = (interp1(y_it(:,1), y_it(:,2:3), y_ref(:,1)) - y_ref(:,2:3)) ./ y_ref(:,2:3);
                    iy    = ~isnan(err_y(:,1)) & ~isnan(err_y(:,2));
                    err_y = err_y(iy,:);

                    % err_linf(inI,inr,inc,inl,1,1) = norm(err_x(:,1), Inf);
                    % err_linf(inI,inr,inc,inl,1,2) = norm(err_x(:,2), Inf);
                    % err_linf(inI,inr,inc,inl,2,1) = norm(err_y(:,1), Inf);
                    err_linf(inI,inr,inc,inl,2,2) = norm(err_y(:,2), Inf);

                    % figure(1);
                    % hold on;
                    % plot(x_it(:,1), x_it(:,2));
                    % plot(y_it(:,1), y_it(:,2));
                    % hold off;

                    figure(2);
                    hold on;
                    % plot(x_it(:,1), x_it(:,3));
                    plot(y_it(:,1), y_it(:,3));
                    write_dat1D (['photogun_sc_emit_nI=' num2str(nI) '_nr=' num2str(nr) '_nc=' num2str(nc) ...
                                  '_nl=' num2str(nl) '.dat'], y_it(:,1), y_it(:,3));
                    hold off;
                end
            end
        end
    end
    if (length(nI_it) == 1 && length(nr_it) > 1 && length(nc_it) == 1 && length(nl_it) > 1)
        for inr=1:length(nr_it)
            write_dat1D (['photogun_sc_err_nI=' num2str(2^nI_it(1)) '_nr=' num2str(2^nr_it(inr)) ...
                          '_nc=' num2str(2^nc_it(1)) '.dat'], dz./(2.^nl_it), err_linf(1,inr,1,:,2,2));
        end
    elseif (length(nI_it) > 1 && length(nr_it) == 1 && length(nc_it) == 1 && length(nl_it) == 1)
        write_dat1D (['photogun_sc_err_nr=' num2str(2^nr_it(1)) '_nc=' num2str(2^nc_it(1)) ...
                      '_nl=' num2str(2^nl_it(1)) '.dat'], 2.^nI_it, err_linf(:,1,1,1,2,2));
    elseif (length(nI_it) == 1 && length(nr_it) == 1 && length(nc_it) > 1 && length(nl_it) == 1)
        write_dat1D (['photogun_sc_err_nI=' num2str(2^nI_it(1)) '_nr=' num2str(2^nr_it(1)) ...
                      '_nl=' num2str(2^nl_it(1)) '.dat'], (2.^nc_it), err_linf(1,1,:,1,2,2));
    end
end
