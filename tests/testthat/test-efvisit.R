test_that("check_data", {
  expect_null(chk::check_data(
    efvisit,
    values = list(
      EFSite = factor(""),
      DateEFVisit = as.Date(c("2015-01-01", "2018-12-31")),
      EFSecPass1 = c(100L, 1000L),
      EFSecPass2 = c(0L, 500L),
      EFSecPass3 = c(0L, 500L)),
    order = TRUE,
    nrow = TRUE,
    key = c("EFSite", "DateEFVisit")
  ))
  chk::chk_join(efvisit, efsite, "EFSite")
})
