#  Title: Application Configuration Guide (ACG) Standard

## Definition:
The Application Configuration Guide is any document or collection of documents used to configure the application.

## Requirements/Specifications/Guidelines:
An ACG must exist with preference for a Markdown document registered within an artifact repository, see Configuration Management standard.  Utilize the template provided below to build out your content.  *It should be noted that large portions of this document might simply reference: an automated build script, an Ansible or Puppet deployment, and related automation heavy functions.  The reader must be able to find, review, and act upon (assuming appropriate roles) this knowledge. Do not feel compelled to generate paperwork for the sake of paperwork.  Embrace the spirit of this standard by ensuring a map of all knowledge about the application is created in relation to it's configuration.*

## Measurable and Actionable:
Inspection of the ACG should reveal a means of compiling, starting, and configing the application.  Any representative of the sponsor that is of sufficient technical background (typically a middle-ware admin) must be able to understand and deploy the application along with start and configure it.

## Purpose:
By following a configuration guide, teams ensure:

+ Consistent deployments: The application can run reliably in development, testing, and production environments by simply adjusting configuration files rather than altering code.

+ Security and compliance: Sensitive data such as credentials and access keys are managed outside of the code, supporting strict access controls and regulatory requirements.

+ Rapid updates and scaling: Configuration changes can be made quickly, even in real-time, to accommodate updates, incident response, or scaling demands—without downtime or code changes.

+ Simplified maintenance: Structured, centralized documentation reduces complexity in multi-environment scenarios and facilitates troubleshooting, onboarding, and knowledge transfer.

+ Industry best practices recommend using human-readable configuration files (e.g., JSON, YAML), environment variables, or command-line arguments to manage these settings. This approach is a key tenet of modern software deployment methodologies such as the twelve-factor app principle, DevOps, and CI/CD pipelines. Ultimately, an application configuration guide helps teams deliver secure, compliant, and consistent software solutions efficiently.

## Timeliness:
Review of the ACG should occur, minimally, after each Sprint Demonstration thus ensuring anything eligible for deployment is updated in the ACG.  Update should be part of the deployment package.  Refer to the Software Delivery Standards for inclusion of this artifact with a numbered deployment.

## Reference
 APSC-DV-003285, An Application Configuration Guide must be created and included with the application.
___________________________________________________________________________________________________________________________
# **Template**

# Application Configuration Guide (ACG) for [Software Application Name]

## Components of the [Software Application Name]

The creation or integration of a software components requires the identification of those desired traits the software will present as a solution to business requirements that inspired the creation of the software component and those requirements that are necessary for actual execution.  These prerequisites are known as (computer) system requirements and are often used as a guideline as opposed to an absolute rule.

The system requirements outlined in this text were created from vendor documentation and the actual installation and configuration of the [Software Application Name] on an execution environment within the following environments:

+ enumerate a list of environments by recognized name (preferablly the ATO name)

Data sources were accessed via

+ enumrate means of access such as Network File System (NFS) mounts

Describe the overall setup of the application.  Is it a Java WAR running on an Application Server, is it a Bash only invoked set of scientific applications written in C, give a 50K view of the setup.

***Example: [Software Application Name] is comprised of its own scripting infrastructure in the Korn Shell as well as various other sub-components and can be called via a batch system or in a more linear fashion directoy on the command line.  The following is a description of each component and the minimal requirements associated with them.  Information such as library requirements is also included with each aspect of this system.***

## [Software Application Name] Version

Use semantic versioning standards to version your application and either reference a version manifest relating each task tracking id ,see Tracking System Standard, to the version release. 

***Example:***
|Version    | Id(s) of Change | Description of Release|
|-----------|-----------------|-----------------------|
|1.0        |32,33,101        |Initial release of software based on identified requirements involving CRUD for User Accounts.|

## [Software Application Name] Description

