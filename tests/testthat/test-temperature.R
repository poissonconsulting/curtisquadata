test_that("check_data", {
  expect_null(chk::check_data(
    temperature,
    values = list(
      TempSite = factor(""),
      DateTimeTemperature = Sys.time(),
      Temperature = c(-0.004, 16)
    ),
    exclusive = TRUE,
    order = TRUE,
    nrow = TRUE,
    key = c("TempSite", "DateTimeTemperature")
  ))
  chk::chk_join(temperature, tempsite, "TempSite")
})
