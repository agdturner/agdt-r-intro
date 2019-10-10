# Packages
#
# The base installation of R includes many functions and commands. However, 
# more often we are interested in using some particular functionality, 
# encoded into packages contributed by the R developer community. Installing 
# packages for the first time can be done at the command line in the R 
# console using the install.packages command as in the example below to 
# install the tmap library or via the R menu items. In Windows, the menu for 
# this can be accessed by Packages > Load Packages and on a Mac via Packages 
# and Data > Package Installer. In either case, the first time you install 
# packages you may have to set a mirror site, from which to download the 
# packages.
#
# When you install these packages it is strongly suggested you also install 
# the dependencies. These are other packages that are required by the 
# package that is being installed. This can be done by selecting check the 
# box in the menu or including depend=TRUE in the command line as below:
install.packages("tmap", dep = TRUE)
# You may have to set a mirror site from which the packages will be 
# downloaded to your computer. Generally you should pick one that is 
# nearby to you. Once you have installed the software you can run it. On a 
# Windows computer an R icon is typically installed on the desktop and on 
# a Mac, R can be found in the Applications folder. Macs and Windows have 
# slightly different interfaces but the protocols and processes for an R 
# session on either platform are similar.
#
# Further descriptions of packages, their installation and their data 
# structures will be given as needed in the practicals. There are literally 
# 1000s of packages that have been contributed to the R project by various 
# researchers and organisations. These can be located by name at 
# http://cran.r-project.org/web/packages/ available_packages_by_name.html 
# if you know the package you wish to use. It is also possible to search 
# the CRAN website to find packages to perform particular tasks at 
# http://www.r-project.org/search.html. Additionally many packages include 
# user guides in the form of a PDF document describing the package and 
# listed at the top of the index page of the help files for the package.
#
# You should install and the following the following packages and 
# dependencies:
#  • sf for spatial data and spatial objects
#  • tidyverse for lots of lovely data science things - see https://www.tidyverse.org
#  • tmap for quality mapping
# You could do this in a oner:
install.packages(c("sf", "tidyverse", "tmap"), dep = TRUE)
# You will only have to install a package once!!
#
# Once the package has been installed on your computer then the library 
# can be called into each of your R sessions as below.
library(sf)
library(tidyverse)
library(tmap)
# Ok! lets load and then subset some spatial data
oa <- st_read("../homework/liverpool_oa.shp", quiet = T) %>% `st_crs<-`(27700)
## Warning: st_crs<- : replacing crs does not reproject data; use 
## st_transform for that
# subset
oa <- oa[,c(8,10:16,18:21)]
# convert to percentage
oa$gs_area = oa$gs_area*100
# The oa object a multipolygon object of Output Areas (OAs) - the same as 
# the .csv data but now with spatial attributes. You may wish to explore 
# these:
summary(oa)
names(oa)
head(oa)
# And map them using qtm from tmap:
qtm(oa, "OAC_class", borders = NULL)
# And you could do the same with an OSM backdrop:
tmap_mode("view")
qtm(oa, "OAC_class", borders = NULL)
# reset to map mode
tmap_mode("plot")
# Saving R objects
#
# All R entities, including functions and data structures, exist as 
# objects. They can all be operated on as data. Type in ls() to see the 
# names of all objects in your workspace.
ls()
## [1] "elasticband" "fig" "img" "oa" "x"
## [6] "y"
# It is also possible to save individual objects, or collections of objects 
# into a named image file. Some possibilities are:
save.image() # Save contents of workspace, into the file .RData
save.image(file="P1.RData") # Save into the file archive.RData
save(oa, file="oa.RData") # Save just oa the oa.RData file
# Important: On quitting, R offers the option of saving the workspace 
# image, by default in the file .RData in the working directory. This 
# allows the retention, for use in the next session in the same workspace, 
# any objects that were created in the current session. Careful 
# housekeeping may be needed to distinguish between objects that are to be 
# kept and objects that will not be used again.
