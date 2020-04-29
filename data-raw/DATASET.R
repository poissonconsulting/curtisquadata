library(tidyverse)
library(magrittr)

rm(list = ls())

conn <- poissqlite::ps_connect_sqlite("~/Poisson/Databases/curtis-qua-prod.sqlite")

poissqlite::ps_load_tables(conn = conn, rename = stringr::str_to_lower)

poissqlite::ps_disconnect_sqlite(conn)

creek <- tibble(Creek = factor(c("Curtis", "Qua")))

usethis::use_data(creek, overwrite = TRUE)

analyte %<>%
  select(-GeneralMethod)

usethis::use_data(analyte, overwrite = TRUE)

biosite %<>%
  tibble::as_tibble() %>%
  rename(Creek = Waterbody) %>%
  mutate(BioSite = factor(BioSite),
         Creek = str_replace(Creek, " Creek", ""),
         Creek = factor(Creek, levels = creek$Creek))

usethis::use_data(biosite, overwrite = TRUE)

taxon %<>%
  rename(Order = Taxon) %>%
  arrange(Order, Family) %>%
  mutate(Order = factor(Order, unique(Order)),
         Family = factor(Family, unique(Family)))

usethis::use_data(taxon, overwrite = TRUE)

periphyton %<>%
  mutate(BioSite = factor(BioSite, levels = levels(biosite$BioSite)),
         Series = as.integer(Series),
         Chla = as.double(Chla)) %>%
  select(BioSite, DatePeriphyton, Series, SampleID, Chla)

usethis::use_data(periphyton, overwrite = TRUE)

analytesample <- chemvisit
rm(chemvisit)

analytesample %<>%
  mutate(BioSite = factor(BioSite, levels = levels(biosite$BioSite))) %>%
  select(-Lab) %>%
  rename(DateAnalyteSample = DateChemVisit)

usethis::use_data(analytesample, overwrite = TRUE)

analytevalue <- chemsample
rm(chemsample)

usethis::use_data(analytevalue, overwrite = TRUE)

benthicsample %<>%
  mutate(BioSite = factor(BioSite, levels = levels(biosite$BioSite)),
         Subsampled = as.double(Subsampled) / 100)

usethis::use_data(benthicsample, overwrite = TRUE)

benthiccount <- benthicdata
rm(benthicdata)

benthiccount %<>%
  rename(Order = Taxon) %>%
  mutate(BioSite = factor(BioSite, levels = levels(biosite$BioSite)),
         Order = factor(Order, levels = levels(taxon$Order)),
         Family = factor(Family, levels = levels(taxon$Family))) %>%
  select(BioSite, DateBenthicSample, Order, Family, Count)

usethis::use_data(benthiccount, overwrite = TRUE)

efsite %<>%
  rename(geometry = Upstream) %>%
  tibble::as_tibble() %>%
  rename(Creek = Waterbody,
         DominantSubstrate = DomSub) %>%
  mutate(EFSite = factor(EFSite),
         Creek = str_replace(as.character(Creek), " Creek", ""),
         Creek = factor(Creek, levels = levels(creek$Creek)),
         DominantSubstrate = fct_recode(DominantSubstrate, Boulder = "B", Cobble = "C")) %>%
  select(EFSite, Creek, SiteLength, Elevation, DominantSubstrate, geometry)

efspecies %<>%
  mutate(Species = factor(Species),
         CommonName = factor(CommonName))

usethis::use_data(efspecies, overwrite = TRUE)

efvisit %<>%
  select(EFSite, DateEFVisit = DateTimeEFVisitStart,
         Conductivity, EFSecPass1, EFSecPass2, EFSecPass3) %>%
  mutate(EFSite = factor(EFSite, levels = levels(efsite$EFSite)),
         DateEFVisit = dttr2::dtt_date(DateEFVisit))

effish %<>%
  rename(DateEFVisit = DateTimeEFVisitStart) %>%
  mutate(EFSite = factor(EFSite, levels = levels(efsite$EFSite)),
         Species = factor(Species, levels = levels(efspecies$Species)),
         DateEFVisit = dttr2::dtt_date(DateEFVisit),
         BodyWeight = as.double(BodyWeight)) %>%
  select(EFSite, DateEFVisit, EFPass, FishNumber, Species, ForkLength, BodyWeight)

usethis::use_data(effish, overwrite = TRUE)


tempsite %<>%
  tibble::as_tibble() %>%
  rename(Creek = WaterBody) %>%
  mutate(TempSite = factor(TempSite),
         Creek = str_replace(Creek, " Creek", ""),
         Creek = factor(Creek, levels = creek$Creek))

usethis::use_data(tempsite, overwrite = TRUE)
