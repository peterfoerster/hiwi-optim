function [ptcs_lift] = create_ptcs_lift (cathode_boundary, lift_inside, vacuumchamber, cathode_inside)
  ptcs_lift(1) = nrbcoons(vacuumchamber(17), lift_inside(1), lift_inside(6), cathode_boundary(1));
  ptcs_lift(2) = nrbcoons(lift_inside(2), cathode_inside(1), lift_inside(3), cathode_boundary(3));
  ptcs_lift(3) = nrbcoons(lift_inside(4), cathode_boundary(18), lift_inside(5), lift_inside(3));
  ptcs_lift(4) = nrbcoons(lift_inside(5), cathode_boundary(20), cathode_boundary(21), cathode_boundary(19));
  ptcs_lift(5) = nrbcoons(lift_inside(1), lift_inside(2), lift_inside(4), cathode_boundary(2));
end
