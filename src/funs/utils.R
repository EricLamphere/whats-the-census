# Helpers ----
agg_by <- function(.data, .dims = NULL, ...) {
  if (is.null(.dims)) {
    return(dplyr::summarise(.data, ..., .groups = "drop"))
  }

  .data %>%
    dplyr::group_by(!!! rlang::syms(.dims)) %>%
    dplyr::summarise(..., .groups = "keep") %>%
    dplyr::ungroup()
}


agg_append <- function(.data, .all_dims, .dims = NULL, ...) {
  dims_totals <- .all_dims[.all_dims %notin% .dims]

  mutate_exprs <-
    rlang::parse_exprs(
      setNames(
        rep("'TOTAL'", length(dims_totals)),
        dims_totals
      )
    )

  dplyr::bind_rows(
    .data,
    .data %>%
      dplyr::filter(
        dplyr::if_all(.all_dims, ~ . != "TOTAL")
      ) %>%
      agg_by(.dims, ...) %>%
      dplyr::mutate(
        !!! mutate_exprs
      )
  )
}
