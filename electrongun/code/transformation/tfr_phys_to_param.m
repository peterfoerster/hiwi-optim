% TFR_PHYS_TO_PARAM: Transforms the physical coordinates of a point into the parametrical coordinates of that point.
%
% The function evaluates all possible patches in an efficient order to find the patch where the particle is located.
% The parametric coordinates of that particle are then computed.
%
% INPUT:
%
%	geometry:				gun geometry
%
%	ptcs:						contains fields that sort the patches depending on their transformation
%		- bt_bound_top:	beamtube boundary top
%		- bt_bound:			beamtube boundary
%		- bt:					beamtube
%		- cath_bound:		cathode boundary
%		- cath:				cathode
%		- cath_bt:			cathode beamtube
%
%	r_phys:					particle position of the form r(1:3,1) in physical space
%
% OUTPUT:
%
%  outside:				true, if the point is outside the geometry
%  r_param:				particle position of the form r(1:3,1) in parameter space
%  iptc:					index of the patch that the particle is inside of

function [outside, r_param, iptc] = tfr_phys_to_param (geometry, ptcs, r_phys)
negative = false;
if ( r_phys(2)<0 )
	r_phys(2) = -r_phys(2);
	negative = true;
end

% bt_bound_top
[outside, in_ptc, r_param, iptc] = tfr_bt_bound_top_2D (geometry, ptcs.bt_bound_top, r_phys);

% bt_bound
if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	ii = 1;
	while ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) && ii <= length(ptcs.bt_bound) )
	[outside, in_ptc, r_param, iptc] = tfr_bt_bound_2D (geometry, ptcs.bt_bound(ii), r_phys);
	ii = ii + 1;
	end%while
end

% bt
if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	ii = 1;
	while ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) && ii <= length(ptcs.bt) )
		[in_ptc, r_param, iptc] = tfr_bt_2D (geometry, ptcs.bt(ii), r_phys);
		ii = ii + 1;
	end%while
end

% cath_bound
if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	[outside, in_ptc, r_param, iptc] = tfr_cath_bound_2D (geometry, ptcs.cath_bound, r_phys);
end

% cath
if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	[in_ptc, r_param, iptc] = tfr_cath_2D (geometry, ptcs.cath, r_phys);
end

% cath_bt
if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	ii = 1;
	while ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) && ii <= length(ptcs.cath_bt) )
		[in_ptc, r_param, iptc] = tfr_cath_bt_2D (geometry, ptcs.cath_bt(ii), r_phys);
		ii = ii + 1;
	end%while
end

if ( outside == false && in_ptc == false && isnan(r_param(1)) && isnan(r_param(2)) )
	outside = true;
end

if ( negative && outside == false && in_ptc == true && ~isnan(r_param(1)) && ~isnan(r_param(2)) )
	r_param(2) = -r_param(2);
end
end%function
