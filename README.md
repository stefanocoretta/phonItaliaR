
<!-- README.md is generated from README.Rmd. Please edit that file -->

# phonItaliaR

<!-- badges: start -->
<!-- badges: end -->

This package provides the user with the `phonitalia` data frame, which
contains the data of the PhonItalia 1.10 Corpus.

> Goslin, J., Galluzzi, C. & Romani, C. PhonItalia: a phonological
> lexicon for Italian. Behav Res 46, 872–886 (2014).
> <https://doi.org/10.3758/s13428-013-0400-8>

## Installation

You can install phonItaliaR like so:

``` r
remotes::install_github("stefanocoretta/phoneItaliaR")
```

Then:

``` r
library(tidyverse)
library(phonItaliaR)
```

``` r
data("phonitalia")
phonitalia
#> # A tibble: 120,000 × 62
#>    PhonesIPA PhonesIPA_gem PhoneSyllIPA wordSpell  nLem fqTot fqTotL fqQuo fqPer
#>    <chr>     <chr>         <chr>        <chr>     <dbl> <dbl>  <dbl> <dbl> <dbl>
#>  1 a         a             a            a          3560 50518  10.8  23982 17679
#>  2 a         a             a            a          3560  5219   8.56  2391  1948
#>  3 a         a             a            a          3560  1544   7.34   537   625
#>  4 a         a             a            a          3560   272   5.61   112    80
#>  5 a         a             a            a          3562   234   5.46   109   107
#>  6 a         a             a            a          3560   140   4.94    81    53
#>  7 a         a             a            a          3560    89   4.49    45    37
#>  8 a         a             a            a          3560    82   4.41    44    34
#>  9 a         a             a            a          3561    28   3.33    18    10
#> 10 a         a             a            a          3560     9   2.20     2     5
#> # ℹ 119,990 more rows
#> # ℹ 53 more variables: fqLib <dbl>, dispT <dbl>, dispQ <dbl>, dispP <dbl>,
#> #   dispL <dbl>, fqRelT <dbl>, fqRelQ <dbl>, fqRelP <dbl>, fqRelL <dbl>,
#> #   rango <dbl>, lung <dbl>, gramCat <chr>, lemma <chr>, word <chr>,
#> #   Phones <chr>, PhoneSyll <chr>, checked <dbl>, NumLetters <dbl>,
#> #   NumPhones <dbl>, SumSylls <dbl>, StressedSyllable <dbl>, OrthVCV <chr>,
#> #   PhonVCV <chr>, OrthUniq <dbl>, PhonUniq <dbl>, OrthUniqM1 <dbl>, …
```

Check the documentation of the data with `?phonitalia`.
