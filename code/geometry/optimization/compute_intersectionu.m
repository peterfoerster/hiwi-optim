function [knt] = compute_intersectionu(nrb_opt, crv, I)
    x0 = nrbeval(crv, 0);
    x1 = nrbeval(crv, 1);
    a = (x1(2)-x0(2))/(x1(1)-x0(1));
    b = x0(2) - a*x0(1);
    % function handle for curve
    vcrv = @(u) a*u + b;

    % bisection method (interval I in parametric space of nrb_opt, compute where curve is in relation)
    y1 = nrbeval(nrb_opt, I(1));
    y2 = nrbeval(nrb_opt, I(2));
    for ii=1:2^6
        if (vcrv(y1(1)) > y1(2) && vcrv(y2(1)) < y2(2))
            knt = (I(1)+I(2))/2;
            ym = nrbeval(nrb_opt, knt);
            if (vcrv(ym(1)) > ym(2))
                I = [knt, I(2)];
                y1 = ym;
            elseif (vcrv(ym(1)) < ym(2))
                I = [I(1), knt];
                y2 = ym;
            end
        else
            error('The interval appears to not contain a zero.');
        end
        % converged
        if (abs(diff(I)) < 1e-4)
            knt = (I(2)+I(1))/2;
            break;
        end
    end
end
