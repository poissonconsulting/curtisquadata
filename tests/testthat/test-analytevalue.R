test_that("check_data", {
  expect_null(chk::check_data(
    analytevalue,
    values = list(
      LabID = "",
      Analyte = "",
      Value = c(0, 100)),
    order = TRUE,
    exclusive = TRUE,
    nrow = TRUE,
    key = c("LabID", "Analyte")
  ))
  chk::chk_join(analytevalue, analytesample, by = "LabID")
  chk::chk_join(analytevalue, analyte, by = "Analyte")
})
