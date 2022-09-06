# DESCRIPTION
# -- Description: Tidycensus population queries
# -- Author: Eric Lamphere (ericjlamphere@gmail.com)
# -- Created: Sat May 29 10:21:47 2021
# -- References:
# -- >  Census Data: https://api.census.gov/data.html
# -- >  Getting Started with tidycensus: https://walker-data.com/tidycensus/index.html


# Query ----
acs5_sex <- function(year = 2020) {
  vars <- acs5_vars(year = year)

  # moe = 90% confidence interval (i.e. estimate +- moe)
  sex <-
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

  agger <- purrr::partial(
    ezxfig::agg,
    .all_dims = c("state", "sex"),
    pop = sum(pop, na.rm = TRUE),
    moe = tidycensus::moe_sum(moe, pop, na.rm = TRUE)
  )

  # get rollups for all dimension values
  sex %>%
    dplyr::select(state = NAME, sex = variable, pop = estimate, moe) %>%
    agger(.dims = "state") %>%
    agger(.dims = "sex") %>%
    agger() %>%
    ezxfig::nuke("TOTAL", "overall", which_cols = c("state", "sex"))
}





