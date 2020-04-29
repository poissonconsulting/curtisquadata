test_that("check_data", {
  expect_null(chk::check_data(
    analyte,
    values = list(
      Analyte = "",
      Units = "",
      MRL = c(0, 100)),
    exclusive = TRUE,
    order = TRUE,
    nrow = c(10, 100),
    key = "Analyte"
  ))
})
