test_that("check_data", {
  expect_null(chk::check_data(
    biosite,
    values = list(
      BioSite = factor(""),
      Creek = factor("")
    ),
    order = TRUE,
    nrow = 6,
    key = c("BioSite")
  ))
  chk::chk_join(biosite, creek, "Creek")
})
