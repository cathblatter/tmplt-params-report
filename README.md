
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Template for parametrised reporting

*originally set up for reporting in multilingual settings at [Institute
of Nursing Science](https://github.com/INS-Basel)*  
*Catherine Blatter, 2018-2020*

## How does it work?

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

*section is work in progress*

In general, parametrised reports<sup>[1](#myfootnote1)</sup> have
usually the same structure, layout and computational background, but
depending on the input of parameters some of these properties may and
some always change (computational results). In our case the main change
driven by the parameter ‘language’ affects the structure and some layout
properties (i.e. affecting everything captured in text not in numbers).
In few cases, the structure changes based on the underlying data
(i.e. the parameter ‘center’ ); e.g. if a center does not have more than
one unit, there is no need to add additional “per unit” results on a
different page, thus this past should be omitted.

This graph provides an overview of the workflow from top to bottom. The
main file to use in production is `index.Rmd`. Knitting `index.Rmd` will
(when configured properly) output a file called `index.pdf` tailored to
the center defined in `params$center`. While the results (i.e. the
cell-content of the tables) are dependent on the center chosen, the
computational code stays the same. General table formatting
(e.g. `kableExtra::kable()` and `kable_styling()`) remains mostly the
same, too. The process is then split based on the language-parameter:
Depending on its input, formatting/styling of text in table headers
changes and, expectantly, different text files used to be stitched
together as the report.

<div align="center">

![Logic workflow](docs/img/graph_tmpls-report.png)

</div>

The graph is a draft and should serve to support the main idea behind
these reports. It is neither complete nor exclusive and feedback is
welcome. More detailed information is to be found in the vignette (which
is as to date not available, 2020-02-17).

## Main features & how to use it

Parameter features include for now:

-   `center`  
-   `language` (allows for reporting in several languages for same
    center, important for bilingual cities)  
-   `restrict_level` (if pct-agreement per answer should be restricted
    if less than X answers were given per group to protect respondents)

Other features include:  
- logo(s) in header  
- inclusion of cover pages from external pdfs  
- switch from `rmarkdown::pdf_document` to
`bookdown::pdf_document2`allows cross-platform editing (windows, mac and
linux users) without the encoding-snafu

The easiest is to fork/clone or download this repo and start working
locally. For plain workflow you can remove `docs/`, `README.md` and
`README.Rmd`.

## Disclaimer

If you find this template helpful or use it for your work, consider
mentioning all contributors to this repo.

Have an idea for the better? File an issue or start a PR.

*Report was setup with:*

``` r
sessionInfo()
#> R version 4.0.4 (2021-02-15)
#> Platform: x86_64-apple-darwin17.0 (64-bit)
#> Running under: macOS Catalina 10.15.7
#> 
#> Matrix products: default
#> BLAS:   /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRblas.dylib
#> LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib
#> 
#> locale:
#> [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_4.0.4    magrittr_2.0.1    tools_4.0.4       htmltools_0.5.1.1
#>  [5] yaml_2.2.1        stringi_1.5.3     rmarkdown_2.7     knitr_1.31       
#>  [9] stringr_1.4.0     xfun_0.21         digest_0.6.27     rlang_0.4.10     
#> [13] evaluate_0.14
```

``` r
rmarkdown::pandoc_version()
#> [1] '2.12'
```

### Acknowlegdements

Thanks to @yihui (the creator of rmarkdown/bookdown and other packages),
@sharlagelfand for pointing me to bookdown in the first place & @EethB
for fixing the header width.

<a name="myfootnote1">1</a>:
<https://bookdown.org/yihui/rmarkdown/parameterized-reports.html>
