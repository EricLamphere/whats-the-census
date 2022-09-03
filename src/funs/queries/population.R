# DESCRIPTION
# -- Description: Tidycensus population queries
# -- Author: Eric Lamphere (ericjlamphere@gmail.com)
# -- Created: Sat May 29 10:21:47 2021
# -- References:
# -- >  Census Data: https://api.census.gov/data.html
# -- >  Getting Started with tidycensus: https://walker-data.com/tidycensus/index.html


# Query ----
acs5 <- function(state, variables, year = 2020) {
  vars <- acs5_vars(year = year)

  # moe = 90% confidence interval (i.e. estimate +- moe)
  gender <-
    tidycensus::get_acs(
      "state",
      variables = c(
        # total = "B01001_001",
        male = "B01001_002",
        female = "B01001_026"
      ),
      year = year,
      # table = "acs5",
      moe_level = 95,
      cache_table = TRUE
    )

}
