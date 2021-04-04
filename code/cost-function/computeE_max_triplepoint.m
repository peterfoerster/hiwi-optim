% INPUT:
%       - geometry:
%       - msh:
%       - space:
%       - phi:
% OUTPUT:
%       - E_max:

function [E_max] = computeE_max_triplepoint (geometry, msh, space, phi)
    ip = 23;
    x  = {1, 1};
    E = sp_eval(phi(space.gnum{ip}), space.sp_patch{ip}, geometry(ip), x, 'gradient');
    E = sqrt(E(1,:,:).^2 + E(2,:,:).^2);
    E_max = max(E);
end
