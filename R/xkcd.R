#' @title Retrieve metadata about an XKCD comic
#'
#' @description
#' Given an xkcd comic number, this function retrieves a JSON object describing that comic from the official xkcd API.
#'
#' @importFrom jsonlite read_json
#'
#' @param number A scalar numeric vector identifying a XKCD comic by comic.
#'
#' @return A list of class xkcd with the following elements
#' * month: A scalar character vector identifying the month of the year the comic was published
#' * num: A scalar numeric vector identifying the comic by number
#' * link
#' * year
#' * safe_title
#' etc.
#'
#' Note that many of these elements may hold missing data.
#'
#' @examples
#' # example code DO THIS NOT example
#' first_comic <- xkcd(1)
#' print(first_comic)
#'
#'
#'
#' @export
xkcd <- function(number) {
  url <- file.path("https://xkcd.com", number, "info.0.json")
  results <- jsonlite::read_json(url)
  return(results)
}

#' @title Plot an XKCD comic
#'
#' @description
#' Given an [`xkcd`] object, this [`base::plot`] method retrieves the image file associated with
#' this comic from the XKCD website and displays it in the currently active graphics device.
#'
