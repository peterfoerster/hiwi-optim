function [ptcs] = create_electrode_ptcs (electrode_boundary, electrode_ptcs)
ptcs(1) = nrbcoons(electrode_boundary(11), electrode_ptcs(1), electrode_boundary(10), electrode_boundary(1));

ptcs(2) = nrbcoons(electrode_ptcs(1), electrode_ptcs(2), electrode_ptcs(3), electrode_boundary(2));

ptcs(3) = nrbcoons(electrode_ptcs(3), electrode_ptcs(7), electrode_ptcs(6), electrode_ptcs(5));

ptcs(4) = nrbcoons(electrode_ptcs(2), electrode_ptcs(4), electrode_ptcs(5), electrode_boundary(3));

ptcs(5) = nrbcoons(electrode_ptcs(7), electrode_boundary(4), electrode_ptcs(8), electrode_ptcs(4));

ptcs(6) = nrbcoons(electrode_boundary(9), electrode_boundary(5), electrode_ptcs(8), electrode_ptcs(4));
end
