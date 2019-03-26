% multipatch

function [errh1, errl2, errh1s] = mp_sp_h1_error_ref (space_ref, msh_ref, u_ref, u_conv, space_conv, geometry)
if (space_ref.npatch ~= msh_ref.npatch)
	error ('The number of patches does not coincide')
end

for iptc = 1:msh_ref.npatch
	% added part for reference solution
	if (isempty (space_ref.dofs_ornt))
		u_ptc_ref = u_ref(space_ref.gnum{iptc});
	else
		u_ptc_ref = u_ref(space_ref.gnum{iptc}) .* space_ref.dofs_ornt{iptc}.';
	end%if
	if (isempty (space_conv.dofs_ornt))
		u_ptc_conv = u_conv(space_conv.gnum{iptc});
	else
		u_ptc_conv = u_conv(space_conv.gnum{iptc}) .* space_conv.dofs_ornt{iptc}.';
	end
	% single patch
	[error_h1(iptc), error_l2(iptc), error_h1s(iptc)] = sp_h1_error_ref (msh_ref.msh_patch{iptc}, space_ref.sp_patch{iptc}, u_ptc_ref, u_ptc_conv, space_conv.sp_patch{iptc}, geometry(iptc));
end
errl2 = sqrt (sum (error_l2 .* error_l2));
errh1 = sqrt (sum (error_h1 .* error_h1));
errh1s = sqrt (sum (error_h1s .* error_h1s));
end
