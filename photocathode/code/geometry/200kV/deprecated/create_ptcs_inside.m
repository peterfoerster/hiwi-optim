function [ptcs_inside] = create_ptcs_inside (cathode_boundary, cathode_inside)
  ptcs_inside(1) = nrbcoons(cathode_inside(1), nrbdegelev(cathode_inside(3), 1), nrbdegelev(cathode_inside(2), 1), cathode_boundary(4));
  ptcs_inside(2) = nrbcoons(cathode_inside(2), nrbdegelev(cathode_inside(6), 1), cathode_boundary(17), nrbdegelev(cathode_inside(4), 1));
  ptcs_inside(3) = nrbcoons(cathode_inside(3), nrbdegelev(cathode_inside(5), 1), cathode_inside(4), cathode_boundary(5));
  ptcs_inside(4) = nrbcoons(cathode_inside(6), cathode_boundary(6), nrbdegelev(cathode_inside(7), 1), cathode_inside(5));
  ptcs_inside(5) = nrbcoons(cathode_boundary(16), nrbdegelev(cathode_inside(8), 1), nrbdegelev(cathode_inside(9), 1), cathode_inside(7));
  ptcs_inside(6) = nrbcoons(cathode_inside(10), cathode_boundary(7), cathode_boundary(8), cathode_inside(8));
  ptcs_inside(7) = nrbcoons(cathode_boundary(15), cathode_inside(10), cathode_boundary(9), cathode_inside(9));
  ptcs_inside(8) = nrbcoons(cathode_boundary(12), cathode_boundary(10), cathode_boundary(11), cathode_inside(11));
  ptcs_inside(9) = nrbcoons(cathode_boundary(13), cathode_boundary(15), cathode_inside(11), cathode_boundary(14));
end
