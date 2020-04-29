remotes::install_github("krlmlr/dm#335")

library(tidyverse)
library(dm)

pkgload::load_all()

rm(list = ls())

dm <-
  dm(
    creek,
    biosite,
    taxon,
    analyte,
    analytesample,
    analytevalue,
    benthicsample,
    benthiccount,
    efspecies,
    efsite
  )

dm %<>%
  dm_add_pk(creek, Creek) %>%
  dm_add_pk(biosite, BioSite) %>%
  dm_add_pk(taxon, c(Order, Family)) %>%
  dm_add_pk(analyte, Analyte) %>%
  dm_add_pk(analytesample, c(LabID)) %>%
  dm_add_pk(analytevalue, c(LabID, Analyte)) %>%
  dm_add_pk(benthicsample, c(BioSite, DateBenthicSample)) %>%
  dm_add_pk(benthiccount, c(BioSite, DateBenthicSample, Order, Family)) %>%
  dm_add_pk(efspecies, Species) %>%
  dm_add_pk(efsite, EFSite) %>%
  dm_add_fk(biosite, c(Creek), creek) %>%
  dm_add_fk(analytesample, c(BioSite), biosite) %>%
  dm_add_fk(analytevalue, c(LabID), analytesample) %>%
  dm_add_fk(analytevalue, c(Analyte), analyte) %>%
  dm_add_fk(benthicsample, c(BioSite), biosite) %>%
  dm_add_fk(benthiccount, c(BioSite, DateBenthicSample), benthicsample) %>%
  dm_add_fk(benthiccount, c(Order, Family), taxon) %>%
  dm_add_fk(efsite, c(Creek), creek)

dm %>% dm_draw()
