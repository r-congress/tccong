#' Tweeters
#'
#' Returns tweeter data from TweetCongress 'Tweeters' API
#'
#' @param parse Logical indicating whether to convert the retrieved JSON data
#'   into a tidy tibble data frame. Default is TRUE.
#' @return A tibble (data frame) with various meta data and Twitter-related data
#'   about members of the current U.S. Congress.
#' @examples
#'
#' \dontrun{
#' ## get tweeters data
#' tweeters <- tcc_tweeters()
#' }
#'
#' @export
tcc_tweeters <- function(parse = TRUE) {
  ## helps with long numeric identifiers
  op <- options()
  on.exit(options(op))
  options(scipen = 20, digits = 20)

  ## get first page
  twurl <- "http://www.tweetcongress.org/api/tweeters?format=json&page="
  p1 <- tryCatch(jsonlite::fromJSON(twurl),
    error = function(e) NULL)

  ## if NULL; try again; if nothing; return
  if (length(p1) == 0) {
    Sys.sleep(0.25)
    p1 <- tryCatch(jsonlite::fromJSON(twurl),
      error = function(e) NULL)
    if (length(p1) == 0) {
      return(tibble::tibble())
    }
  }

  if (!"pageCount" %in% names(p1)) {
    return(p1)
  }
  ## create URLs for all pages
  twurls <- paste0(twurl, seq_len(p1$pageCount))
  ## get JSON data
  data <- lapply(twurls, jsonlite::fromJSON)
  ## parse/return
  if (parse) {
    data <- tcc_parse_data(data)
  }
  data
}


