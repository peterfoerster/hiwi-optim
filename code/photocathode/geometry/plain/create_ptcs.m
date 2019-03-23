function [ptcs] = create_ptcs (cathode_boundary, vacuumchamber, vacuumchamber_inside)
  ptcs(1) = nrbcoons(cathode_boundary(1), vacuumchamber(1), vacuumchamber(11), vacuumchamber_inside(1));
  ptcs(2) = nrbcoons(cathode_boundary(2), vacuumchamber(2), vacuumchamber_inside(1), vacuumchamber_inside(2));
  ptcs(3) = nrbcoons(cathode_boundary(3), vacuumchamber(3), vacuumchamber_inside(2), vacuumchamber_inside(3));
  ptcs(4) = nrbcoons(vacuumchamber_inside(4), vacuumchamber_inside(3), cathode_boundary(4), vacuumchamber(4));
  ptcs(5) = nrbcoons(vacuumchamber_inside(5), vacuumchamber_inside(4), cathode_boundary(5), vacuumchamber(5));
  ptcs(6) = nrbcoons(vacuumchamber(6), cathode_boundary(6), vacuumchamber_inside(6), nrbreverse(vacuumchamber_inside(5)));
  ptcs(7) = nrbcoons(vacuumchamber(7), cathode_boundary(7), vacuumchamber_inside(7), vacuumchamber_inside(6));
  ptcs(8) = nrbcoons(vacuumchamber(8), vacuumchamber_inside(9), vacuumchamber_inside(8), vacuumchamber_inside(7));
  ptcs(9) = nrbcoons(vacuumchamber(9), cathode_boundary(11), vacuumchamber(10), vacuumchamber_inside(8));
  ptcs(10) = nrbcoons(vacuumchamber_inside(9), cathode_boundary(9), cathode_boundary(10), cathode_boundary(8));
end
