# futureLearn_220606343

Welcome to Audience and Content Pattern Analysis!

This README File is a guidance for any of you who want to get a quick glimpse
and a basic understanding of the project. This analysis provides a solution of 
increasing the number of audience in the futrue for MOOC dataset of a module
called "Cyber Security: Safety At Home, Online and in Life"
which took 3 weeks to complete. 

Here is how you can load the project. 
  1. Make sure you're in the root directory of futureLearn_220606343. You can
     run getwd() and use setwd("futureLearn_220606343") to set the folder
     containing the analysis as the working directory
  2. Open futureLearn_220606343/src/analysis and execute this line in the
     analysis.R
     
     library('ProjectTemplate')
	   load.project()

After you enter the second line of code, you'll see a series of automated
messages as ProjectTemplate goes about doing its work. This work involves:
* Reading in the global configuration file contained in `config`.
* Loading any R packages you listed in the configuration file.
* Reading in any datasets stored in `data` or `cache`.
* Preprocessing your data using the files in the `munge` directory.

If there is an update in cache, data, global environment and munge, you may 
execute these two lines in the src/analysis.R once more:

	library('ProjectTemplate')
	load.project()

You'll have access to all of your data, already fully preprocessed, and
all of the libraries you want to use.

The RMarkdown report is located in the reports folder and so is the reflective
log. 

Here are some packages we installed in case you wondered as you can also see 
in the config/global.dcf:
  1. reshape2 
  2. plyr 
  3. tidyverse 
  4. stringr 
  5. lubridate 
  6. dplyr
  7. ggplot2
  
Reports are located in reports folder