***Example:***
The OFM Consolidated System (CS) is a RHEL based system comprised if individual components: Create Seed, 3DOG, Mixed Layer Depth (MLD), BioCAST, and product generation which create consume / produce the other components data to create a forecast run-stream.  The run-stream will be run via Unix Korn shell via either crontab or batch system commands. The CS is designed to run as a single process or in a batch system, such as TORQUE.  Design philosophy is to log meaningfully and heavily but in a configurable fashion.  A dedicated logging solution is in place for the SH, Fortran 90, and Python 3 components of the system.  Another design philosophy is to fail fast, meaning to validate the requirements defined in environment variables such as executables, files and directories expected for execution.  If a required component is not present the system fails quickly with meaningful output to help zero in on the discrepancy and support faster re-execution / setup.

Environment variables will be utilized for persistence of variables that are used for single components or shared among components.  Two levels of variable complexity exist: general & advanced.  General variables are those variables that must be tailored, typically to suit a particular environment, and advanced variables represent esoteric values specific to the application that require both a greater degree of Oceanographic understanding as well as programming experience.  Two configuration files will exist: regional and global.  The regional environment variables are specific to a particular geographically oriented domain such as Red Sea or Gulf of Mexico whereby changing specific values is necessary to support general functionality for the region.  Global variables are those variables that are used by 1 to N components and will not change, necessarily, due to regional concerns.

The consolidated system is a series of shell scripts and configuration files that orchestrate a run-stream for processing Optical Forecast data.  ofm_cs.sh calls the core environment file (see Setup) to have cognizance of the environment.  Given the arguments passed in the Command Line Interface (CLI) the region of interest is sourced.

Within the regional environment file is the function_names array.  This array coupled with the regional configuration file (see Setup) build the concept of a run-stream.  What is a run-stream?  A series of tasks executed in a specific order, chained off each other to produce a final result.

All core support functions are defined in the `ofm_functions` directory and accessed via the `FPATH` variable which is refered in the Setup documentation and Korn Shell documentation.  Each sub-component of OFM-CS is wrapped by a corresponding high level script which in turn has an internal: prep, validation, run, and post function.

The information outlined below represents a snapshot of the test environment and full domain of all IT requirements for the system.

## System Requirements

### Minimal Requirements Specification

#### **Overall Minimal Hardware requirements:**

***Example:***
|Component                          | Comments                                       |
|-----------------------------------|-----------------------------------------------:|
|Memory                             |  8 GB                                          |
|Hard-drive space                   | 100 MB                                         |
|Processor                          | >i5 @ 2.5 GHZ                                  |
|Network                            | Standard network connectivity sufficient       |


#### **Overall Minimal Software requirements:**

***Example:***
|Component                          | Comments                                       |
|-----------------------------------|------------------------------------------------|
| Unix operating system             | CentOS Linux                                   |
| Bash Shell                        | v4+, must support hashes.                      |
| Korn Shell                        | v93+, used to support functions.               |
| Python                            | Virtual environments with Anaconda recommended.|
| make                              | Builds Biocast, MLD                            |
| gfortran                          | Builds Biocast.                                |
| gcc                               | Builds MLD.                                    |
| Automated Processing System (APS) | Processes satellite imagery.                   |

#### **Optional requirements:**

***Example:***
|Component                          | Comments                                       |
|-----------------------------------|------------------------------------------------|
| TORQUE (batch system)             | These vary so commands like qsub/qstat might need tweaking.|

### Development Environment Specification

Explain the development environment.

***Example:***
#### **NRL Development Environment Overview**

|Component                          | Comments                                       |
|-----------------------------------|-----------------------------------------------:|
|Memory                             | 32 GB                                          |
|Hard-drive space                   | 100 MB                                         |
|Processor                          | Intel Xeon @ 3.7 GHZ                           |
|Network                            | 100 mb network                                 |

|Software      |Version   |
|--------------|---------:|
|CentOS Linux  |v7.8.2003 | 
|qstat         |v6.1.2    |
|qsub          |v6.1.2    |
|mkdir         |v8.22     |
|find          |v4.5.11   |
|mail          |v8.14.7   |
|chmod         |v8.22     |
|cp            |v8.22     |
|ln            |v8.22     |
|python        |v3.7.3    |
|imgFillGaps   |v6.10     |
|imgSmooth     |v6.10     |
|imgBrowse     |v6.10     |
|make          |v3.82     |
|gfortran      |v4.8.5    |

