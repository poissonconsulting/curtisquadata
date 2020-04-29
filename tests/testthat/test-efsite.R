test_that("check_data", {
  expect_null(chk::check_data(
    efsite,
    values = list(
      EFSite = factor(""),
      Creek = factor(""),
      SiteLength = c(10, 20),
      Elevation = c(1000, 1300),
      DominantSubstrate = factor("")),
    order = TRUE,
    nrow = 8,
    key = c("EFSite")
  ))
  chk::chk_join(efsite, creek, "Creek")
})
