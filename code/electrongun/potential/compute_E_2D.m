function [E] = compute_E_2D (u, space, iptc, geometry)
% E = -grad(phi)
if (r_param(2)<0)
	 E(1:2) = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_param(1),-r_param(2)}, 'gradient');
	 E(2) = -E(2);
else
	 E(1:2) = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_param(1),r_param(2)}, 'gradient');
end%if
end