## System Architecture
[System Architecture](index.png "System Architecture")
![System Architecture](index.png "System Architecture")

## Data Delivery

Explain the way data is transferred, obtained, or received by the application.

***Example:***
OFM-CS performs data exchange by way of NFS mounts.  No FTP/SCP calls are made outside of the NFS mount.

OFM-CS initially sources the environmental file referncesd in the `-e` CLI argument and then sources the regional environmental file by way of the `-r` CLI argument.  Once the environment is established OFM-CS validates the environment immediately.  Next step is to marshal data via the `marshalData.sh` script.  Each component of the OFM-CS is addressed within `marshalData.sh` and implementation can vary between components, however MLD, Biocast,and 3DOG copy available data from sources referenced in the environmental files into the `run/in` directory specificed in the Setup documentation.  Once data is staged for localized processing, each component is called and processing occurs and is saved in the `run/out` folder.  At the sub-component/post function call data is copied from the `run/out` folder into the `db/<sub-component_name>_<ISO8601>` folder.

- Invoker is expected to have a valid configuration file setup and have access to the require inputs below.

### Inputs

Provide a detaile description of the inputs expected by the application.

***Example:***
- SEED
  - NetCDF
  - Satellite image, products enumerated below, filled with no holes (typical input is 7 day rolling composite from AOPS).
    - c_551_qaa  
    - Kd_551_lee  
    - Zeu_lee

- Bathy
  - NetCDF
  - Bathy input must match geographic area.
  - GEBCO Bathy NetCDF (BioCast format).

- Model Files
  - NetCDF
  - NCOM model files for the area in question.
  - 3D U & V currents.
  - Mixed Layer Depth, generated from the MLD process and the NCOM model files.
  - Intensity of MLD, generated from the MLD process and the NCOM model files.

## User Interfaces

Describe, outline, discuss how User Interfaces work.  Is there a common set you can simply distill down to or is everyone unique.  DO NOT explain every single interface.  Discuss how they work and give an abstracted view of what they do.  If available reference the "User's Manual".

***Example:***
OFM-CS has no Graphical User Interface and is 100% Command Line Interface (CLI) driven.

## Web 

Discuss any web component, services or capabilities the software package utilizes.

***Example:***
OFM-CS has no web component associated with it.  Some documentation generated by FORD and Doxygen, code source documenters, are output in HyperText Markup Language (HTML) but do not require a web server or external network connectivity.

## Security

#### Accounts

Explain how accounts work within the context of the application.  Include discussion of service accounts as well.

***Example:***
No service account are required for OFM-CS.  It is recommended OFM-CS be run as a standard user account that has only those privileges that are appropriate for typical scientific computing.  If using a batch system it setup for subject user with access to appropriate queues will be necessary.

#### Roles

Explain any roles associated with the application and the levels of control involved with their use.

***Example:***
There are no roles associated with OFM-CS such as administrator or user.

#### Supplementary Information

***Example:***
OFM-CS does allow for different users to run different tasks / jobs in the run-stream if using the batch processing system, however if run in linear mode the user invoking the `./ofm_cs.sh` script will be the one executing all job regardless of the configuration specification, see Setup.

## Database / Persistence

Discuss an persistence mechanisms the application utilizes, the location and general setup.

***Example:***
There is no database or persistence mechanism other than the filesystem location specified in the **OFM_OUTPUT_DB_DIR** environment variable defined in `-e ./ofm.env`.  The **OFM_STATE_DIR** saves individual text files that correlated to a DTG_REGION_JOB-NUMBER_SCRIPT-NAME.[start, stop, complete] format.  Inside each state file is a simple ISO 8601 date-time stamp that represents that action [start, stop, complete] and when it occurred.

## Installation

See documentation in the `installation` folder.

## Using/Starting [Software Application Name]

Detail how the overall system gets started.  If it is a multi-step process indicate that.  Highlight any special access, accounts or permissions required to make the system initiate.  Detail any steps required prior to actual use.

