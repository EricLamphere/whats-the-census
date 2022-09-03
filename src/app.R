# DESCRIPTION
# -- Description: Census App: Globals & App
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:46:13 2021
# -- References:
# -- >  Census Data: https://api.census.gov/data.html
# -- >  Getting Started with Census API: https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html

if (Sys.getenv("CENSUS_API_KEY") == "") {
  cli::cli_abort(c(
    "Missing CENSUS_API_KEY environment variable",
    ">" = "Sign up for a Census API key at https://api.census.gov/data/key_signup.html"
  ))
}

# LIBRARIES ----
# remotes::install_github("EricLamphere/ezverse")
library(ezverse)
library(tidyverse)
library(shiny)
library(tidycensus)


# UTILS ----
funs <- new.env()
dirs <- list(
  funs_dir = "src/funs/",
  funs_files = list.files("./src/funs", recursive = T)
)
invisible(sapply(dirs$funs_dir %//% dirs$funs_files, source, local = funs))

if (interactive())
  invisible(sapply(dirs$funs_dir %//% dirs$funs_files, source, local = .GlobalEnv))


# RUN APP ----
shiny::runApp('census-app')
