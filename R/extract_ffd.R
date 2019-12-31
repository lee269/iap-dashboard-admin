#' Extracts FFD level data at 4 digit from a comtrade bulk download zipfile
#'
#' \code{extract_ffd} is a low level function which works on a single file. Use
#' \code{\link{merge_ffd}} to do the same operation on a number of zipfiles in a single
#' folder
#'
#' @param file zipfile to process
#'
#' @return A tibble containing trade data
#' @export
#'
#' @examples
#' extract_ffd("152-2016.zip")
extract_ffd <- function(file){

  print(paste("Processing:", file))
  tmpdir <- tempdir()
  # get the csv filename from within the zipfile
  filename <- unzip(file, list = TRUE)[1,1]

  # unzip into temporary directory, read in the csv and clean up (because the unzipped csvs can be massive)
  unzip(file, exdir = tmpdir)
  all_trade <- readr::read_csv(paste0(tmpdir,"/", filename))
  file.remove(paste0(tmpdir,"/", filename))

  # hs4 is in ffd_codes.R
  # filter for food and drink and aggregate up to 4 digit, tidy up column names
  ffd_trade <- all_trade %>%
    dplyr::filter(`Trade Flow Code` == 1,
           `Aggregate Level` == 4,
           `Commodity Code` %in% hs4) %>%
    dplyr::group_by(Year, `Trade Flow`, `Reporter Code`, Reporter, `Reporter ISO`, `Partner Code`, Partner, `Partner ISO`, `Commodity Code`) %>%
    dplyr::summarise(net_weight_kg = sum(`Netweight (kg)`), trade_value_us = sum(`Trade Value (US$)`)) %>%
    dplyr::ungroup()

  colnames(ffd_trade) <- safe_names(colnames(ffd_trade))
  return(ffd_trade)
}