***Example:***

This application requires command line interface (CLI) arguments to run.

**Example usage:**

                  `./ofm_cs.sh -d  -e ./myenv.env -r MissBight`

                  `./ofm_cs.sh -d  -e ./ofm.env -r MissBight`

                  `./ofm_cs.sh -d  -e ./ofm.env -r MissBight -t $(date +%Y%m%d)`

**Options:**

+ -h      Display this message.
+ -d      Optional, debug output is printed.
+ -e      Optional, program environment file, specifies environment variables used throughout the code base for file location, parameter settings and related controls related to operation.  Assumes `./ofm.env` if not passed.
+ -r      Required, region to process, must be present in ofm.env and spelled exactly the same.
+ -t      Optional, date for desired run, this allows for execution of past events Default is yesterday if nothing is passed.  Acceptable formats range from anything the Unix date command can run but "20200603" is recommended being passed as the CLI argument.

## Components

Indicate if the system is multi-part and if so explain each component along with versioning, usage, etc.  Ensure documentation or project artifacts are referenced if the system is outside of your control.  If a program that's part of a larger whole ensure detailed information at the same level of this ACG is provided or if a software package minimally express the documenetation generated from the code itself.

***Example:***

### OFM Mixed Layer Depth (MLD)

The MLD task takes a NCOM Model files and produces two NetCDF's which represent the Mixed Layer Depth (MLD) and the Intensity of the Mixed Layer Depth (IMLD) which is used by 3DOG for processing.

[Source Code Documenation by Doxygen](../ofm_mld/html/index.html)

### OFM Seed Generator

The Seed Generator takes a BioCast Tau 000 output and today's image to fill in missing data and gaps of coverage.

[Source Code Documenation by Doxygen](../ofm_seed_generator/html/index.html)


### Operating System Requirements

Identify the type(s) of operating system(s) in use and the minimum requirements to include version and kernel information.

***Example:***
See overall system requirements.  Test and development on CentOS Linux release 7.8.2003 (Core).


### Language Requirements

Cite each language in use and identify versioning and libraries used.

***Example:***
Version: 3+

Tested On: Anaconda v4.8.3.

System version    #:3.6.13 | packaged by conda-forge | (default, Feb 19 2021, 05:36:01) [GCC 9.3.0]

(specific libraries are cited below)

Recommendation: Use virtual environments via Anaconda to specify an OFM specific environment and load all required libraries.

Example Anaconda Virtual Environment Build:

Install the minimal packages, cited in the install command below, to your *base* environment.  Loading Anaconda environments via the shell is problematic.

+ `conda config --add channels conda-forge`
+ `conda info --envs `            
+ `conda remove --name ofm  --all`  
+ `conda create --name ofm`
+ `conda activate ofm`
+ `conda install python=3.7 pandas numpy scipy scikit-learn imageio seaborn bokeh netcdf4 pathlib xarray geopandas geoviews cartopy contextily geoviews hvplot cmocean h5py pyhdf IPython jupyter xarray`

new
conda install python=3.7 pandas numpy scipy xarray netcdf4 scikit-learn
conda install imageio seaborn bokeh pathlib cartopy geoviews hvplot cmocean
conda install geopandas h5py pyhdf IPython jupyter
conda install -c anaconda netcdf4 h5netcdf scipy pydap zarr fsspec cftime rasterio cfgrib pooch


#### Identify tools used for Optimization (if applicable)

Identify any tools of methods used to document the applications performance.

***Example:***

+ `conda install py-spy py-heat memory_profiler line_profiler`
+ `conda install py-py`


#### Library domain for all [Insert Language Name here] code:

***Example:***
See the ofm_environment.yml for details.

### **3rd Party Key Libraries**

Identify any 3rd party libraries that are key to the successful compilation and execution of the project.

***Example:***
|Library           |
|------------------|
|geopandas         |
|h5py              |
|matplotlib-base   |
|netcdf4           |
|numpy             |
|pandas            |
|pathlib           |
|pyhdf             |
|scipy             |
|seaborn           |
|setuptools        |
|xarray            |

