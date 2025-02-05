#!/usr/bin/python3

import jnius_config
import sys

jnius_config.set_classpath('terra121_classes')
from jnius import autoclass

A = 6378137.0
B = 6356752.3142

ModifiedAirocean = autoclass("io.github.terra121.projection.ModifiedAirocean")
ScaleProjection = autoclass("io.github.terra121.projection.ScaleProjection")
GeographicProjection = autoclass("io.github.terra121.projection.GeographicProjection")
Orientation = autoclass("io.github.terra121.projection.GeographicProjection$Orientation")

base_projection = GeographicProjection.orientProjection(ModifiedAirocean(), Orientation.none)
projection = ScaleProjection(base_projection, 7318261.522857145, -7318261.522857145)

if __name__ == "__main__":
    multiprocessing.freeze_support()
#    print(projection.fromGeo(0, 51.5))
#    print(projection.toGeo(*projection.fromGeo(0, 51.5)))

#    print ('Number of arguments:', len(sys.argv), 'arguments.')
#    print ('Argument List:', str(sys.argv))

    if len(sys.argv)==3:
#        print ('arg[1]='+sys.argv[1])
#        print ('arg[2]='+sys.argv[2])
        LAT=float(sys.argv[1])
        LON=float(sys.argv[2])
#        print (LAT)
#        print (LON)
        COORDS=projection.fromGeo(LAT,LON)
        print ( 'X=' + str(COORDS[0]) + ' , Z=' + str(COORDS[1]) )
        REGIONX=int(COORDS[0]/512)
        REGIONZ=int(COORDS[1]/512)
        print ( 'region ' + str(REGIONX) + '.' + str(REGIONZ) )
    elif len(sys.argv)==5:
        LON_WEST=float(sys.argv[1])
        LAT_NORTH=float(sys.argv[2])
        LON_EAST=float(sys.argv[3])
        LAT_SOUTH=float(sys.argv[4])
        TOP_LEFT=projection.fromGeo(LON_WEST,LAT_NORTH)
        TOP_RIGHT=projection.fromGeo(LON_EAST,LAT_NORTH)
        BOTTOM_LEFT=projection.fromGeo(LON_WEST,LAT_SOUTH)
        BOTTOM_RIGHT=projection.fromGeo(LON_EAST,LAT_SOUTH)
        
        print ('top left:    ' + 'X=' + str(TOP_LEFT[0]) + ' , Z=' + str(TOP_LEFT[1]) )
        print ('top right:   ' + 'X=' + str(TOP_RIGHT[0]) + ' , Z=' + str(TOP_RIGHT[1]) )
        print ('bottom left: ' + 'X=' + str(BOTTOM_LEFT[0]) + ' , Z=' + str(BOTTOM_LEFT[1]) )
        print ('bottom right:' + 'X=' + str(BOTTOM_RIGHT[0]) + ' , Z=' + str(BOTTOM_RIGHT[1]) )
        
        
        
#    I = 0
#    for opt in sys.argv: 
#        print ('arg['+str(I)+']=' + str(opt))
#        I=I+1
        
#    print(projection.fromGeo(40.689632,-74.045263))
