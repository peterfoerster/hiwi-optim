function [ptcs_vac, ptcs_el] = create_ptcs_v6 (electrode, anode_ring, inner_insulator, outer_insulator, vacuumchamber, domain_vac, domain_el)
   % anode ring
   ptcs_vac(1) = nrbcoons(domain_vac(1), vacuumchamber(1), vacuumchamber(18), anode_ring(12));
   ptcs_vac(2) = nrbcoons(domain_vac(2), domain_vac(1), vacuumchamber(17), nrbdegelev(anode_ring(11), 1));
   ptcs_vac(3) = nrbcoons(domain_vac(3), domain_vac(2), vacuumchamber(16), nrbdegelev(anode_ring(10), 1));
   ptcs_vac(4) = nrbcoons(domain_vac(4), domain_vac(3), vacuumchamber(15), anode_ring(9));
   ptcs_vac(5) = nrbcoons(anode_ring(14), anode_ring(13), nrbdegelev(anode_ring(11), 1), nrbdegelev(anode_ring(3), 1));

   % beam
   ptcs_vac(6) = nrbcoons(electrode(1), domain_vac(4), vacuumchamber(14), domain_vac(5));
   ptcs_vac(7) = nrbcoons(electrode(2), nrbreverse(anode_ring(8)), domain_vac(5), domain_vac(6));
   ptcs_vac(8) = nrbcoons(electrode(3), nrbdegelev(anode_ring(7), 1), domain_vac(6), domain_vac(7));
   ptcs_vac(9) = nrbcoons(electrode(4), nrbdegelev(anode_ring(6), 1), domain_vac(7), domain_vac(8));
   ptcs_vac(10) = nrbcoons(electrode(5), anode_ring(5), domain_vac(8), domain_vac(9));

   % front corner
   ptcs_vac(11) = nrbcoons(nrbdegelev(domain_vac(10), 1), vacuumchamber(2), anode_ring(2), vacuumchamber(3));
   ptcs_vac(12) = nrbcoons(nrbdegelev(domain_vac(11), 1), domain_vac(10), nrbdegelev(anode_ring(3), 1), vacuumchamber(4));
   ptcs_vac(13) = nrbcoons(nrbdegelev(domain_vac(12), 1), domain_vac(11), nrbdegelev(anode_ring(4), 1), vacuumchamber(5));
   ptcs_vac(14) = nrbcoons(electrode(6), domain_vac(12), domain_vac(9), domain_vac(13));

   % electrode
   ptcs_vac(15) = nrbcoons(domain_vac(14), domain_vac(13), electrode(7), vacuumchamber(6));
   ptcs_vac(16) = nrbcoons(domain_vac(15), domain_vac(14), nrbdegelev(electrode(8), 1), vacuumchamber(7));
   ptcs_vac(17) = nrbcoons(domain_vac(16), domain_vac(15), nrbdegelev(electrode(9), 1), vacuumchamber(8));
   ptcs_vac(18) = nrbcoons(domain_vac(17), electrode(10), domain_vac(18), nrbreverse(domain_vac(16)));
   ptcs_vac(19) = nrbcoons(domain_vac(19), electrode(11), outer_insulator(2), domain_vac(18));

   % back corner
   ptcs_vac(20) = nrbcoons(domain_vac(21), nrbdegelev(domain_vac(17), 1), domain_vac(20), vacuumchamber(9));
   ptcs_vac(21) = nrbcoons(vacuumchamber(11), nrbdegelev(domain_vac(21), 1), domain_vac(22), vacuumchamber(10));
   ptcs_vac(22) = nrbcoons(domain_vac(23), nrbdegelev(domain_vac(19), 1), outer_insulator(3), domain_vac(20));
   ptcs_vac(23) = nrbcoons(vacuumchamber(12), nrbdegelev(domain_vac(23), 1), outer_insulator(4), domain_vac(22));

   % outer insulator
   ptcs_vac(24) = nrbcoons(outer_insulator(10), outer_insulator(9), outer_insulator(7), outer_insulator(3));
   ptcs_vac(25) = nrbcoons(outer_insulator(5), outer_insulator(10), outer_insulator(6), outer_insulator(4));

   % lift
   ptcs_vac(26) = nrbcoons(vacuumchamber(13), domain_vac(24), inner_insulator(5), outer_insulator(6));
   ptcs_vac(27) = nrbcoons(domain_vac(24), domain_vac(25), inner_insulator(4), outer_insulator(7));
   ptcs_vac(28) = nrbcoons(domain_vac(25), domain_vac(26), inner_insulator(3), outer_insulator(8));
   ptcs_vac(29) = nrbcoons(outer_insulator(1), electrode(14), domain_vac(27), electrode(13));
   ptcs_vac(30) = nrbcoons(domain_vac(26), electrode(15), domain_vac(28), domain_vac(27));
   ptcs_vac(31) = nrbcoons(nrbreverse(inner_insulator(2)), electrode(16), inner_insulator(1), domain_vac(28));

   % inner insulator
   ptcs_vac(32) = nrbcoons(inner_insulator(12), inner_insulator(11), inner_insulator(10), inner_insulator(2));
   ptcs_vac(33) = nrbcoons(inner_insulator(13), inner_insulator(12), inner_insulator(9), inner_insulator(3));
   ptcs_vac(34) = nrbcoons(inner_insulator(14), inner_insulator(13), inner_insulator(8), inner_insulator(4));
   ptcs_vac(35) = nrbcoons(inner_insulator(6), inner_insulator(14), inner_insulator(7), inner_insulator(5));

   % electrode
   ptcs_el(1) = nrbcoons(electrode(15), electrode(5), nrbdegelev(domain_el(1), 1), domain_el(2));
   ptcs_el(2) = nrbcoons(electrode(14), electrode(6), domain_el(2), nrbdegelev(domain_el(3), 1));
   ptcs_el(3) = nrbcoons(electrode(13), electrode(7), nrbdegelev(domain_el(4), 1), domain_el(3));
   ptcs_el(4) = nrbcoons(nrbdegelev(domain_el(7), 1), nrbreverse(electrode(8)), domain_el(4), nrbdegelev(domain_el(5), 1));
   ptcs_el(5) = nrbcoons(electrode(10), domain_el(5), domain_el(6), electrode(9));
   ptcs_el(6) = nrbcoons(electrode(11), domain_el(7), electrode(12), domain_el(6));
end
