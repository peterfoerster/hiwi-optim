function [ptcs] = create_ptcs_v5 (electrode_boundary, vacuumchamber, vacuumchamber_inside)
   % vertical
   ptcs(1) = nrbcoons(vacuumchamber(19), vacuumchamber_inside(1), electrode_boundary(1), vacuumchamber(1));
   ptcs(2) = nrbcoons(vacuumchamber_inside(1), vacuumchamber_inside (2), electrode_boundary(2), vacuumchamber(2));
   ptcs(3) = nrbcoons(vacuumchamber_inside(2), vacuumchamber_inside(3), electrode_boundary(3), vacuumchamber(3));
   ptcs(4) = nrbcoons(vacuumchamber_inside(3), vacuumchamber_inside(4), electrode_boundary(4), vacuumchamber(4));
   ptcs(5) = nrbcoons(vacuumchamber_inside(4), vacuumchamber_inside(5), electrode_boundary(5), vacuumchamber(5));

   % horizontal
   ptcs(6) = nrbcoons(electrode_boundary(6), vacuumchamber(6), vacuumchamber_inside(6), vacuumchamber_inside(5));
   ptcs(7) = nrbcoons(electrode_boundary(7), vacuumchamber(7), vacuumchamber_inside(7), vacuumchamber_inside(6));
   ptcs(8) = nrbcoons(electrode_boundary(8), vacuumchamber_inside(9), nrbreverse(vacuumchamber_inside(8)), vacuumchamber_inside(7));

   % vertical
   ptcs(9) = nrbcoons(electrode_boundary(10), vacuumchamber_inside(8), vacuumchamber_inside(11), electrode_boundary(9));
   ptcs(10) = nrbcoons(vacuumchamber_inside(10), vacuumchamber(8), vacuumchamber(9), nrbdegelev(vacuumchamber_inside(9), 1));
   ptcs(11) = nrbcoons(vacuumchamber_inside(12), vacuumchamber_inside(10), vacuumchamber(10), nrbdegelev(vacuumchamber_inside(11), 1));

   % upper insulator
   ptcs(12) = nrbcoons(vacuumchamber_inside(13), vacuumchamber_inside(12), vacuumchamber(11), electrode_boundary(11));
   ptcs(13) = nrbcoons(vacuumchamber_inside(24), vacuumchamber_inside(13), vacuumchamber(12), vacuumchamber_inside(25));
   ptcs(14) = nrbcoons(vacuumchamber_inside(16), electrode_boundary(12), vacuumchamber_inside(25), vacuumchamber_inside(26));

   % lower insulator
   ptcs(15) = nrbcoons(vacuumchamber_inside(14), vacuumchamber_inside(24), vacuumchamber(13), vacuumchamber_inside(15));
   ptcs(16) = nrbcoons(vacuumchamber_inside(17), vacuumchamber_inside(14), vacuumchamber(14), vacuumchamber_inside(18));
   ptcs(17) = nrbcoons(vacuumchamber_inside(19), vacuumchamber_inside(15), vacuumchamber_inside(18), vacuumchamber_inside(20));
   ptcs(18) = nrbcoons(vacuumchamber_inside(21), vacuumchamber_inside(16), vacuumchamber_inside(20), electrode_boundary(22));

   % cable
   ptcs(19) = nrbcoons(vacuumchamber(16), vacuumchamber_inside(17), vacuumchamber(15), vacuumchamber_inside(22));
   ptcs(20) = nrbcoons(vacuumchamber(17), vacuumchamber_inside(19), vacuumchamber_inside(22), vacuumchamber_inside(23));
   ptcs(21) = nrbcoons(vacuumchamber(18), vacuumchamber_inside(21), vacuumchamber_inside(23), electrode_boundary(23));

   % cable & lift
   ptcs(22) = nrbcoons(electrode_boundary(21), electrode_boundary(13), vacuumchamber_inside(26), vacuumchamber_inside(27));
   ptcs(23) = nrbcoons(electrode_boundary(19), vacuumchamber_inside(28), electrode_boundary(20), electrode_boundary(18));
   ptcs(24) = nrbcoons(vacuumchamber_inside(28), vacuumchamber_inside(29), vacuumchamber_inside(27), electrode_boundary(17));
   ptcs(25) = nrbcoons(vacuumchamber_inside(29), electrode_boundary(15), electrode_boundary(14), electrode_boundary(16));
end
