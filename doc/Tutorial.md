# JLEIC Software Tutorial

Edited by: Markus Diefenthaler, David Lawrence
Version: 1.0.2

The [Jefferson Lab Electron-Ion Collider (JLEIC)](https://eic.jlab.org/wiki/index.php/Main_Page) is a proposed realization of the Electron-Ion Collider (EIC), a new US-based facility with a versatile range of beam energies, polarizations, and species, as well as high luminosity. The EIC is required to precisely image the quarks and gluons and their interactions, to explore the new QCD frontier of strong color fields in nuclei – to understand how matter at its most fundamental level is made. The EIC has been chosen as the highest priority new construction for Nuclear Physics in the US.  

The JLEIC Software utilizes the [GEMC application](https://gemc.jlab.org/gemc/html/index.html) for detector simulations. GEMC is built upon the Geant4 toolkit and has been designed with the goal of reducing the learning curve for running Geant4 simulations. It provides a macro language for detector design that is ideal for developing detector concepts and studying detector prototypes. A graphical user interface allows to get familiar with GEMC simulations and to visualize the events in a versatile OpenGL display. In this tutorial, we describe how to run JLEIC simulations. For details on GEMC, we refer to the excellent [GEMC documentation](https://gemc.jlab.org/gemc/html/documentation/documentation.html). 
 
## Running the JLEIC Software
The JLEIC Software is provided as Docker images. The primary goal of the images is to provide an easy means for scientists to start running JLEIC simulations. Specifically targeted are persons with limited time to invest in building the software and all of its prerequisites. 

### Installing Docker
The [Docker Community Edition](https://www.docker.com/community-edition) provides the latest Docker version with integrated tooling to build, test and run container images. It 
is available for free for a variety of infrastructure, including Mac and Windows. Please follow the instructions to install, configure, and test Docker on your system.

### Obtaining the JLEIC Docker image
The JLEIC Docker images are deployed using the electronioncollider swarm on Docker Hub. The latest version can be obtained via: 
```sh
docker pull electronioncollider/jleic:1.0.2
```
This requires the Docker to be running on the local system.

### Running the JLEIC Docker image
The JLEIC Docker images provide an interactive environment which can be started via: 
```sh
docker run -it --rm -p 6080:6080 -v ${PWD}:/data electronioncollider/jleic:1.0.2
```
and can be accessed via the host system’s native web browser.
```sh
  http://localhost:6080
```
This requires the Docker to be running on the local system.


### Working with the JLEIC Docker image

#### Examples
Quick-start tutorials are comprised of examples for exercising the JLEIC Software in the Docker image. The examples are provided inside the image in **/eic/doc/examples** and include all required input files. 

#### File exchange
The working directory on the local host is mounted in the Docker image on **/data**. This has been specified in the *docker run* commend via the option of *-v ${PWD}:/data*. A **/specific/directory/** on the local host can be specified via 
```sh 
docker run -it --rm -p 6080:6080 -v /specific/directory/:/data electronioncollider/jleic:1.0.2
``` 
This allows to transfer files between the local host and the Docker image and to store simulation results on the local host. 

#### Gcards
The [GEMC options](https://gemc.jlab.org/gemc/html/documentation/options.html?highlight=gcard) can be specified via gcards. The configuration files in the XML markup language allow to steer GEMC and to document the detector configuration and simulation parameters. An example is provided in **/eic/doc/examples/example.gcard**. 

#### Geometry
Details of the geometry can be found in **/eic/geometry/eic/geometry**.

#### Generated events
GEMC has a built-in particle gun that can be configured via the GUI. It can also read in Monte Carlo events provided the output of the Monte Carlo Event Generator is in or has been converted to the [LUND format](https://gemc.jlab.org/gemc/html/documentation/generator/lund.html). An example file is available in **/eic/doc/examples/pythia-sample.lund**.

#### Simulated Data
Simulated data is written to an EVIO file and then converted into a ROOT file with the evio2root application. The generated event information is stored in the *generated* TTree; the detector hit information is stored in the *flux* TTree. The *id* field specifies which detector the hit came from, e.g.:

* 31000: EMCAL: Barrel
* 34000: EMCAL: Upstream outer
* 35000: EMCAL: Upstream inner
* 50XXX: Silicon Tracker
* 52X00: GEM: Downstream (X=7,8,9)
* 53X00: GEM/TRD (X=0,1)
* 53X00: GEM: Upstream (X=5,6,7,8,9)

