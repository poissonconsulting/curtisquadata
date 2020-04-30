test_that("check_data", {
  expect_null(chk::check_data(
    benthiccount,
    values = list(
      BioSite = factor(""),
      DateBenthicSample = as.Date(c("2015-01-01", "2018-12-31")),
      Order = factor(""),
      Family = factor(c("", NA)),
      Count = c(0L, 300L)
    ),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("BioSite", "DateBenthicSample", "Order", "Family")
  ))
  chk::chk_join(benthiccount, benthicsample, by = c("BioSite", "DateBenthicSample"))
  chk::chk_join(benthiccount, taxon, by = c("Family", "Order"))
})
