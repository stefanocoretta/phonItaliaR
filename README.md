
<!-- README.md is generated from README.Rmd. Please edit that file -->

# phonItaliaR

<!-- badges: start -->

<!-- badges: end -->

This package provides the user with the `phonitalia` data frame, which
contains the data of the PhonItalia 1.10 Corpus, with additional
phonemic trasncriptions added by Stefano Coretta.

> Goslin, J., Galluzzi, C. & Romani, C. PhonItalia: a phonological
> lexicon for Italian. Behav Res 46, 872–886 (2014).
> <https://doi.org/10.3758/s13428-013-0400-8>

## Installation

You can install phonItaliaR like so:

``` r
remotes::install_github("stefanocoretta/phonItaliaR")
```

Then:

``` r
library(tidyverse)
library(phonItaliaR)
```

``` r
data("phonitalia")
phonitalia
#> # A tibble: 120,000 × 64
#>    PhonesIPA PhonesIPA_gem PhonesToken PhonesToken_gem PhoneSyllIPA wordSpell
#>    <chr>     <chr>         <chr>       <chr>           <chr>        <chr>    
#>  1 a         a             a           a               a            a        
#>  2 a         a             a           a               a            a        
#>  3 a         a             a           a               a            a        
#>  4 a         a             a           a               a            a        
#>  5 a         a             a           a               a            a        
#>  6 a         a             a           a               a            a        
#>  7 a         a             a           a               a            a        
#>  8 a         a             a           a               a            a        
#>  9 a         a             a           a               a            a        
#> 10 a         a             a           a               a            a        
#> # ℹ 119,990 more rows
#> # ℹ 58 more variables: nLem <dbl>, fqTot <dbl>, fqTotL <dbl>, fqQuo <dbl>,
#> #   fqPer <dbl>, fqLib <dbl>, dispT <dbl>, dispQ <dbl>, dispP <dbl>,
#> #   dispL <dbl>, fqRelT <dbl>, fqRelQ <dbl>, fqRelP <dbl>, fqRelL <dbl>,
#> #   rango <dbl>, lung <dbl>, gramCat <chr>, lemma <chr>, word <chr>,
#> #   Phones <chr>, PhoneSyll <chr>, checked <dbl>, NumLetters <dbl>,
#> #   NumPhones <dbl>, SumSylls <dbl>, StressedSyllable <dbl>, OrthVCV <chr>, …
```

Check the documentation of the data with `?phonitalia`.
