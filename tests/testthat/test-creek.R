test_that("check_data", {
  expect_null(chk::check_data(
    creek,
    values = list(
      Creek = factor("")),
    order = TRUE,
    nrow = 2,
    key = c("Creek")
  ))
})
