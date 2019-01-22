function [in_ptc, r_param, iptc] = tfr_cath_2D (geometry, iptc, r_phys)
in_ptc = false;
r_param = NaN(3,1);

u0 = [0.5; 0.5];
r_param(1:2) = nrbinverse_mod_2D (geometry(iptc).nurbs, r_phys, 'u0', u0);
if ( ~isnan(r_param(1)) && ~isnan(r_param(2)) )
	in_ptc = true;
end%if
end%function
