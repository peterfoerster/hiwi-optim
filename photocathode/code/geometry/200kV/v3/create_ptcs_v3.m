function [ptcs] = create_ptcs_v3 (electrode_boundary, vacuumchamber, vacuumchamber_inside)
   % tracking
   ptcs(1) = nrbcoons(vacuumchamber(25), vacuumchamber_inside(2), electrode_boundary(1), vacuumchamber_inside(1));
   ptcs(2) = nrbcoons(vacuumchamber(26), vacuumchamber_inside(3), vacuumchamber_inside(1), vacuumchamber(1));
   ptcs(3) = nrbcoons(vacuumchamber_inside(2), vacuumchamber_inside(5), electrode_boundary(2), vacuumchamber_inside(4));
   ptcs(4) = nrbcoons(vacuumchamber_inside(3), vacuumchamber_inside(6), vacuumchamber_inside(4), vacuumchamber(2));

   % right chamber
   ptcs(5) = nrbcoons(vacuumchamber_inside(5), vacuumchamber_inside(8), electrode_boundary(3), vacuumchamber_inside(7));
   ptcs(6) = nrbcoons(vacuumchamber_inside(6), vacuumchamber_inside(9), vacuumchamber_inside(7), vacuumchamber(3));
   ptcs(7) = nrbcoons(vacuumchamber_inside(8), vacuumchamber_inside(11), electrode_boundary(4), vacuumchamber_inside(10));
   ptcs(8) = nrbcoons(vacuumchamber_inside(9), vacuumchamber_inside(12), vacuumchamber_inside(10), vacuumchamber(4));
   ptcs(9) = nrbcoons(vacuumchamber_inside(11), vacuumchamber_inside(14), electrode_boundary(5), vacuumchamber_inside(13));
   ptcs(10) = nrbcoons(vacuumchamber_inside(12), vacuumchamber_inside (15), vacuumchamber_inside(13), vacuumchamber(5));
   ptcs(11) = nrbcoons(vacuumchamber_inside(14), vacuumchamber_inside(17), electrode_boundary(6), vacuumchamber_inside(16));
   ptcs(12) = nrbcoons(vacuumchamber_inside(15), vacuumchamber_inside (18), nrbdegelev(vacuumchamber_inside(16), 1), vacuumchamber(6));
   ptcs(13) = nrbcoons(vacuumchamber_inside(17), vacuumchamber(9), vacuumchamber_inside(20), vacuumchamber_inside(19));
   ptcs(14) = nrbcoons(vacuumchamber_inside(18), vacuumchamber(8), vacuumchamber_inside(19), vacuumchamber(7));

   % shape optimization
   ptcs(15) = nrbcoons(electrode_boundary(7), vacuumchamber(10), vacuumchamber_inside(21), vacuumchamber_inside(20));
   ptcs(16) = nrbcoons(electrode_boundary(8), vacuumchamber(11), vacuumchamber_inside(22), vacuumchamber_inside(21));
   ptcs(17) = nrbcoons(electrode_boundary(9), vacuumchamber(12), vacuumchamber_inside(23), vacuumchamber_inside(22));
   ptcs(18) = nrbcoons(electrode_boundary(10), vacuumchamber(13), vacuumchamber_inside(24), vacuumchamber_inside(23));
   ptcs(19) = nrbcoons(electrode_boundary(11), vacuumchamber_inside(25), nrbreverse(vacuumchamber_inside(27)), vacuumchamber_inside(24));
   ptcs(20) = nrbcoons(vacuumchamber_inside(32), vacuumchamber_inside(27), vacuumchamber_inside(30), electrode_boundary(12));
   ptcs(21) = nrbcoons(electrode_boundary(14), vacuumchamber_inside(32), vacuumchamber_inside(35), electrode_boundary(13));

   % left chamber
   ptcs(22) = nrbcoons(vacuumchamber_inside(29), vacuumchamber(15), vacuumchamber(16), nrbdegelev(vacuumchamber_inside(26), 1));
   ptcs(23) = nrbcoons(vacuumchamber_inside(28), vacuumchamber(14), vacuumchamber_inside(26), nrbdegelev(vacuumchamber_inside(25), 1));
   ptcs(24) = nrbcoons(vacuumchamber_inside(34), vacuumchamber_inside(29), vacuumchamber(17), nrbdegelev(vacuumchamber_inside(31), 1));
   ptcs(25) = nrbcoons(vacuumchamber_inside(33), vacuumchamber_inside(28), vacuumchamber_inside(31), nrbdegelev(vacuumchamber_inside(30), 1));
   ptcs(26) = nrbcoons(vacuumchamber_inside(38), vacuumchamber_inside(34), vacuumchamber(18), nrbdegelev(vacuumchamber_inside(36), 1));
   ptcs(27) = nrbcoons(vacuumchamber_inside(37), vacuumchamber_inside(33), vacuumchamber_inside(36), nrbdegelev(vacuumchamber_inside(35), 1));

   % top insulator
   ptcs(28) = nrbcoons(vacuumchamber_inside(40), vacuumchamber_inside(38), vacuumchamber(19), vacuumchamber_inside(39));
   ptcs(29) = nrbcoons(vacuumchamber_inside(41), vacuumchamber_inside(37), vacuumchamber_inside(39), electrode_boundary(15));

   ptcs(30) = nrbcoons(vacuumchamber_inside(45), vacuumchamber_inside(40), vacuumchamber(20), vacuumchamber_inside(48));
   ptcs(31) = nrbcoons(vacuumchamber_inside(44), vacuumchamber_inside(41), vacuumchamber_inside(48), vacuumchamber_inside(49));
   ptcs(32) = nrbcoons(vacuumchamber_inside(42), vacuumchamber_inside(45), vacuumchamber(21), vacuumchamber_inside(43));

   % bottom insulator
   ptcs(33) = nrbcoons(vacuumchamber_inside(46), vacuumchamber_inside(44), vacuumchamber_inside(43), electrode_boundary(25));
   ptcs(34) = nrbcoons(vacuumchamber_inside(47), vacuumchamber_inside(42), vacuumchamber(22), nrbreverse(vacuumchamber_inside(46)));

   ptcs(35) = nrbcoons(vacuumchamber(24), vacuumchamber_inside(47), vacuumchamber(23), electrode_boundary(26));

   % cable
   ptcs(36) = nrbcoons(electrode_boundary(24), electrode_boundary(16), vacuumchamber_inside(49), vacuumchamber_inside(50));

   % lift
   ptcs(37) = nrbcoons(electrode_boundary(22), vacuumchamber_inside(51), electrode_boundary(23), electrode_boundary(21));
   ptcs(38) = nrbcoons(vacuumchamber_inside(51), vacuumchamber_inside(52), vacuumchamber_inside(50), electrode_boundary(20));
   ptcs(39) = nrbcoons(vacuumchamber_inside(52), electrode_boundary(18), electrode_boundary(17), electrode_boundary(19));
end
