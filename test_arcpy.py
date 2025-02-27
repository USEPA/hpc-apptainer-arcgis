import arcpy

# Use the dictionary iteritems to iterate through the key/value pairs from 
# GetInstallInfo.
d = arcpy.GetInstallInfo()
for key, value in list(d.items()):
    # Print a formatted string of the install key and its value
    print("{:<13} : {}".format(key, value))


