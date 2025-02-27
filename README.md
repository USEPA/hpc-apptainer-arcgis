# hpc-apptainer-arcgis
Access the Python 3 Runtime and ArcPy on a Linux high performance computing system.

## Requirements
Esri ArcGIS Enterprise or Esri ArcGIS Server for Linux 11.3 and valid license file.

This was successfully tested using Apptainer 1.3.6 and Red Hat Enterprise Linux 8.10.

## Usage

Build a Singularity Image File (SIF). NOTE: lines in esri_rocky.def with brackets [ ] and paths to the Esri software and licnese files will need to be updated. 
```
apptainer build esri_rocky_{user}.sif esri_rocky.def
```
This is a useful script to initiate the Python 3 Runtime with ArcPy available within your SIF. This script creates a temporary overlay file system and changes all file and directory arguements to their full paths. NOTE: Users will need to upadate {temp_dir} with a path they have read/write access to and {arc_img} with the path to their SIF image within the run_arcpy.sh script.
```
alias arcpython='/path/to/run_arcpy.sh'
```

A simple script to test if you can access the Python 3 Runtime with Arcpy in your SIF image.
```
arcpython ./test_arcpy.py
```


## Disclaimer
The United States Environmental Protection Agency (EPA) GitHub project code is provided on an "as is" basis and the user assumes responsibility for its use. EPA has relinquished control of the information and no longer has responsibility to protect the integrity, confidentiality, or availability of the information. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by EPA. The EPA seal and logo shall not be used in any manner to imply endorsement of any commercial product or activity by EPA or the United States Government. 
