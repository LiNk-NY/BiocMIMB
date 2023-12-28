# BiocMIMB

Methods in Molec Biol/Cancer Bioinfo article

Repo is currently public.  

The Rmd should be converted to pdf using `rmarkdown::render("bioccb.Rmd")`
It seems that a clean machine would need at least 30GB of RAM to compile.
Good latex and pandoc support are required.

You need packages

```
needed = c("curatedTCGAData", "TCGAutils", "dplyr", "kableExtra", "TCGAutils",
"survival", "GGally", "cBioPortalData", "GenomicRanges", "ggplot2",
"BiocFileCache", "ExperimentHub", "AnnotationHub", "TumourMethData",
"BiocStyle", "ensembldb",
"SpatialFeatureExperiment", "SFEData")
```

in addition to knitr and rmarkdown.

The first build in a session is slow.  Caching might be used later.  The slowness
comes from grabbing all assays on a few TCGA tumors, and from resolving various
hub requests.

