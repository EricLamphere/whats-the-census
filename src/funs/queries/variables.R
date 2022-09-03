# DESCRIPTION
# -- Description: Get variables from asc5
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat Sep  3 11:27:45 2022


acs5_vars <-
  function(year = 2020) {
    tidycensus::load_variables(year, "acs5", cache = TRUE)
  }

acs5_prof_vars <-
  function(year = 2020) {
    tidycensus::load_variables(year, dataset = "acs5/profile", cache = TRUE)
  }
