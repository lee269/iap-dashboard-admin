#' Extract FFD trade data from all the zipfiles in a folder
#'
#' @param folder folder containing Comtrade data zipfiles
#'
#' @return A tibble containg trade data
#' @export
#'
#' @examples
#' merge_ffd("~/data")
merge_ffd <- function(folder){

  zips <- list.files(folder, full.names = TRUE)
  ffd_trade <- purrr::map_dfr(zips, extract_ffd)

  # Get HS4 comodity code descriptions and add them to the ffd data
  cncodes <- cncodes %>%
    dplyr::select(`HS4 code`, `HS4 Description`) %>%
    dplyr::transmute(commodity_code = `HS4 code`,
              commodity = `HS4 Description`) %>%
    dplyr::group_by(commodity_code, commodity) %>%
    dplyr::summarise(count = n()) %>%
    dplyr::select(-count)


  ffd_trade <- ffd_trade %>%
    dplyr::left_join(cncodes)

  return(ffd_trade)
}