### **Core Libraries with Distribution**

Identify all core libraries that are part of the runtime that executes your code, an example technique would be running a `pip freeze` output to obtain a list of all libraries.

***Examples:***
|Name                     | Version  |
|-------------------------|----------|
|_libgcc_mutex            |       0.1|
|_openmp_mutex            |       4.5|
|affine                   |     2.3.0|
|argon2-cffi              |    20.1.0|
|async_generator          |      1.10|
|attrs                    |    20.3.0|
|backcall                 |     0.2.0|
|backports                |       1.0|
|backports.functools_lru_cache|     1.6.4|
|bleach                   |     3.3.0|
|bokeh                    |     2.3.1|
|boost-cpp                |    1.74.0|
|brotlipy                 |     0.7.0|
|bzip2                    |     1.0.8|
|c-ares                   |    1.17.1|
|ca-certificates          | 2021.5.30|
|cairo                    |    1.16.0|
|cartopy                  | 0.19.0.po|
|certifi                  | 2021.5.30|
|cffi                     |    1.14.5|
|cfitsio                  |     3.470|
|cftime                   |     1.4.1|
|chardet                  |     4.0.0|
|click                    |     7.1.2|
|click-plugins            |     1.1.1|
|cligj                    |     0.7.1|
|cloudpickle              |     1.6.0|
|cmocean                  |       2.0|
|colorcet                 |     2.0.6|
|colorspacious            |     1.1.2|
|contextily               |     1.1.0|
|contextvars              |       2.4|
|cryptography             |     3.4.7|
|curl                     |    7.76.1|
|cycler                   |    0.10.0|
|cytoolz                  |    0.11.0|
|dask                     |  2021.3.0|
|dask-core                |  2021.3.0|
|datashader               |    0.12.1|
|datashape                |     0.5.4|
|decorator                |     5.0.7|
|defusedxml               |     0.7.1|
|distributed              |  2021.3.0|
|entrypoints              |       0.3|
|expat                    |     2.3.0|
|fiona                    |    1.8.18|
|fontconfig               |    2.13.1|
|freetype                 |    2.10.4|
|freexl                   |     1.0.6|
|fsspec                   |  2021.4.0|
|gdal                     |     3.2.1|
|geographiclib            |      1.50|
|geopandas                |     0.9.0|
|geopy                    |     2.1.0|
|geos                     |     3.9.1|
|geotiff                  |     1.6.0|
|geoviews                 |     1.9.1|
|geoviews-core            |     1.9.1|
|gettext                  |  0.19.8.1|
|giflib                   |     5.2.1|
|h5py                     |    2.10.0|
|hdf4                     |    4.2.15|
|hdf5                     |    1.10.6|
|heapdict                 |     1.0.1|
|holoviews                |    1.14.3|
|hvplot                   |     0.7.1|
|icu                      |      68.1|
|idna                     |      2.10|
|imageio                  |     2.9.0|
|immutables               |      0.15|
|importlib-metadata       |     4.0.1|
|ipykernel                |     5.5.4|
|ipython                  |    7.16.1|
|ipython_genutils         |     0.2.0|
|jedi                     |    0.17.2|
|jinja2                   |    2.11.3|
|joblib                   |     1.0.1|
|jpeg                     |        9d|
|json-c                   |      0.15|
|jsonschema               |     3.2.0|
|jupyter_client           |    6.1.12|
|jupyter_core             |     4.7.1|
|jupyterlab_pygments      |     0.1.2|
|kealib                   |    1.4.14|
|kiwisolver               |     1.3.1|
|krb5                     |    1.17.2|
|lcms2                    |      2.12|
|ld_impl_linux-64         |    2.35.1|
|libblas                  |     3.9.0|
|libcblas                 |     3.9.0|
|libcurl                  |    7.76.1|
|libdap4                  |    3.20.6|
|libedit                  | 3.1.20191|
|libev                    |      4.33|
|libffi                   |       3.3|
|libgcc-ng                |     9.3.0|
|libgdal                  |     3.2.1|
|libgfortran-ng           |     9.3.0|
|libgfortran5             |     9.3.0|
|libglib                  |    2.68.1|
|libgomp                  |     9.3.0|
|libiconv                 |      1.16|
|libkml                   |     1.3.0|
|liblapack                |     3.9.0|
|libllvm10                |    10.0.1|
|libnetcdf                |     4.7.4|
|libnghttp2               |    1.43.0|
|libopenblas              |    0.3.15|
|libpng                   |    1.6.37|
|libpq                    |      13.2|
|librttopo                |     1.1.0|
|libsodium                |    1.0.18|
|libspatialindex          |     1.9.3|
|libspatialite            |     5.0.1|
|libssh2                  |     1.9.0|
|libstdcxx-ng             |     9.3.0|
|libtiff                  |     4.2.0|
|libuuid                  |    2.32.1|
|libwebp-base             |     1.2.0|
|libxcb                   |      1.13|
|libxml2                  |    2.9.10|
|llvmlite                 |    0.36.0|
|locket                   |     0.2.0|
|lz4-c                    |     1.9.3|
|markdown                 |     3.3.4|
|markupsafe               |     1.1.1|
|matplotlib-base          |     3.3.4|
|mercantile               |     1.2.1|
|mistune                  |     0.8.4|
|msgpack-python           |     1.0.2|
|multipledispatch         |     0.6.0|
|munch                    |     2.5.0|
|nbclient                 |     0.5.3|
|nbconvert                |     6.0.7|
|nbformat                 |     5.1.3|
|ncurses                  |       6.2|
|nest-asyncio             |     1.5.1|
|netcdf4                  |     1.5.6|
|notebook                 |     6.3.0|
|numba                    |    0.53.1|
|numpy                    |    1.19.5|
|olefile                  |      0.46|
|openjpeg                 |     2.4.0|
|openssl                  |    1.1.1k|
|packaging                |      20.9|
|pandas                   |     1.1.5|
|pandoc                   |      2.12|
|pandocfilters            |     1.4.2|
|panel                    |    0.11.3|
|param                    |    1.10.1|
|parso                    |     0.7.1|
|partd                    |     1.2.0|
|pathlib                  |     1.0.1|
|patsy                    |     0.5.1|
|pcre                     |      8.44|
|pexpect                  |     4.8.0|
|pickleshare              |     0.7.5|
|pillow                   |     8.1.2|
|pip                      |    21.1.1|
|pixman                   |    0.40.0|
|poppler                  |    0.89.0|
|poppler-data             |    0.4.10|
|postgresql               |      13.2|
|proj                     |     7.2.0|
|prometheus_client        |    0.10.1|
|prompt-toolkit           |    3.0.18|
|psutil                   |     5.8.0|
|pthread-stubs            |       0.4|
|ptyprocess               |     0.7.0|
|pycparser                |      2.20|
|pyct                     |     0.4.6|
|pyct-core                |     0.4.6|
|pygments                 |     2.9.0|
|pyhdf                    |    0.10.3|
|pyopenssl                |    20.0.1|
|pyparsing                |     2.4.7|
|pyproj                   |     3.0.1|
|pyrsistent               |    0.17.3|
|pyshp                    |     2.1.3|
|pysocks                  |     1.7.1|
|python                   |    3.6.13|
|python-dateutil          |     2.8.1|
|python_abi               |       3.6|
|pytz                     |    2021.1|
|pyviz_comms              |     2.0.1|
|pyyaml                   |     5.4.1|
|pyzmq                    |    22.0.3|
|rasterio                 |     1.2.3|
|readline                 |       8.1|
|requests                 |    2.25.1|
|rtree                    |     0.9.7|
|scikit-learn             |    0.24.2|
|scipy                    |     1.5.3|
|seaborn                  |    0.11.1|
|seaborn-base             |    0.11.1|
|send2trash               |     1.5.0|
|setuptools               |    49.6.0|
|shapely                  |     1.7.1|
|six                      |    1.16.0|
|snuggs                   |     1.4.7|
|sortedcontainers         |     2.3.0|
|sqlite                   |    3.35.5|
|statsmodels              |    0.12.2|
|tblib                    |     1.7.0|
|terminado                |     0.9.4|
|testpath                 |     0.4.4|
|threadpoolctl            |     2.1.0|
|tiledb                   |     2.2.8|
|tk                       |    8.6.10|
|toolz                    |    0.11.1|
|tornado                  |       6.1|
|tqdm                     |    4.60.0|
|traitlets                |     4.3.3|
|typing_extensions        |   3.7.4.3|
|tzcode                   |     2021a|
|tzdata                   |     2021a|
|urllib3                  |    1.26.4|
|wcwidth                  |     0.2.5|
|webencodings             |     0.5.1|
|wheel                    |    0.36.2|
|xarray                   |    0.15.1|
|xerces-c                 |     3.2.3|
|xorg-kbproto             |     1.0.7|
|xorg-libice              |    1.0.10|
|xorg-libsm               |     1.2.3|
|xorg-libx11              |     1.7.0|
|xorg-libxau              |     1.0.9|
|xorg-libxdmcp            |     1.1.3|
|xorg-libxext             |     1.3.4|
|xorg-libxrender          |    0.9.10|
|xorg-renderproto         |    0.11.1|
|xorg-xextproto           |     7.3.0|
|xorg-xproto              |    7.0.31|
|xz                       |     5.2.5|
|yaml                     |     0.2.5|
|zeromq                   |     4.3.4|
|zict                     |     2.0.0|
|zipp                     |     3.4.1|
|zlib                     |    1.2.11|
|zstd                     |     1.4.9|

