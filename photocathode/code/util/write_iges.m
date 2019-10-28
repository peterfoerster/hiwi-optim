function [] = write_iges (filename, geometry)
   % write to .iges file
   for iptc=1:length(geometry)
      nrb2iges(geometry(iptc).nurbs, [filename '_' num2str(iptc) '.iges']);
   end
end
