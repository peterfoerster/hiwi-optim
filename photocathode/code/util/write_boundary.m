function [] = write_boundary (geometry)
   nsub = 8;
   % write to .dat file
   for iptc=1:length(geometry)
      for ibnd=1:length(geometry(iptc).boundary)
         hold on;
         filename = ['boundaries' num2str(iptc) num2str(ibnd) '.dat'];
         nrbplot_dat(geometry(iptc).boundary(ibnd).nurbs, nsub, filename);
         hold off;
      end
   end
end
