# DESCRIPTION
# -- Description: Census App: Globals & App
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:46:13 2021
# -- References:
# -- >  Census Data: https://api.census.gov/data.html
# -- >  Getting Started with Census API: https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html

# remotes::install_github("EricLamphere/ezverse")
library(ezverse)
library(tidyverse)
library(shiny)
library(censusapi)

if (Sys.getenv("CENSUS_KEY") == "") {
  cli::cli_alert_danger("Missing CENSUS_KEY in .Renviron")
  stop("Must have a census API key in .Renviron: https://api.census.gov/data/key_signup.html")
}

shiny::runApp('census-app')
