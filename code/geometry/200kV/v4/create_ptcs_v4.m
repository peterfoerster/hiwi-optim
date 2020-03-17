function [ptcs] = create_ptcs_v4 (electrode_boundary, vacuumchamber, vacuumchamber_inside)
   ptcs(1) = nrbcoons(vacuumchamber(21), vacuumchamber_inside(1), electrode_boundary(1), vacuumchamber(1));
   ptcs(2) = nrbcoons(vacuumchamber_inside(1), vacuumchamber_inside (2), electrode_boundary(2), vacuumchamber(2));
   ptcs(3) = nrbcoons(vacuumchamber_inside(2), vacuumchamber_inside(3), electrode_boundary(3), vacuumchamber(3));
   ptcs(4) = nrbcoons(vacuumchamber_inside(3), vacuumchamber_inside(4), electrode_boundary(4), vacuumchamber(4));
   ptcs(5) = nrbcoons(vacuumchamber_inside(4), vacuumchamber_inside(5), electrode_boundary(5), vacuumchamber(5));

   ptcs(6) = nrbcoons(electrode_boundary(6), vacuumchamber(6), vacuumchamber_inside(6), vacuumchamber_inside(5));
   ptcs(7) = nrbcoons(electrode_boundary(7), vacuumchamber(7), vacuumchamber_inside(7), vacuumchamber_inside(6));
   ptcs(8) = nrbcoons(electrode_boundary(8), vacuumchamber(8), vacuumchamber_inside(8), vacuumchamber_inside(7));
   ptcs(9) = nrbcoons(electrode_boundary(9), vacuumchamber(9), vacuumchamber_inside(9), vacuumchamber_inside(8));

   ptcs(10) = nrbcoons(vacuumchamber_inside(10), nrbreverse(vacuumchamber_inside(9)), vacuumchamber_inside(11), electrode_boundary(10));
   ptcs(11) = nrbcoons(electrode_boundary(12), vacuumchamber_inside(10), vacuumchamber_inside(12), electrode_boundary(11));

   ptcs(12) = nrbcoons(vacuumchamber_inside(13), vacuumchamber(10), vacuumchamber(11), nrbdegelev(vacuumchamber_inside(11), 1));
   ptcs(13) = nrbcoons(vacuumchamber_inside(14), vacuumchamber_inside(13), vacuumchamber(12), nrbdegelev(vacuumchamber_inside(12), 1));

   ptcs(14) = nrbcoons(vacuumchamber_inside(15), vacuumchamber_inside(14), vacuumchamber(13), electrode_boundary(13));

   ptcs(15) = nrbcoons(vacuumchamber_inside(26), vacuumchamber_inside(15), vacuumchamber(14), vacuumchamber_inside(27));
   ptcs(16) = nrbcoons(vacuumchamber_inside(18), electrode_boundary(14), vacuumchamber_inside(27), vacuumchamber_inside(28));

   ptcs(17) = nrbcoons(vacuumchamber_inside(16), vacuumchamber_inside(26), vacuumchamber(15), vacuumchamber_inside(17));
   ptcs(18) = nrbcoons(vacuumchamber_inside(20), vacuumchamber_inside(16), vacuumchamber(16), vacuumchamber_inside(19));
   ptcs(19) = nrbcoons(vacuumchamber_inside(22), vacuumchamber_inside(17), vacuumchamber_inside(19), vacuumchamber_inside(21));
   ptcs(20) = nrbcoons(vacuumchamber_inside(23), vacuumchamber_inside(18), vacuumchamber_inside(21), electrode_boundary(25));
   ptcs(21) = nrbcoons(vacuumchamber(18), vacuumchamber_inside(20), vacuumchamber(17), vacuumchamber_inside(24));
   ptcs(22) = nrbcoons(vacuumchamber(19), vacuumchamber_inside(22), vacuumchamber_inside(24), vacuumchamber_inside(25));
   ptcs(23) = nrbcoons(vacuumchamber(20), vacuumchamber_inside(23), vacuumchamber_inside(25), electrode_boundary(26));

   ptcs(24) = nrbcoons(electrode_boundary(24), electrode_boundary(15), vacuumchamber_inside(28), vacuumchamber_inside(29));
   ptcs(25) = nrbcoons(electrode_boundary(22), vacuumchamber_inside(30), electrode_boundary(23), electrode_boundary(21));
   ptcs(26) = nrbcoons(vacuumchamber_inside(30), vacuumchamber_inside(31), vacuumchamber_inside(29), electrode_boundary(20));
   ptcs(27) = nrbcoons(vacuumchamber_inside(31), electrode_boundary(18), electrode_boundary(16), electrode_boundary(19));
end
