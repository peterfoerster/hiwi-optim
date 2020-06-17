function [] = write_ctrl_opt (order, x)
    nrb_opt = create_nrb_opt_electrode (order);
    nrb_opt = move_ctrl_opt (nrb_opt, x);

    nsub = 100;
    % nrbctrlplot_dat(nrb_opt, nsub, ['nurbs_' num2str(iptcs(ii)) '_' num2str(ibnds(ii))]);
    nrbctrlplot(nrb_opt);
end
