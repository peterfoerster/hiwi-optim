function [domain] = discretize_electrode_v6 (electrode)
    p1 = nrbeval(electrode(16), 1);
    p2 = nrbeval(electrode(4), 1);
    domain(1) = nrbline(p1, p2);

    p1 = nrbeval(electrode(15), 1);
    p2 = nrbeval(electrode(5), 1);
    domain(2) = nrbline(p1, p2);

    p1 = nrbeval(electrode(14), 1);
    p2 = nrbeval(electrode(6), 1);
    domain(3) = nrbline(p1, p2);

    p1 = nrbeval(electrode(12), 1);
    p2 = nrbeval(electrode(7), 0);
    domain(4) = nrbline(p1, p2);

    p1 = nrbeval(electrode(11), 1);
    p2 = nrbeval(electrode(9), 1);
    p1 = [235e-3 p1(2)];
    domain(5) = nrbline(p1, p2);

    p1 = nrbeval(electrode(11), 1);
    p2 = nrbeval(domain(5), 0);
    domain(6) = nrbline(p1, p2);

    p1 = nrbeval(electrode(12), 1);
    p2 = nrbeval(domain(5), 0);
    domain(7) = nrbline(p1, p2);
end
