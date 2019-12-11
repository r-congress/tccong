
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
#' twt <- tcc_tweeters(parse = FALSE)
#'
#' ## see it's a big, recursive list
#' str(twt, 3)
#'
#' ## now it's a nice tibble
#' tcc_parse_data(twt)
#' }
#'
#' @export
tcc_parse_data <- function(x) UseMethod("tcc_parse_data")

#' @export
tcc_parse_data.default <- function(x) {
  if (length(x) == 0) {
    x <- data.frame()
  }
  stopifnot(is.recursive(x))
  tibble::as_tibble(x)
}

#' @export
tcc_parse_data.list <- function(x) {
  if (all(c("mostActive", "mostFollowed") %in% names(x))) {
    return(tcc_parse_data(`class<-`(x, "tcc_stats_response")))
  }
  if (is.null(names(x))) {
    return(tcc_parse_data(`class<-`(x, "tcc_tweeters_responses")))
  }
  tcc_parse_data(`class<-`(x, "tcc_tweeters_response"))
}

#' @export
tcc_parse_data.tcc_stats_response <- function(x) {
  dapr::lap(dapr::lap(unclass(x), do_cbind), tibble::as_tibble)
}

#' @export
tcc_parse_data.tcc_tweeters_responses <- function(x) {
  do.call("rbind", lapply(x, tcc_parse_data))
}

#' @export
tcc_parse_data.tcc_tweeters_response <- function(x) {
  tcc_parse_data(x[["tweeters"]])
}

#' @export
tcc_parse_data.data.frame <- function(x) {
  tibble::as_tibble(do_cbind(x))
}

do_cbind <- function(x) {
  dfs <- names(x)[dapr::vap_lgl(x, is.data.frame)]
  for (i in seq_along(dfs)) {
    x <- cbind(x[names(x) != dfs[i]], x[[dfs[i]]])
  }
  x
}
