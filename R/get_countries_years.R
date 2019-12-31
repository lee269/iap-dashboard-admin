#' get_countries_years
#'
#' Download complete trade data for a set of countries and years
#'
#' @param periods a vector of years
#' @param reporters a vector of reporter (country) codes
#' @param token bulk download API access token
#' @param dest_folder folder to save file in format id-year.<suffix>. Defaults
#'   to working directory
#' @param unzip whether to unzip the downloaded file.
#'
#' @return data is saved into the location specifid in dest_folder
#' @export
#'
#' @examples
#' \dontrun{
#' get_countries_years(c(2015:2018), c(152, 156), "xxxx", "~/downloads", FALSE)
#' }
get_countries_years <- function(periods,
                                reporters,
                                token = "",
                                dest_folder = getwd(),
                                unzip = FALSE){

  if (token == "") {
    stop("API key token required")
  }


  # because the paramaters can be lists of different lengths we need to convert to
  # a list of equal length elements for pmap
  params <- purrr::transpose(purrr::cross(list(periods, reporters, token, dest_folder, unzip)))

  # multiple countries, multiple years
  purrr::pmap(params, get_country_year)

}
