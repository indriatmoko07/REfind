# REfind <img src='![REfind (1)](https://github.com/indriatmoko07/REfind/assets/88871879/ab5746a6-cb4c-4ff7-8e37-a28d54cf48a9)' align="right" height="160" /> 

REfind provides several functions to assist users in finding the best restriction enzymes for PCR-RFLP-based species identification. 
This package is available only on GitHub. REfind will install all required dependencies from CRAN, but you have to install Biostrings manually from Bioconductor prior to installing REfind. Update 21/2/2024. Because seqRFLP as one of dependency is no longer available from cran, I add a short script to install seqRFLP from github 

```
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")

if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")
devtools::install_github("helixcn/seqRFLP")
devtools::install_github("indriatmoko07/REfind")

```

To provide you with a brief overview of the main idea of using REfind, this workflow may help
![Capture](https://github.com/indriatmoko07/REfind/assets/88871879/328326da-3e45-4552-8ed1-cdbc189410f7)
