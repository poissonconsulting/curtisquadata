<!-- README.md is generated from README.Rmd. Please edit that file -->
curtisquadata
=============

<!-- badges: start -->
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R build
status](https://github.com/poissonconsulting/curtisquadata/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/curtisquadata/actions)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/curtisquadata/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/curtisquadata?branch=master)
[![License:
CC0](https://img.shields.io/badge/License-CC0-green.svg)](https://creativecommons.org/publicdomain/zero/1.0/legalcode)
[![CRAN
status](https://www.r-pkg.org/badges/version/curtisquadata)](https://CRAN.R-project.org/package=curtisquadata)
<!-- badges: end -->

`curtisquadata` is an R package of 15 relational tibbles from the Curtis
and Qua Creeks Productivity study.

    ls("package:curtisquadata") # the tibbles
    #>  [1] "analyte"              "analytesample"        "analytevalue"         "benthiccount"        
    #>  [5] "benthicsample"        "biosite"              "creek"                "effish"              
    #>  [9] "efsite"               "efspecies"            "efvisit"              "expect_null"         
    #> [13] "library.dynam.unload" "periphyton"           "system.file"          "taxon"               
    #> [17] "temperature"          "tempsite"

    library(tibble) # for prettier printing
    efvisit
    #> # A tibble: 24 x 6
    #>    EFSite DateEFVisit Conductivity EFSecPass1 EFSecPass2 EFSecPass3
    #>    <fct>  <date>      <units>           <int>      <int>      <int>
    #>  1 CUR1   2015-08-12  58                  224        141        146
    #>  2 CUR2   2015-08-12  56                  216        168          0
    #>  3 CUR3   2015-08-12  19                  261        204          0
    #>  4 CUR4   2015-08-12  19                  175        117          0
    #>  5 QUA1   2015-08-10  64                  200        199        174
    #>  6 QUA2   2015-08-11  63                  215        179          0
    #>  7 QUA3   2015-08-11  49                  249        192          0
    #>  8 QUA4   2015-08-10  44                  333        219        199
    #>  9 QUA1   2016-08-02  56                  271        250        189
    #> 10 QUA2   2016-08-02  56                  355        285        161
    #> # … with 14 more rows

    effish
    #> # A tibble: 277 x 7
    #>    EFSite DateEFVisit EFPass FishNumber Species ForkLength BodyWeight
    #>    <fct>  <date>       <int>      <int> <fct>        <int>      <dbl>
    #>  1 QUA2   2015-08-11       1          1 RB              64        4.9
    #>  2 QUA2   2015-08-11       1          2 RB             214       91.4
    #>  3 QUA2   2015-08-11       1          3 RB             196       73.8
    #>  4 QUA2   2015-08-11       1          4 RB             190       73.8
    #>  5 QUA2   2015-08-11       1          5 RB             175       60.2
    #>  6 QUA2   2015-08-11       1          6 RB             185       72.5
    #>  7 QUA2   2015-08-11       1          7 RB             180       65.1
    #>  8 QUA2   2015-08-11       1          8 RB             122       22.1
    #>  9 QUA2   2015-08-11       1          9 RB             123       21.2
    #> 10 QUA2   2015-08-11       1         10 RB             125       23.6
    #> # … with 267 more rows

Installation
------------

<!-- To install the latest release from [CRAN](https://cran.r-project.org) -->
To install the developmental version from
[GitHub](https://github.com/poissonconsulting/curtisquadata)

    # install.packages("remotes")
    remotes::install_github("poissonconsulting/curtisquadata")

Information
-----------

The study which ran from 2015 to 2017 collected data on the water
quality and temperature, periphyton, benthic invertebrates and fish
populations of Curtis and Qua Creeks in the Salmo Watershed, British
Columbia.

The final report by [Nellestijn and Irvine
(2017)](http://a100.gov.bc.ca/appsdata/acat/documents/r52848/COL_F17_F_1410_1507656727296_7649412937.pdf)
assesses whether the creeks are suitable for nutrient restoration.

The data are analysed by [Thorley and Dalgarno
(2018)](https://www.poissonconsulting.ca/analyses/curtis-qua-prod-17/)

Contribution
------------

Please report any
[issues](https://github.com/poissonconsulting/pkgtemplate/issues).

[Pull requests](https://github.com/poissonconsulting/pkgtemplate/pulls)
are always welcome.

Code of Conduct
---------------

Please note that the curtisquadata project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

Acknowledgements
----------------

The study was primarily funded by the Fish and Wildlife Compensation
Program and partially funded by the Salmo Watershed Streamkeepers
Society. Lynn Westcott of Westcott Environmental Services identified and
counted the benthic macroinvertebrates. CARO Analytic analysed the water
and periphyton samples
