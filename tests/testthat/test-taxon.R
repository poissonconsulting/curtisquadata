test_that("check_data", {
  expect_null(chk::check_data(
    taxon,
    values = list(
      Order = factor(""),
      Family = factor(c("", NA))),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("Order", "Family")
  ))
})
