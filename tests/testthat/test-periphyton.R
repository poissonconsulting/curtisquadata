test_that("check_data", {
  expect_null(chk::check_data(
    periphyton,
    values = list(
      BioSite = factor(""),
      Series = 1:2,
      SampleID = c("", NA),
      DatePeriphyton = as.Date(c("2015-01-01", "2018-12-31")),
      Chla = c(0,20)),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("BioSite", "Series", "DatePeriphyton")
  ))
  chk::check_key(periphyton, "SampleID", na_distinct = TRUE)
})
