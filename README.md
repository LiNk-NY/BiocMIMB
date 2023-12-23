# BiocMIMB

Methods in Molec Biol/Cancer Bioinfo article

Repo is currently private.  

The Rmd should be converted to pdf using `rmarkdown::render("bioccb.Rmd")`

You need packages

```
needed = c("curatedTCGAData", "TCGAutils", "dplyr", "kableExtra", "TCGAutils",
"survival", "GGally")
```

in addition to knitr and rmarkdown.

The first build in a session is slow.  Caching might be used later.  The slowness
comes from grabbing all assays on a few TCGA tumors.

