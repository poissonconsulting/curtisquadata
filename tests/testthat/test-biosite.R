test_that("check_data", {
  expect_null(chk::check_data(
    biosite,
    values = list(
      BioSite = factor(""),
      Waterbody = factor("")),
    order = TRUE,
    nrow = 6,
    key = "BioSite"
  ))
})
