# REfind
REfind providing several function to assist user in finding the best restriction enzymes for PCR-RFLP based species identification. 
This package available only on Github. REfind will install all required dependencies from CRAN, but you have to install Biostrings manualy from Bioconductor prior to install REfind

```
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")

if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")
devtools::install_github("indriatmoko07/REfind")

```
