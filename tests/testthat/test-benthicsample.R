test_that("check_data", {
  expect_null(chk::check_data(
    benthicsample,
    values = list(
      BioSite = factor(""),
      DateBenthicSample = as.Date(c("2015-01-01", "2018-12-31")),
      Subsampled = c(0, 1)
    ),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("BioSite", "DateBenthicSample")
  ))
  chk::chk_join(benthicsample, biosite, by = "BioSite")
})
