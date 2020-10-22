% INPUT:
%       - filename
%       - npts
%       - nptc

function write_cst_pointlist (filename, npts, nptc)
    P = NaN(npts^2*nptc,2);
    for ip=1:nptc
        datname = [filename '_npts=' num2str(npts) '_' num2str(ip) '.dat'];
        data = dlmread(datname)(2:end,:);
        P(((ip-1)*npts^2+1):ip*npts^2,:) = data(:,1:2);
    end
    dlmwrite('pointlist.txt', [P zeros(size(P,1),1)], ' ');
end
