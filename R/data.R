#' Combined Nomenclature commodity codes and FFD categories
#'
#' A data frame of 5909 records and 26 variables containing commodity codes and
#' descriptions. Codes cover the core FFD set and the FFD+ set.
#'
#' \describe{
#' \item{`Com Code`}{8 digit commodity code}
#' \item{`Com Description`}{Commodity description}
#' \item{`SIT Code`}{SIT Code}
#' \item{`SIT Description`}{SIT description}
#' \item{`DIV Code`}{DIV code}
#' \item{`DIV Description`}{DIVdescription}
#' \item{`SECT Code`}{SECT code}
#' \item{`Short SITC Code`}{SITC code}
#' \item{`HS6 code`}{HS6}
#' \item{`HS6 Description`}{HS6 description}
#' \item{`HS4 code`}{HS4}
#' \item{`HS4 Description`}{HS$ description}
#' \item{`HS2 code`}{HS2 description}
#' \item{`HS2 Description`}{HS2 description}
#' \item{`Indigeneity`}{Indigenity code}
#' \item{`Indig Description`}{Indigeneity description}
#' \item{`Degree of processing`}{DOP code}
#' \item{`DOP Description`}{DOP description}
#' \item{`FFD`}{FFD code}
#' \item{`FFD DESC`}{FFD description}
#' \item{`AUK DESC`}{AUK description}
#' \item{`FFD plus`}{FFD+}
#' \item{`Brigade1`}{Brigade 1}
#' \item{`Brigade2`}{Brigade 2}
#' \item{`Brigade3`}{Brigade 3}
#' \item{`Introduced`}{description}
#' }
#'
#' @source HMRC
"cncodes"


#' Comtrade reporter country codes
#'
#' A data frame of 5909 records and 26 variables containing commodity codes and
#' descriptions. Codes cover the core FFD set and the FFD+ set.
#'
#' \describe{ \item{id}{country id}
#' \item{text}{Country name}
#' }
#'
#' @source Comtrade \url{http://comtrade.un.org}
"reporters"


#' Country details
#'
#' A data frame of 174 records and 11 variables containing country metadata.
#'
#' \describe{
#' \item{stuff to do}{...}
#'
#' }
#'
#' @source Comtrade \url{http://comtrade.un.org}
"countries"

#' FFD trade data
#'
#' A data frame of 174 records and 11 variables containing country metadata.
#'
#' \describe{
#' \item{stuff to do}{...}
#'
#' }
#'
#' @source Comtrade \url{http://comtrade.un.org}
"ffd_trade"
