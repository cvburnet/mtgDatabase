# initiate will function as a wrapper that launches all required packages for
# mtgDatabase, then will set a working directory for the project.

# First, installing the required packages needed for this project, if they are 
# not previously installed. Launches each package.
if(!require("this.path")) install.packages("this.path")
library(this.path)

if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

if(!require("stringr")) install.packages("stringr")
library(stringr)

if(!require("dplyr")) install.packages("dplyr")
library(dplyr)

# Next, setting the working directory to /R/
this.path::here() |>
  str_sub(end = -3L) |>
  setwd()

# Finally, I like to include that the program has finished.
message("mtgDatabase initiated successfully.")