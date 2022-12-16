#  Application Configuration Guide (ACG)
## Visible Band Satellite Data to Improve Ocean Model Radiative Transfer (VISOR)

The creation or integration of a software components requires the identification of those desired traits the software will present as a solution to business requirements that inspired the creation of the software component and those requirements that are necessary for actual execution.  These prerequisites are known as (computer) system requirements and are often used as a guideline as opposed to an absolute rule.

The system requirements outlined in this text were created from vendor documentation and the actual installation and configuration of the VISOR application on an execution environment within the Naval Research Lab (NRL) development labs.  Data sources were via Network File System (NFS) mounts and actual daily runs were made from an unclassified environment.

visor_gops_parser is a compiled program that reads input from a Global Oceanographic Processing System (GOPS) implementation, NetCDF based output, and generates an NCODA QC compliant, Fortran binary file.

## General Algorithm / Concept of Operations

visor_gops_parser reads in a Global Oceanogaphic Processing System (GOPS) NetCDF satellite file.  This file covers a single product and has world coverage.  visor_gops_parser acts as the PreQC stage of the NCODA QC system as a whole.  In the PreQC stage data is read in and output to a Fortran based binary file consistent with NCODA QC's ingest requirements.   Due to the size of the GOPS output the data is "sliced" into 90 to -90 (Latitude) strips and saved as an individual input to NCODA QC.  Each strip is date time stamped according to the time_coverage_end global attribute with each slice being stamped going backwards from subject time coverage.  The input received from GOPS is a merged, validated, and QC'd product thus making this program a data transformer with a single quality check applied. A boundary check which is product dependent and defaults if unaltered via CLI is performed prior to writing the optics data into subject Fortran binary file.  Any value that exceeds the boundary condition is set to the mininum / maximum threshold accordingly.  

## System Requirements

### Minimal Requirements Specification

#### ***Overall Minimal Hardware requirements:***

|Component                          | Comments                                       |
|-----------------------------------|------------------------------------------------|
|Memory                             |  8 GB                                          |
|Hard-drive space                   |  1 GB                                          |
|Processor                          | >i5 @ 2.5 GHZ                                  |
|Network                            | Standard network connectivity sufficient, not required by application but NFS mounts with insufficient network connectivity would make the program fail.       |


#### ***Overall Minimal Software requirements:***

|Component                          | Comments                                       |
|-----------------------------------|------------------------------------------------|
| Unix operating system             | CentOS Linux                                   |
| Bash Shell                        | v4+, must support hashes.                      |
| Korn Shell                        | v93+, used to support functions.               |
| make                              | Builds visor applications.                     |
| gcc                               | 4.8.5+                                         |
| Global Oceanographic Process System (GOPS) | Processes satellite imagery.          |

If built on gcc 8.5 on a CentOS 8 (Stream) platform you must install the following packages:
  - `sudo yum install epel-release`
  - `sudo dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm`
  - `sudo dnf makecache --refresh`
  - `sudo yum makecache --refresh`
  - `sudo yum install git gcc *fortran* `
  - `sudo dnf config-manager --set-enabled PowerTools`
  - `sudo dnf -y instlal dnf-plugins-core`
  - `sudo dnf upgrade`
  - `sudo yum update`
  - `sudo yum install git`
  - `sudo yum install gcc *fortran* libnetcdf-dev libnetcdff-dev netcdf netcdf-devel hdf5 hdf5-devel libjpeg* libjpeg*devel* mfhdf-devel hdf-devel`

#### ***Optional requirements:***

|Component                          | Comments                                       |
|-----------------------------------|------------------------------------------------|
| TORQUE (batch system)             | These vary so commands like qsub/qstat might need tweaking.|

### Development Environment Specification

#### ***NRL Development Environment Overview***

|Component                          | Comments                                       |
|-----------------------------------|-----------------------------------------------:|
|Memory                             | 32 GB                                          |
|Hard-drive space                   | 100 MB                                         |
|Processor                          | Intel Xeon @ 3.7 GHZ                           |
|Network                            | 100 mb network                                 |

|Software      |Version   |
|--------------|---------:|
|CentOS Linux  |v7.8.2003 | 
|make          |v3.82     |
|gcc           |v4.8.5    |

## System Architecture
No system architecture diagram exists as this program is a single executable intensed for unprivileged accounts to process an incoming NetCDF owned by the end-user and output a Fortran based binary output for NCODA QC.

## Data Delivery

No FTP/SCP calls are made outside of the NFS mount.  Data is expected to be accessible in a standard Unix file system layout.

visor_gops_parser initially sources the environmental file referncesd in the `-i` CLI argument.  Output is plated in the location specified in the `-o` option.

### Inputs
- GOPS Satellite Image:
    - Dimensions: lat(18000), lon(36000)
    - Variables: a_490_lmi, bb_490_lmi, lat, lon
	- Attributes: time_coverage_start, time_coverage_end

## User Interfaces

visor_gops_parser has no Graphical User Interface and is 100% Command Line Interface (CLI) driven.

## Web 

visor_gops_parser has no web component associated with it.  Some documentation generated by Doxygen, code source documenter, and pandoc to transform the Markdown into HyperText Markup Language (HTML) but do not require a web server or external network connectivity.

