% INPUT:
%       - phi:
%       - msh:
%       - space:
%       - geometry:
%       - y_c:
% OUTPUT:
%       - E_max:

function [E_max] = computeE_max_cathode (phi, msh, space, geometry, y_c)
    % coordinate directions are flipped (rho,z => y,x)
    E     = sp_eval(phi, space, geometry, {y_c, 0}, 'gradient');
    E     = sqrt(E(1,:,:).^2 + E(2,:,:).^2);
    E_max = max(E);
end
