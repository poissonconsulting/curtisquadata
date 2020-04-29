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
         Chla = as.double(Chla))

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

usethis::use_data(efsite, overwrite = TRUE)
