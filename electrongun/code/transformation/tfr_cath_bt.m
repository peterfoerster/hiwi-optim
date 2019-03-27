function [in_ptc, r_param, iptc] = tfr_cath_bt (geometry, iptc, r_phys)
ptc_phys = NaN(3,4);
ptc_phys(1:2,1) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0,0}, 0, geometry(iptc).rdim);
ptc_phys(1:2,2) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0,1}, 0, geometry(iptc).rdim);
ptc_phys(1:2,3) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,0}, 0, geometry(iptc).rdim);
ptc_phys(1:2,4) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,1}, 0, geometry(iptc).rdim);

ptc_left = min(ptc_phys(1,:));
ptc_right = max(ptc_phys(1,:));
ptc_bot = min(ptc_phys(2,:));
ptc_top = max(ptc_phys(2,:));

in_ptc = false;
r_param = NaN(3,1);

if ( r_phys(1) >= ptc_left && r_phys(1) <= ptc_right && r_phys(2) >= ptc_bot && r_phys(2) <= ptc_top )
	x_guess = (r_phys(1)-ptc_left) / (ptc_right-ptc_left);
	u0 = [x_guess; 0.5];
	r_param(1:2) = nrbinverse_mod_2D (geometry(iptc).nurbs, r_phys, 'u0', u0);
	if ( ~isnan(r_param(1)) && ~isnan(r_param(2)) )
		in_ptc = true;
	end
end%if
end%function
