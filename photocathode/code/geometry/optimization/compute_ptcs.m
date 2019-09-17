function [ptcs] = compute_ptcs (N_inc, x)
cathode_boundary     = create_cathodeboundary();
vacuumchamber        = create_vacuumchamber (cathode_boundary);
vacuumchamber_inside = divide_vacuumchamber (cathode_boundary, vacuumchamber);

ptcs = create_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside);

% elevate degree N_inc times
for ii=1:N_inc
   if (ii == 1)
      iptcs = [7 8 9];
      ibnds = [3 3 3];
      ptcs = create_ptcs_increase (ptcs, iptcs, ibnds);
   else
      % additional edges required for continuity in IGA
      iptcs = [6 7 8 9 12 13 11 14];
      ibnds = [3 3 3 3  2  2  2  2];
      ptcs = create_ptcs_increase (ptcs, iptcs, ibnds);
   end
end

% move control points
iptcs = [6 7 8 9 12 13];
ibnds = [3 3 3 3  2  2];
ptcs = create_ptcs_move (ptcs, iptcs, ibnds, x, N_inc);
end
