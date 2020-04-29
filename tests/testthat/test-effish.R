test_that("check_data", {
  expect_null(chk::check_data(
    effish,
    values = list(
      EFSite = factor(""),
      DateEFVisit = as.Date(c("2015-01-01", "2018-12-31")),
      EFPass = 1:3,
      FishNumber = c(1L, 30L),
      Species = factor(""),
      ForkLength = c(20L, 250L),
      BodyWeight = c(0.1, 200)),
    exclusive = TRUE,
    order = TRUE,
    nrow = TRUE,
    key = c("EFSite", "DateEFVisit", "EFPass", "FishNumber")
  ))
  chk::chk_join(effish, efvisit, c("EFSite", "DateEFVisit"))
  chk::chk_join(effish, efspecies, "Species")
})
