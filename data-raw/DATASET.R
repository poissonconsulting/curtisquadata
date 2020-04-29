library(tidyverse)
library(magrittr)

rm(list = ls())

conn <- poissqlite::ps_connect_sqlite("~/Poisson/Databases/curtis-qua-prod.sqlite")

poissqlite::ps_load_tables(conn = conn, rename = stringr::str_to_lower)

poissqlite::ps_disconnect_sqlite(conn)

analyte %<>% select(-GeneralMethod)

usethis::use_data(analyte, overwrite = TRUE)

biosite %<>% tibble::as_tibble()

biosite %<>%
  rename(Section = BioSite,
         Creek = Waterbody) %>%
  mutate(Section = str_replace(Section, "(CUR)|(QUA)", ""),
         Section = str_to_lower(Section),
         Section = factor(Section, levels = unique(Section)),
         Creek = str_replace(Creek, " Creek", ""),
         Creek = factor(Creek, levels = unique(Creek)))

site <- biosite
rm(biosite)
usethis::use_data(site, overwrite = TRUE)
