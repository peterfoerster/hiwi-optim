% volume of electrode in [cm^3]
function [V_tot] = computeV_total (geometry, msh, np)
   V_vac   = computeV_vac (geometry, 21, 5);
   V_ptc   = computeV_cyl_mp (msh);
   V_con   = computeV_connector (geometry, 14, 27);
   V_hole  = computeV_hole (geometry, np, 8, 27);
   V_lift  = computeV_lift (geometry, 25, 25);
   V_cable = computeV_cable (geometry, 24, 24);
   V_tot = (V_vac - V_ptc - V_con - 2*V_hole - V_lift - V_cable)*1e6;
end
