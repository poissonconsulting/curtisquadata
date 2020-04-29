test_that("check_data", {
  expect_null(chk::check_data(
    tempsite,
    values = list(
      TempSite = factor(""),
      Creek = factor("")),
    order = TRUE,
    nrow = 4,
    key = c("TempSite")
  ))
  chk::chk_join(tempsite, creek, "Creek")
})
