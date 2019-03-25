function [h] = drl_bc (ib, x, y, voltage)
switch (ib)
	% anode
	case {1}
		h = zeros(size(x));
	% cathode
	case {2}
		h = voltage*ones(size(x));
	otherwise
		error('unknown boundary');
end%switch
end
