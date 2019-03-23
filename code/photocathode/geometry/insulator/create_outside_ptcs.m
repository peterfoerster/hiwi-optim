function [outside_ptcs] = create_outside_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside)
  outside_ptcs(1) = nrbcoons(cathode_boundary(1), vacuumchamber(1), vacuumchamber(12), vacuumchamber_inside(1));
  outside_ptcs(2) = nrbcoons(cathode_boundary(2), vacuumchamber(2), vacuumchamber_inside(1), vacuumchamber_inside(2));
  outside_ptcs(3) = nrbcoons(cathode_boundary(3), vacuumchamber(3), vacuumchamber_inside(2), vacuumchamber_inside(3));
  outside_ptcs(4) = nrbcoons(vacuumchamber_inside(4), vacuumchamber_inside(3), cathode_boundary(4), vacuumchamber(4));
  outside_ptcs(5) = nrbcoons(vacuumchamber_inside(5), vacuumchamber_inside(4), cathode_boundary(5), vacuumchamber(5));
  outside_ptcs(6) = nrbcoons(vacuumchamber(6), cathode_boundary(6), vacuumchamber_inside(6), nrbreverse(vacuumchamber_inside(5)));
  outside_ptcs(7) = nrbcoons(vacuumchamber(7), cathode_boundary(7), vacuumchamber_inside(7), vacuumchamber_inside(6));
  outside_ptcs(8) = nrbcoons(vacuumchamber(8), cathode_boundary(8), vacuumchamber_inside(8), vacuumchamber_inside(7));
  outside_ptcs(9) = nrbcoons(vacuumchamber(9), vacuumchamber_inside(10), vacuumchamber_inside(9), vacuumchamber_inside(8));
  outside_ptcs(10) = nrbcoons(vacuumchamber(10), cathode_boundary(16), vacuumchamber(11), vacuumchamber_inside(9));
  outside_ptcs(11) = nrbcoons(vacuumchamber_inside(10), vacuumchamber_inside(11), cathode_boundary(15), cathode_boundary(9));
  outside_ptcs(12) = nrbcoons(cathode_boundary(10), cathode_boundary(14), nrbreverse(vacuumchamber_inside(11)), vacuumchamber_inside(12));
  outside_ptcs(13) = nrbcoons(nrbreverse(vacuumchamber_inside(12)), cathode_boundary(12), cathode_boundary(13), cathode_boundary(11));
end