## Security

#### Accounts

No service account are required for visor_gops_parser.  It is recommended visor_gops_parser be run as a standard user account that has only those privileges that are appropriate for typical scientific computing.  If using a batch system it setup for subject user with access to appropriate queues will be necessary.

There are no roles associated with visor_gops_parser such as administrator or user.

## Database

There is no database or persistence mechanism other than the filesystem location specified on the CLI.

## Installation

See documentation in the `installation` folder.

## Using/Starting visor_gops_parser

This application requires command line interface (CLI) arguments to run.

./visor_gops_parser

+  -V, --Version, -Version   prints the version of this software package.

+  -v, --verbose, -verbose   prints debug information to standard output.

+  -c, --clobber, -clobber   overwrites outputs files without prompt.

+  -d, --debug,   -debug     prints data, lots of I/O, to screen.

+  -i, --ifile,   -ifile     name of the H5 or NetCDF input file.

+  -o, --ofile,   -ofile     name of the NCODA QC output file.

+  -p, --product, -product   name of the products you want included in the output, use double quotes to encapsulate comma separated values. no spaces between products (a_490_lmi,bb_490_lmi).

+  -s, --split,   -split     Number of times to split the data.

+  -n, --ndex,,   -ndex      If desired the individual split you want to run (can run a single slice), start at (0) zero.

+  -m, --product_min         Minimal value of optics data allowed through this system.  Default is product dependent.

+  -x, --product_max         Maximum value of optics data allowed through this system.  Default is product dependent.

+  Absorption (    0.0160,     2.5000), Backscattering (    0.0016,     1.0000)

+ Output file is the prefix intended as output will be split 9 ways with a pattern of (<ofile>_0.out, <ofile>_1.out, ...)

## Components

### visor_gops_parser

Compiled C program that this manual covers.

[visor_gops_parser Doxygen Source Code Document](../gops_parser/html/index.html)

### visor_climatology_nasa_generator

Early implementation, C, of a climatology generator using NASA 4Km climatology to generate a GDEM-like NCODA compliant climatology file for NCODA [QC, VAR].

### Jbooks

Python based Jupyter Lab (notebooks) designed to support non-formal and formal code to support the project.  Of note is the ./ncoda_NAVOClimatology_[a,bb]_HalfLogOnly.ipynb.  This reads NAVOCEANO generated climatologies processed by the Principle Investigator and stiches the input back together into a world view while halving the total data points.  NCODA only support 4 byte integers and 685M data points times 4 bytes (to represent the total potential size required for data capture) is simply too large.  Output is a GDEM-like NCODA compliant climatology file for NCODA [QC, VAR].  This application is considered a *one off* as it is used to generate an output one time used for the lifecycle of the application.

### C Requirements

Version: gcc compiler 4.8.5
Tested On: 4.8.5

Requirement: Availability of APS/GOPS libraries for NetCDF and HDF are a must.

#### Library domain for visor_gops_parser C code:

### ***Libraries***

|Library                            | Reason for Use                                 |
|-----------------------------------|------------------------------------------------|
|include <stdio.h>                  | Standard I/O library.                          |
|include <stdlib.h>                 | Standard C library for any compiled program.   |
|include <string.h>                 | String functions (str).                        |
|include <getopt.h>                 | CLI argument management.                       |
|include <unistd.h>                 | File existence checks.                         |
|include <math.h>                   | Used for fabs and log10 functions.             |
|include <errno.h>                  | Unix standard error codes.                     |
|include <time.h>                   | Time library for manipulation of dates.        |
|include "hdf5.h"                   | 3rd Party, HDF5 library.                       |
|include "hdf5_hl.h"                | 3rd Party, HDF5 "lite" library used for attribute access. |
|include <netcdf.h>                 | 3rd Party, NetCDF library.                     |
|include "log.h"                    | 3rd party logging library, inspected and approved.|
|include "libll.h"                  | Internal, Data Node Structure and linked list library.   |
|include "libNav.h"                 | Internal, Navigation Structure library         |
|include "libProduct.h"             | Internal, Product structure library.           |
|include "swapc_bytes.h"            | Internal, classic byte swapping library.       |
|include <fcntl.h>                  | File locking libraries.                        |


## Build Requirements

visor_gops_parser is a C application that requires compilation to function.  The information showing below illustrates those requirements for a successfull build.  Note that the Makefile and ./build_.sh script(s) have full details necessary to replicate compilation and linking.

### ***Compilation Directives***

|Compilation Directive              | Requirements                                                       |
|-----------------------------------|--------------------------------------------------------------------|
|Compiler used                      | gcc => /usr/bin/gcc                                                |
|Objects dir                        | ./obj                                                              |
|Executables dir                    |  ./                                                                |
|Libraries                          | -L/net/americium/export/sw/linux-x86_64-sl7/aps/local/lib          |
|Includes                           | -I/net/americium/export/sw/linux-x86_64-sl7/aps/local/include      |
|Compiling options                  | [-C -g -Wall -pedantic -fbounds-check -std=c99 -O5 -Wvariadic-macros ] |
|Linking options                    | [-lnetcdf -ljpeg -lmfhdf -ldf -lhdf5_hl -lhdf5 -ldl -lm -lz -ljpeg] |
