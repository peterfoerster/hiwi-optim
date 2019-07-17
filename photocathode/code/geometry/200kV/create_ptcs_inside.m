function [ptcs_inside] = create_ptcs_inside (cathode_boundary, cathode_inside)
  ptcs_inside(1) = nrbcoons(cathode_inside(1), cathode_inside(3), cathode_inside(2), cathode_boundary(4));
  ptcs_inside(2) = nrbcoons(cathode_inside(2), cathode_inside(6), cathode_boundary(17), cathode_inside(4));
  ptcs_inside(3) = nrbcoons(cathode_inside(3), cathode_inside(5), cathode_inside(4), cathode_boundary(5));
  ptcs_inside(4) = nrbcoons(cathode_inside(6), cathode_boundary(6), cathode_inside(7), cathode_inside(5));
  ptcs_inside(5) = nrbcoons(cathode_boundary(16), cathode_inside(8), cathode_inside(9), cathode_inside(7));
  ptcs_inside(6) = nrbcoons(cathode_inside(10), cathode_boundary(7), cathode_boundary(8), cathode_inside(8));
  ptcs_inside(7) = nrbcoons(cathode_boundary(15), cathode_inside(10), cathode_boundary(9), cathode_inside(9));
  ptcs_inside(8) = nrbcoons(cathode_boundary(12), cathode_boundary(10), cathode_boundary(11), cathode_inside(11));
  ptcs_inside(9) = nrbcoons(cathode_boundary(13), cathode_boundary(15), cathode_inside(11), cathode_boundary(14));
end
