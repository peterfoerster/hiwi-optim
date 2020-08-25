% INPUT:
%       - ib
%       - x
%       - y
% OUTPUT:
%       - g

function [g] = nm_bc (ib, x, y)
    switch (ib)
        % symmetry axis
        case {4}
            g = zeros(size(x));
        otherwise
            error('unknown boundary');
    end%switch
end
