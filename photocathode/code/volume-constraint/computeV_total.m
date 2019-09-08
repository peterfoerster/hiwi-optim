% volume of electrod in [cm^3]
function [V_tot] = computeV_total (geometry, msh, np)
   V_vac            = computeV_vac (geometry);
   V_ptc            = computeV_cyl_mp (msh);
   V_hole           = computeV_hole (geometry, np);
   [V_full ,V_lift] = computeV_lift (np);
   [V_cable]        = computeV_cable (geometry);

   V_tot = V_vac - V_ptc - 2*V_hole - V_full + V_lift - V_cable;
   V_tot = V_tot*1e6;
end
