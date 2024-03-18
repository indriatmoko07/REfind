# REfind  <img src='man/logo.png' align="right" height="160" />

REfind provides several functions to assist users in finding the best restriction enzymes for PCR-RFLP-based species identification. 

## Installation
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

## Usage
To provide you with a brief overview of the main idea of using REfind, this workflow may help
![Capture](https://github.com/indriatmoko07/REfind/assets/88871879/328326da-3e45-4552-8ed1-cdbc189410f7)

## Citation
Please acknowledge `REfind` by citing this paper

```
Indriatmoko and Adi Pancoro. 2023. Bioinformatic Analysis Strategy in Restriction Enzyme Selection for Indonesian Panulirus homarus Identification by PCR-RFLP.55(2):165-179.
 https://doi.org/10.5614/j.math.fund.sci.2023.55.2.4 
```

For more tools, Please visit my repository [here](https://github.com/indriatmoko07?tab=repositories)
