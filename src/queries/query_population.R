# DESCRIPTION
# -- Description:
# -- Author:      Eric Lamphere (ericjlamphere@gmail.com)
# -- Created:     Sat May 29 10:21:47 2021
# -- References:
# -- >  Census Data: https://api.census.gov/data.html
# -- >  Getting Started with Census API: https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html


# Query ----
acs1_meta <- listCensusMetadata(
  name = "acs/acs1",
  vintage = 2019,
  type = "variables"
)

# need to remove the ':!!' from label to use as column names, want to export more functions from lamps first
sex_age_vars <-
  acs1_meta %>%
  filter(group == "B01001") %>%
  select(name, label) %>%
  mutate(
    newLabel = gsub("Estimate!!Total:!!", "", label) %del% ":",
    newLabel = gsub("!!", " ", newLabel)
  )


census_data <- getCensus(
  name = "acs/acs1",
  vintage = 2019,
  vars = sex_age_vars$name
)

census_data_long <- census_data %>%
  rename(
    setNames(
      sex_age_vars$name,
      sex_age_vars$newLabel
    )
  ) %>%
  pivot_longer(all_of(sex_age_vars$newLabel)) %>%
  arrange(name)



