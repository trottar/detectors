# JLEIC Software Tutorial

Edited by: Markus Diefenthaler, David Lawrence

The [Jefferson Lab Electron-Ion Collider (JLEIC)](https://eic.jlab.org/wiki/index.php/Main_Page) is a proposed realization of the Electron-Ion Collider (EIC), a new US-based facility with a versatile range of beam energies, polarizations, and species, as well as high luminosity. The EIC is required to precisely image the quarks and gluons and their interactions, to explore the new QCD frontier of strong color fields in nuclei – to understand how matter at its most fundamental level is made. The EIC has been chosen as the highest priority new construction for Nuclear Physics in the US.  

The JLEIC Software utilizes the [GEMC application](https://gemc.jlab.org/gemc/html/index.html) for detector simulations. GEMC is built upon the Geant4 toolkit and has been designed with the goal of reducing the learning curve for running Geant4 simulations. It provides a macro language for detector design that is ideal for developing detector concepts and studying detector prototypes. A graphical user interface allows to get familiar with GEMC simulations and to visualize the events in a versatile OpenGL display. In this tutorial, we describe how to run JLEIC simulations. For details on GEMC, we refer to the excellent [GEMC documentation](https://gemc.jlab.org/gemc/html/documentation/documentation.html). 
 
## Running the JLEIC Software
The JLEIC Software is provided as Docker images. The primary goal of the images is to provide an easy means for scientists to start running JLEIC simulations. Specifically targeted are persons with limited time to invest in building the software and all of its prerequisites. 

### Installing Docker
The [Docker Community Edition](https://www.docker.com/community-edition) provides the latest Docker version with integrated tooling to build, test and run container images. It is available for free for a variety of infrastructure, including Mac and Windows. 

### Obtaining the JLEIC Docker image
The JLEIC Docker images are deployed using the electronioncollider swarm on Docker Hub. The latest version can be obtained via: 
```sh
docker pull electronioncollider/jleic:1.0.0
```
> ToDo: Discuss versioning and either add a sentence about update or "The same command allows to update an existing version." in case of jleic:latest being defined. 

### Running the JLEIC Docker image
The JLEIC Docker images provide an interactive environment which can be started via: 
```sh
docker run -it --rm -p 6080:6080 -v ${PWD}:/data electronioncollider/jleic:1.0.0
```
and can be accessed via the host system’s native web browser.
```sh
  http://localhost:6080
```
> ToDo: Can we get rid of the noVNC password (e.g., [random example](https://github.com/elgalu/docker-selenium/issues/115))? Otherwise, I should mention the password.

### Working with the JLEIC Docker image

###### Examples

###### Data cards
data card (XML) to steer application, all Geant4 macro commands supported by design

###### File exchange

###### Monte Carlo input

###### Output file