## Build Requirements

Explain the build requirements associated with each element of this software package.


### **Compilation Directives**

***Example:***
Biocast is a FORTRAN 90 application that requires compilation for OFM-CS to function.  The information showing below illustrates those requirements for a successfull build.  Note that the Makefile and ./build_biocast.sh script have full details necessary to replicate compilation and linkng.

Provide instructions on the use of the compilation directives used to create your code, if appropriate.

***Example:***
|Compilation Directive              | Requirements                                                       |
|-----------------------------------|--------------------------------------------------------------------|
|Compiler used                      | /bin/gfortran => /bin/gfortran                                     |
|Sources dir                        | ./src                                                              |
|Objects dir                        | ./obj                                                              |
|Modules dir                        | ./mod                                                              |
|Executables dir                    |  ./                                                                |
|Libraries                          | -L/net/americium/export/sw/linux-x86_64-sl7/aps/local/lib          |
|Includes                           | -I/net/americium/export/sw/linux-x86_64-sl7/aps/local/include      |
|Compiling options                  | [-C -g -fbacktrace -fcheck=bounds -O5]                             |
|Linking options                    | [-lnetcdff -lnetcdf -ljpeg -lmfhdf -ldf -lhdf5_hl -lhdf5 -ldl -lm -lz -ljpeg] |


### ***Compilation Directives***

***Example:***
MLD is a C application that requires compilation for OFM-CS to function.  The information showing below illustrates those requirements for a successfull build.  Note that the Makefile and ./build_mld.sh script have full details necessary to replicate compilation and linkng.

|Compilation Directive              | Requirements                                                       |
|-----------------------------------|--------------------------------------------------------------------|
|Compiler used                      | gcc => /usr/bin/gcc                                                |
|Sources dir                        | ./src                                                              |
|Objects dir                        | ./obj                                                              |
|Executables dir                    | ./                                                                 |
|Libraries                          | -L/net/americium/export/sw/linux-x86_64-sl7/aps/local/lib          |
|Includes                           | -I/net/americium/export/sw/linux-x86_64-sl7/aps/local/include      |
|Compiling options                  | [-C -g -Wall -pedantic -fbounds-check -std=c99 -O5 -Wvariadic-macros]  |
|Linking options                    | [-lnetcdf -ljpeg -lmfhdf -ldf -lhdf5_hl -lhdf5 -ldl -lm -lz -ljpeg ]   |

