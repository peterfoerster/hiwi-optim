function [outside, in_ptc, r_param, iptc] = tfr_bt_bound_top_2D (geometry, iptc, r_phys)
ptc_phys = NaN(3,4);
ptc_phys(1:2,1) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0,0}, 0, geometry(iptc).rdim);
ptc_phys(1:2,2) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0,1}, 0, geometry(iptc).rdim);
ptc_phys(1:2,3) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,0}, 0, geometry(iptc).rdim);
ptc_phys(1:2,4) = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,1}, 0, geometry(iptc).rdim);

ptc_left = min(ptc_phys(1,:));
ptc_right = max(ptc_phys(1,:));
ptc_bot = min(ptc_phys(2,:));
ptc_top = max(ptc_phys(2,:));

outside = false;
in_ptc = false;
r_param = NaN(3,1);

if ( r_phys(1) <= ptc_right )
	if (r_phys(1) >= ptc_left && r_phys(2) > ptc_top )
		outside = true;
	elseif ( r_phys(1) >= ptc_left && r_phys(2) >= ptc_bot )
		in_ptc = true;
		r_param(1) = (r_phys(1)-ptc_left) / (ptc_right-ptc_left);
		r_param(2) = (r_phys(2)-ptc_bot) / (ptc_top-ptc_bot);
	end
else
	outside = true;
end%if

if (r_phys(3) ~= 0)
	r_param = NaN(3,1);
end
end%function
