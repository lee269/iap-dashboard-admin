#' get_country_year
#'
#' Download complete trade for one country for one year.
#'
#' @param period year to request
#' @param reporter country id
#' @param token bulk dowload API access token
#' @param dest_folder folder to save file in format id-year.<suffix>
#' @param unzip whether to unzip the downloaded file
#'
#' @return
#' @export
#'
#' @examples
get_country_year <- function(period = "2016",
                             reporter = "152",
                             token = "",
                             dest_folder = getwd(),
                             unzip = FALSE)
  {

  if (token == "") {
    stop("API key token required")
  }

    url <- "http://comtrade.un.org/api/get/bulk/"
    type <- "C"
    freq <- "A"
    classification <- "HS"
    token <- token

    string <- paste0(url,type, "/", freq, "/", period, "/", reporter, "/", classification,"?token=", token)

    tmp <- tempfile()
    # better error handling required
    try(download.file(string, destfile = tmp))
    message(paste("Downloaded to", dest_folder))

    if (unzip == FALSE) {

      file.copy(from = tmp, to = paste0(dest_folder, "/", reporter, "-", period, ".zip"))

    } else {

      filename <- unzip(tmp, list = TRUE)
      unzip(tmp, exdir = dest_folder)
      file.rename(from = paste0(dest_folder, "/", filename[1,1]),
                  to = paste0(dest_folder, "/", reporter, "-", period, ".csv"))
    }
}


