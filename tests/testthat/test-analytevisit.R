test_that("check_data", {
  expect_null(chk::check_data(
    analytevisit,
    values = list(
      LabID = "",
      BioSite = factor(""),
      DateAnalyteVisit = as.Date(c("2015-01-01", "2018-12-31"))),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("LabID")
  ))
  chk::check_key(analytevisit, c("BioSite", "DateAnalyteVisit"))
})
