

JLEIC container example README

Jan. 31, 2018  David Lawrence


# INTRODUCTION

This provides an example for exercising JLEIC simulation
software in this container. 

# Quick Start

## View Geometry

1.)  cd /eic/examples

2.)  gemc eic_example.gcard


## Simulate events

1.)  cd /eic/examples

2.)  gemc -INPUT_GEN_FILE="LUND,pythiaCharmDIS_sample.txt" \
          -OUTPUT="evio,sample_out.evio" \
		  -USE_GUI=0 \
		  eic_example.gcard

3.)  evio2root -INPUTF=sample_out.evio

This should produce a file sample_out.root that can be 
used to browse and plot data. 

## Draw Hits

1.)  root sample_out.root -x DrawHits.C


Use the mouse to rotate the view.



# DETAILS

## Generated Events

gemc has a built in particle gun that can be configured via
the GUI. It will also accept events read from a file in the
LUND format. An example file is present in:

/eic/examples



## Accessing Simulated Data

Simulated data is written to an EVIO file and then converted
into a ROOT file with the evio2root (see Quick Start above).
The generated particle information is stored in the "generated"
TTree. Detector hit information is stored in the "flux" tree.

example 1: Plot x,y,z of all hits for all detectors.

Assuming you are in the /eic/examples directory:

$ root -l sample_out.root
root [1] flux->Draw("avg_z:avg_y:avg_x", "abs(avg_z)<5000")

You can use the mouse to rotate the view in the ROOT window.



# Geometry

The hit data for all detectors is stored in the "flux" tree.
The "id" field specifies which detector the hit came from.
Below is a rough map of what each id value corresponds to. Details
of the geometry can be found in /eic/geometry/eic/geometry.


31000 EMCAL: Barrel
34000 EMCAL: Upstream outer
35000 EMCAL: Upstream inner


50XXX Silicon Tracker
52X00 GEM: Downstream (X=7,8,9)
53X00 GEM/TRD:        (X=0,1)
53X00 GEM: Upstream   (X=5,6,7,8,9)


