#' Stats
#'
#' Returns stats data from TweetCongress 'Tweets' API
#'
#' @param parse Logical indicating whether to convert the retrieved JSON data
#'   into a tidy tibble data frame. Default is TRUE.
#' @return A list of four tibbles (data frames) with various meta data and
#'   Twitter-related data about members of the current U.S. Congress.
#' @examples
#'
#' \dontrun{
#' ## get tweeters data
#' stats <- tcc_stats()
#' }
#'
#' @export
tcc_stats <- function(parse = TRUE) {
  ## helps with long numeric identifiers
  op <- options()
  on.exit(options(op))
  options(scipen = 20, digits = 20)

  ## get first page
  twurl <- "http://www.tweetcongress.org/api/stats?format=json&page="
  p <- jsonlite::fromJSON(twurl)
  ## if NULL; try again; if nothing; return
  if (length(p) == 0) {
    Sys.sleep(0.25)
    p <- tryCatch(jsonlite::fromJSON(twurl),
      error = function(e) NULL)
    if (length(p) == 0) {
      return(tibble::tibble())
    }
  }
  ## parse/return
  if (parse) {
    p <- tcc_parse_data(p)
  }
  p
}
