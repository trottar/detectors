# JLEIC Software Example

Edited by: David Lawrence, Markus Diefenthaler.
Version: 1.0.2

The quick-start tutorials for the JLEIC Software are comprised of examples for exercising JLEIC simulation software in the JLEIC Docker image. More detailed information is provided in the JLEIC Software Tutorial available in /eic/doc/Tutorial.md and on the [JLEIC DocDB](https://jleic-docdb.jlab.org/cgi-bin/public/ShowDocument?docid=186).

## Viewing the JLEIC Detector
This example starts GEMC and allows to visualize the JLEIC Detector: 
```sh
1. cd /eic/doc/examples
2. gemc example.gcard
```

## Simulating events
This example will run GEMC in batch mode and produce a ROOT file, hits.root, that can be used to browse and plot data: 
```sh
1. cd /eic/doc/examples
2. gemc -INPUT_GEN_FILE="LUND,pythia-sample.lund" \
        -OUTPUT="evio,hits.evio" \
        -USE_GUI=0 \
        example.gcard
3. evio2root -INPUTF=hits.evio
```

## Drawing hits
This example will visualize hits in the JLEIC Detector in a ROOT macro. You can use the mouse to rotate the view in the ROOT window. 
```sh
1. root hits.root -x DrawHits.C
```

