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
    periphyton,
    efspecies,
    efsite,
    efvisit,
    effish,
    tempsite
  )

dm %<>%
  dm_add_pk(creek, Creek) %>%
  dm_add_pk(biosite, BioSite) %>%
  dm_add_pk(taxon, c(Order, Family)) %>%
  dm_add_pk(analyte, Analyte) %>%
  dm_add_pk(analytesample, LabID) %>%
  dm_add_pk(analytevalue, c(LabID, Analyte)) %>%
  dm_add_pk(benthicsample, c(BioSite, DateBenthicSample)) %>%
  dm_add_pk(benthiccount, c(BioSite, DateBenthicSample, Order, Family)) %>%
  dm_add_pk(periphyton, c(BioSite, DatePeriphyton, Series)) %>%
  dm_add_pk(efspecies, Species) %>%
  dm_add_pk(efsite, EFSite) %>%
  dm_add_pk(efvisit, c(EFSite, DateEFVisit)) %>%
  dm_add_pk(effish, c(EFSite, DateEFVisit, EFPass, FishNumber)) %>%
  dm_add_pk(tempsite, TempSite) %>%
  dm_add_fk(biosite, Creek, creek) %>%
  dm_add_fk(analytesample, BioSite, biosite) %>%
  dm_add_fk(analytevalue, LabID, analytesample) %>%
  dm_add_fk(analytevalue, Analyte, analyte) %>%
  dm_add_fk(benthicsample, BioSite, biosite) %>%
  dm_add_fk(benthiccount, c(BioSite, DateBenthicSample), benthicsample) %>%
  dm_add_fk(benthiccount, c(Order, Family), taxon) %>%
  dm_add_fk(periphyton, BioSite, biosite) %>%
  dm_add_fk(efsite, Creek, creek) %>%
  dm_add_fk(efvisit, EFSite, efsite) %>%
  dm_add_fk(effish, c(EFSite, DateEFVisit), efvisit) %>%
  dm_add_fk(effish, Species, efspecies) %>%
  dm_add_fk(tempsite, Creek, creek)

dm %>% dm_draw()
