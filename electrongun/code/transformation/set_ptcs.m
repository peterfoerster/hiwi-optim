function [ptcs] = set_ptcs (geometry_file)
  switch (geometry_file)
  case{'gun_half_short'}
    ptcs.bt_bound_top = 7;
    ptcs.bt_bound = 8;
		ptcs.bt = [4, 6];
		ptcs.cath_bound = 11;
		ptcs.cath = 1;
		ptcs.cath_bt = [2, 3, 5, 9, 10];
  case{'gun_half_long'}
	  ptcs.bt_bound_top = 7;
	  ptcs.bt_bound = 8;
		ptcs.bt = [4, 6];
		ptcs.cath_bound = 11;
		ptcs.cath = 1;
		ptcs.cath_bt = [2, 3, 5, 9, 10];
  otherwise
		ptcs.bt_bound_top = 7;
		ptcs.bt_bound = 8;
		ptcs.bt = [4, 6];
		ptcs.cath_bound = 11;
		ptcs.cath = 1;
		ptcs.cath_bt = [2, 3, 5, 9, 10];
  end%switch
end
