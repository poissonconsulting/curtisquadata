test_that("check_data", {
  expect_null(chk::check_data(
    analytesample,
    values = list(
      LabID = "",
      BioSite = factor(""),
      DateAnalyteSample = as.Date(c("2015-01-01", "2018-12-31"))),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("LabID")
  ))
  chk::check_key(analytesample, c("BioSite", "DateAnalyteSample"))
  chk::chk_join(analytesample, biosite, by = "BioSite")
})
