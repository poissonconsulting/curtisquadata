test_that("check_data", {
  expect_null(chk::check_data(
    efspecies,
    values = list(
      Species = factor(""),
      CommonName = factor("")),
    exclusive = TRUE,
    order = TRUE,
    nrow = 2,
    key = c("Species")
  ))
  chk::check_key(efspecies, "CommonName")
})
