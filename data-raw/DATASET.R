library(tidyverse)
library(magrittr)

rm(list = ls())

conn <- poissqlite::ps_connect_sqlite("~/Poisson/Databases/curtis-qua-prod.sqlite")

poissqlite::ps_load_tables(conn = conn, rename = stringr::str_to_lower)

poissqlite::ps_disconnect_sqlite(conn)

usethis::use_data(analyte, overwrite = TRUE)

biosite %<>% tibble::as_tibble()

biosite %<>% mutate(BioSite = factor(BioSite),
                    Waterbody = factor(Waterbody, levels = unique(Waterbody)))

usethis::use_data(biosite, overwrite = TRUE)
