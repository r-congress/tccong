
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tccong

<!-- badges: start -->

<!-- badges: end -->

A simple interface to [TweetCongress](http://www.tweetecongress.com/)
APIs

## Installation

You can install the released version of **tccong** from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tccong")
```

Or from Github

``` r
remotes::install_github("r-congress/tccong")
```

## Tweeters

Data returned from TweetCongress’ Tweeters API

``` r
## fetch tweeters data
twtrs <- tcc_tweeters()

## view data
twtrs
#> # A tibble: 532 x 31
#>    `_id` slug  fullName gender dateOfBirth phone email profileImageSma… website facebookUserName
#>    <chr> <chr> <chr>    <chr>  <chr>       <chr> <lgl> <chr>            <chr>   <chr>           
#>  1 A000… A000… Ralph A… M      1954-09-16  202-… NA    https://theunit… https:… CongressmanRalp…
#>  2 A000… A000… Alma Ad… F      1946-05-27  202-… NA    https://theunit… https:… CongresswomanAd…
#>  3 A000… A000… Robert … M      1965-07-22  202-… NA    https://theunit… https:… RobertAderholt  
#>  4 A000… A000… Pete Ag… M      1979-06-19  202-… NA    https://theunit… https:… reppeteaguilar  
#>  5 A000… A000… Lamar A… M      1940-07-03  202-… NA    https://theunit… https:… senatorlamarale…
#>  6 A000… A000… Rick Al… M      1951-11-07  202-… NA    https://theunit… https:… CongressmanRick…
#>  7 A000… A000… Colin A… M      1983-04-15  202-… NA    https://theunit… https:… <NA>            
#>  8 R000… R000… Aumua A… F      1947-12-29  202-… NA    https://theunit… https:… aumuaamata      
#>  9 A000… A000… Mark Am… M      1958-06-12  202-… NA    https://theunit… https:… MarkAmodeiNV2   
#> 10 A000… A000… Kelly A… M      1976-10-08  202-… NA    https://theunit… https:… <NA>            
#> # … with 522 more rows, and 21 more variables: twitterUserName <chr>, fullState <chr>,
#> #   address <chr>, leadershipRole <lgl>, chamber <chr>, district <int>, state <chr>, party <chr>,
#> #   termEnd <lgl>, termStart <chr>, title <lgl>, country <chr>, profileImageUrl <chr>,
#> #   verified <lgl>, friendsCount <int>, statusesCount <int>, followersCount <int>, url <chr>,
#> #   screenName <chr>, name <chr>, idStr <dbl>
```

## Tweets

Data returned from TweetCongress’ Tweets API

``` r
## fetch tweeters data
twts <- tcc_tweets()

## view data
twts
#> # A tibble: 20 x 8
#>    created_date   id_str   text              fullName  party slug     state profileImageSmall       
#>    <chr>          <chr>    <chr>             <chr>     <chr> <chr>    <chr> <chr>                   
#>  1 2019-12-11T01… 1204569… Once again, we’r… Cory Boo… D     B001288… NJ    https://pbs.twimg.com/p…
#>  2 2019-12-11T01… 1204568… "Because of the … Charles … D     S000148… NY    https://pbs.twimg.com/p…
#>  3 2019-12-11T01… 1204568… "RT @HispanicCau… Linda Sá… D     S001156… CA    https://pbs.twimg.com/p…
#>  4 2019-12-11T01… 1204568… BREAKING: A judg… Lucille … D     R000486… CA    https://pbs.twimg.com/p…
#>  5 2019-12-11T01… 1204568… The USMCA agreem… Lucy McB… D     M001208… GA    https://pbs.twimg.com/p…
#>  6 2019-12-11T01… 1204568… "The final annua… Martha M… R     M001197… AZ    https://pbs.twimg.com/p…
#>  7 2019-12-11T01… 1204568… Proud to stand w… Tom Emmer R     E000294… MN    https://pbs.twimg.com/p…
#>  8 2019-12-11T01… 1204567… When it comes to… Jimmy Go… D     G000585… CA    https://pbs.twimg.com/p…
#>  9 2019-12-11T01… 1204567… Grateful for the… Antonio … D     D000630… NY    https://pbs.twimg.com/p…
#> 10 2019-12-11T01… 1204567… Rising sea level… Brian Sc… D     S001194… HI    https://pbs.twimg.com/p…
#> 11 2019-12-11T01… 1204567… RT @ChrisVanHoll… Charles … D     S000148… NY    https://pbs.twimg.com/p…
#> 12 2019-12-11T01… 1204566… Today, I met wit… Rick Sco… R     S001217… FL    https://pbs.twimg.com/p…
#> 13 2019-12-11T01… 1204566… Digital currency… Anthony … R     G000588… OH    https://pbs.twimg.com/p…
#> 14 2019-12-11T01… 1204566… About to join @t… Andy Big… R     B001302… AZ    https://pbs.twimg.com/p…
#> 15 2019-12-11T00… 1204566… Our Call with Yo… Sharice … D     D000629… KS    https://pbs.twimg.com/p…
#> 16 2019-12-11T00… 1204566… "RT @Jim_Jordan:… Andy Big… R     B001302… AZ    https://pbs.twimg.com/p…
#> 17 2019-12-11T00… 1204565… The passage of l… Debbie D… D     D000624… MI    https://pbs.twimg.com/p…
#> 18 2019-12-11T00… 1204565… 1st Democrats sa… Charles … R     G000386… IA    https://pbs.twimg.com/p…
#> 19 2019-12-11T00… 1204565… I thank Speaker … Gwen Moo… D     M001160… WI    https://pbs.twimg.com/p…
#> 20 2019-12-11T00… 1204565… RT @sahluwal: In… Joaquin … D     C001091… TX    https://pbs.twimg.com/p…
```

## Stats

Data returned from TweetCongress’ Stats API

``` r
## fetch tweeters data
sts <- tcc_stats()

## view data
sts
#> $mostActive
#> # A tibble: 10 x 31
#>    `_id` slug  fullName gender dateOfBirth phone email profileImageSma… website facebookUserName
#>    <chr> <chr> <chr>    <chr>  <chr>       <chr> <lgl> <chr>            <chr>   <chr>           
#>  1 C001… C001… John Co… M      1952-02-02  202-… NA    https://theunit… https:… sen.johncornyn  
#>  2 S000… S000… Bernard… M      1941-09-08  202-… NA    https://theunit… https:… senatorsanders  
#>  3 B001… B001… Donald … M      1950-06-20  202-… NA    https://theunit… https:… RepDonBeyer     
#>  4 H000… H000… Steny H… M      1939-06-14  202-… NA    https://theunit… https:… WhipHoyer       
#>  5 E000… E000… Dwight … M      1954-05-16  202-… NA    https://theunit… https:… RepDwightEvans  
#>  6 M001… M001… Patty M… F      1950-10-11  202-… NA    https://theunit… https:… <NA>            
#>  7 J000… J000… Pramila… F      1965-09-21  202-… NA    https://theunit… https:… RepJayapal      
#>  8 P000… P000… Robert … M      1955-12-19  202-… NA    https://theunit… https:… senrobportman   
#>  9 S000… S000… Charles… M      1950-11-23  202-… NA    https://theunit… https:… senschumer      
#> 10 L000… L000… Patrick… M      1940-03-31  202-… NA    https://theunit… https:… SenatorPatrickL…
#> # … with 21 more variables: twitterUserName <chr>, fullState <chr>, address <chr>,
#> #   leadershipRole <lgl>, chamber <chr>, district <int>, state <chr>, party <chr>, termEnd <lgl>,
#> #   termStart <chr>, title <lgl>, country <chr>, profileImageUrl <chr>, verified <lgl>,
#> #   friendsCount <int>, statusesCount <int>, followersCount <int>, url <chr>, screenName <chr>,
#> #   name <chr>, idStr <dbl>
#> 
#> $mostFollowed
#> # A tibble: 10 x 31
#>    `_id` slug  fullName gender dateOfBirth phone email profileImageSma… website facebookUserName
#>    <chr> <chr> <chr>    <chr>  <chr>       <chr> <lgl> <chr>            <chr>   <chr>           
#>  1 S000… S000… Bernard… M      1941-09-08  202-… NA    https://theunit… https:… senatorsanders  
#>  2 W000… W000… Elizabe… F      1949-06-22  202-… NA    https://theunit… https:… senatorelizabet…
#>  3 P000… P000… Nancy P… F      1940-03-26  202-… NA    https://theunit… https:… NancyPelosi     
#>  4 P000… P000… Rand Pa… M      1963-01-07  202-… NA    https://theunit… https:… SenatorRandPaul 
#>  5 S000… S000… Charles… M      1950-11-23  202-… NA    https://theunit… https:… senschumer      
#>  6 S001… S001… Adam Sc… M      1960-06-22  202-… NA    https://theunit… https:… RepAdamSchiff   
#>  7 F000… F000… Dianne … F      1933-06-22  202-… NA    https://theunit… https:… senatorfeinstein
#>  8 C001… C001… Ted Cruz M      1970-12-22  202-… NA    https://theunit… https:… SenatorTedCruz  
#>  9 W000… W000… Maxine … F      1938-08-15  202-… NA    https://theunit… https:… MaxineWaters    
#> 10 L000… L000… John Le… M      1940-02-21  202-… NA    https://theunit… https:… RepJohnLewis    
#> # … with 21 more variables: twitterUserName <chr>, fullState <chr>, address <chr>,
#> #   leadershipRole <lgl>, chamber <chr>, district <int>, state <chr>, party <chr>, termEnd <lgl>,
#> #   termStart <chr>, title <lgl>, country <chr>, profileImageUrl <chr>, verified <lgl>,
#> #   friendsCount <int>, statusesCount <int>, followersCount <int>, url <chr>, screenName <chr>,
#> #   name <chr>, idStr <int>
#> 
#> $mostNewMonth
#> # A tibble: 10 x 5
#>    fullName             slug                    followersDiff state party
#>    <chr>                <chr>                           <int> <chr> <chr>
#>  1 Rep. Jim Jordan      J000289-jim-jordan             127584 OH    R    
#>  2 Rep. Elise Stefanik  S001196-elise-stefanik         121094 NY    R    
#>  3 Nancy Pelosi         P000197-nancy-pelosi           118960 CA    D    
#>  4 Adam Schiff          S001150-adam-schiff            118254 CA    D    
#>  5 Sean Patrick Maloney M001185-sean-maloney            66717 NY    D    
#>  6 Kevin McCarthy       M001165-kevin-mccarthy          63842 CA    R    
#>  7 Rep. Matt Gaetz      G000578-matt-gaetz              61819 FL    R    
#>  8 Bernie Sanders       S000033-bernard-sanders         55207 VT    I    
#>  9 Mark Meadows         M001187-mark-meadows            42931 NC    R    
#> 10 Rep. Doug Collins    C001093-doug-collins            41158 GA    R    
#> 
#> $mostNewWeek
#> # A tibble: 10 x 5
#>    fullName           slug                    followersDiff state party
#>    <chr>              <chr>                           <int> <chr> <chr>
#>  1 Nancy Pelosi       P000197-nancy-pelosi            30570 CA    D    
#>  2 Rep. Matt Gaetz    G000578-matt-gaetz              20047 FL    R    
#>  3 Adam Schiff        S001150-adam-schiff             14968 CA    D    
#>  4 Rep. Jim Jordan    J000289-jim-jordan              14875 OH    R    
#>  5 Rep. Doug Collins  C001093-doug-collins            13379 GA    R    
#>  6 Kevin McCarthy     M001165-kevin-mccarthy           9260 CA    R    
#>  7 Rep. Eric Swalwell S001193-eric-swalwell            9170 CA    D    
#>  8 Bernie Sanders     S000033-bernard-sanders          9113 VT    I    
#>  9 Mark Meadows       M001187-mark-meadows             8763 NC    R    
#> 10 John Ratcliffe     R000601-john-ratcliffe           6444 TX    R
```
