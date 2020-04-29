test_that("check_data", {
  expect_null(chk::check_data(
    site,
    values = list(
      Section = factor(""),
      Creek = factor("")),
    order = TRUE,
    nrow = 6,
    key = c("Section", "Creek")
  ))
})
