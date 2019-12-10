#' Tweeters
#'
#' Returns data from TweetCongress 'Tweeters' API
#'
#' @param parse Logical indicating whether to convert the retrieved JSON data
#'   into a tidy tibble data frame. Default is TRUE.
#' @return A tibble (data frame) with various meta data and Twitter-related data
#'   about members of the current U.S. Congress.
#' @examples
#'
#' \dontrun{
#' ## get tweeters data
#' twt <- twcong_tweeters()
#' }
#'
#' @export
twcong_tweeters <- function(parse = TRUE) {
  ## helps with long numeric identifiers
  op <- options()
  on.exit(options(op))
  options(scipen = 20, digits = 20)

  ## get first page
  twurl <- "http://www.tweetcongress.org/api/tweeters?format=json&page="
  p1 <- jsonlite::fromJSON(twurl)
  ## if pageCount doesn't exist; try again; if nothing; return
  if (!"pageCount" %in% names(p1)) {
    Sys.sleep(0.25)
    p1 <- jsonlite::fromJSON(twurl)
    if (!"pageCount" %in% p1) {
      return(p1)
    }
  }
  ## create URLs for all pages
  twurls <- paste0(twurl, seq_len(p1$pageCount))
  ## get JSON data
  data <- lapply(twurls, jsonlite::fromJSON)
  ## parse/return
  if (parse) {
    data <- twcong_parse_data(data)
  }
  data
}

#' Parse TweetCongress data
#'
#' Converts JSON data returned by TweetCongress into tidy tibble (data frames)
#'
#' @param x Input data–this should be the JSON data retrieved from TweetCongress
#' @return A tibble (data frame) with information about Congress and Twitter.
#' @examples
#'
#' \dontrun{
#' ## get tweeters data
#' twt <- twcong_tweeters(parse = FALSE)
#'
#' ## see it's a big, recursive list
#' str(twt, 3)
#'
#' ## now it's a nice tibble
#' twcong_parse_data(twt)
#' }
#'
#' @export
twcong_parse_data <- function(x) UseMethod("twcong_parse_data")

#' @export
twcong_parse_data.default <- function(x) {
  if (length(x) == 0) {
    x <- data.frame()
  }
  stopifnot(is.recursive(x))
  tibble::as_tibble(x)
}

#' @export
twcong_parse_data.list <- function(x) {
  if (is.null(names(x))) {
    return(twcong_parse_data(`class<-`(x, "twcong_responses")))
  }
  twcong_parse_data(`class<-`(x, "twcong_response"))
}

#' @export
twcong_parse_data.twcong_responses <- function(x) {
  do.call("rbind", lapply(x, twcong_parse_data))
}

#' @export
twcong_parse_data.twcong_response <- function(x) {
  twcong_parse_data(x[["tweeters"]])
}

#' @export
twcong_parse_data.data.frame <- function(x) {
  x <- tryCatch({cbind(x[, !names(x) %in% c("office", "twitterProfile")],
    x[["office"]], x[["twitterProfile"]])
  }, error = function(e) x)
  tibble::as_tibble(x)
}
