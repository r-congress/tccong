
<!-- README.md is generated from README.Rmd. Please edit that file -->

# twcong

<!-- badges: start -->

<!-- badges: end -->

A simple interface to [TweetCongress](http://www.tweetecongress.com/)
APIs

## Installation

You can install the released version of twcong from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("twcong")
```

Or from Github

``` r
remotes::install_github("r-congress/twcong")
```

## Tweeters API

Data returned from TweetCongress’ Tweeters API

``` r
## fetch tweeters data
twt <- twcong_tweeters()

## view data
twt
#> # A tibble: 532 x 31
#>    `_id` slug  fullName gender dateOfBirth phone email profileImageSma… website
#>    <chr> <chr> <chr>    <chr>  <chr>       <chr> <lgl> <chr>            <chr>  
#>  1 A000… A000… Ralph A… M      1954-09-16  202-… NA    https://theunit… https:…
#>  2 A000… A000… Alma Ad… F      1946-05-27  202-… NA    https://theunit… https:…
#>  3 A000… A000… Robert … M      1965-07-22  202-… NA    https://theunit… https:…
#>  4 A000… A000… Pete Ag… M      1979-06-19  202-… NA    https://theunit… https:…
#>  5 A000… A000… Lamar A… M      1940-07-03  202-… NA    https://theunit… https:…
#>  6 A000… A000… Rick Al… M      1951-11-07  202-… NA    https://theunit… https:…
#>  7 A000… A000… Colin A… M      1983-04-15  202-… NA    https://theunit… https:…
#>  8 R000… R000… Aumua A… F      1947-12-29  202-… NA    https://theunit… https:…
#>  9 A000… A000… Mark Am… M      1958-06-12  202-… NA    https://theunit… https:…
#> 10 A000… A000… Kelly A… M      1976-10-08  202-… NA    https://theunit… https:…
#> # … with 522 more rows, and 22 more variables: facebookUserName <chr>,
#> #   twitterUserName <chr>, fullState <chr>, address <chr>, leadershipRole <lgl>,
#> #   chamber <chr>, district <int>, state <chr>, party <chr>, termEnd <lgl>,
#> #   termStart <chr>, title <lgl>, country <chr>, profileImageUrl <chr>, verified <lgl>,
#> #   friendsCount <int>, statusesCount <int>, followersCount <int>, url <chr>,
#> #   screenName <chr>, name <chr>, idStr <dbl>
```
