function [outside_ptcs] = create_outside_ptcs (electrode_boundary, cathode, vacuumchamber, vacuumchamber_inside)
outside_ptcs(1) = nrbcoons(cathode(1), vacuumchamber(1), vacuumchamber(11), vacuumchamber_inside(1));
outside_ptcs(2) = nrbcoons(cathode(2), vacuumchamber(2), vacuumchamber_inside(1), vacuumchamber_inside(2));
outside_ptcs(3) = nrbcoons(electrode_boundary(1), vacuumchamber(3), vacuumchamber_inside(2), vacuumchamber_inside(3));
outside_ptcs(4) = nrbcoons(electrode_boundary(2), vacuumchamber(4), vacuumchamber_inside(3), vacuumchamber_inside(4));
outside_ptcs(5) = nrbcoons(vacuumchamber_inside(5), vacuumchamber_inside(4), electrode_boundary(3), vacuumchamber(5));
outside_ptcs(6) = nrbcoons(vacuumchamber_inside(6), vacuumchamber_inside(5), electrode_boundary(4), vacuumchamber(6));
outside_ptcs(7) = nrbcoons(vacuumchamber(7), electrode_boundary(5), vacuumchamber_inside(7), nrbreverse(vacuumchamber_inside(6)));
outside_ptcs(8) = nrbcoons(vacuumchamber(8), electrode_boundary(6), vacuumchamber_inside(8), vacuumchamber_inside(7));

% kink will change this
outside_ptcs(9) = nrbcoons(vacuumchamber_inside(9), electrode_boundary(9), cathode(3), electrode_boundary(8));

outside_ptcs(10) = nrbcoons(vacuumchamber_inside(8), vacuumchamber_inside(9), vacuumchamber_inside(10), electrode_boundary(7));

outside_ptcs(11) = nrbcoons(vacuumchamber(9), cathode(4), vacuumchamber(10), vacuumchamber_inside(10));
% make the interfaces match
outside_ptcs(11) = nrbdegelev(outside_ptcs(11), [1 1]);
end
