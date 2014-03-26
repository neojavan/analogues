###############
##General Run##
###############

options(warn=-1)
require(Analogues)
data(zones)
data(sim_index_table)

params = createParameters(x=-76.518, 
		  y=3.405, 
		  method="ccafs", 
		  model=c("ensemble","current"), 
		  vars=c("tmean","prec"), 
		  weights=c(0.5,0.5), 
		  ndivisions=c(12,12), 
		  env.data=c("/box0_p1/data/portals/ccafs-analogues/tiles"), 
		  ext=".tif", 
		  direction="backward", 
		  growing.season=1:3, 
		  rotation="both", 
		  period=c("2020_2049","1960_1990"),
		  zones=c("col","col"), 
		  resolution=c("30s","30s"), 
		  scenario=c("a1b","baseline"), 
		  outfile="/tmp/COL_1393509766157/", 
		  threshold=0.0)

results = calc_similarity(params)

merge_tiles(params)

results1=raster("/box0_p1/egiron/analogues_results/COL_1393509766157.tif")

plot(results1)
points(params$x,params$y,col="red",pch=16)
	