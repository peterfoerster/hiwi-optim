function [nrb_opt] = create_nrb_opt (nrb_opt, knts, order, continuity)
    if (order == 5 && continuity < order-2)
        knts = unique(knts(order+1:end-order));
        for ic=1:(order-2-continuity)
            nrb_opt = nrbkntins(nrb_opt, knts);
        end
    elseif (continuity < order-2)
        fprintf('\ncreate_nrb_opt: order = %i not implemented\n', order);
    end
end
