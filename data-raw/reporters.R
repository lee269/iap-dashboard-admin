## code to prepare `reporters` dataset goes here
reporters <- jsonlite::fromJSON("https://comtrade.un.org/Data/cache/reporterAreas.json", flatten = TRUE)
reporters <- reporters$results %>%
  dplyr::filter(id != "all") %>%
  dplyr::mutate(id = as.numeric(id)) %>%
  tibble::as_tibble()

usethis::use_data(reporters)
