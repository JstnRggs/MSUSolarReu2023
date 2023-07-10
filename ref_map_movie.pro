pro ref_map_movie,flare,wavelength

flare = flare
wavelength = wavelength
restore, '/nfs/hl0/data/jriggs/idldata/Flare_2/Reference/ref_map1600.sav'

aia_files = file_search('/nfs/hl0/data/jriggs/idldata/Flare_' + flare +'/AIA_'+ wavelength +'/ssw*.fts')
read_sdo,aia_files,index,data

index2map, index,data, map123
real_map = drot_map(map123, ref_map = ref_map1600)

gmap = grid_map(real_map,512,512)

xmovie,alog10(gmap.data>1.0)

end
