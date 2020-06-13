function [nrb_opt] = create_nrb_opt (nrb_opt, knts, order, continuity)
    if (order == 5 && continuity < order-1)
        knts = unique(knts(order+1:end-order));
        for ic=1:(order-1-continuity)
            nrb_opt = nrbkntins(nrb_opt, knts);
        end
    else
        % error('create_nrb_opt: order = %i not implemented', order);
    end
end
