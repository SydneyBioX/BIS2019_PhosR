if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
#install.packages("devtools", repos="https://cran.rstudio.com")
#devtools::install_github("Bioconductor/BiocManager")
library(BiocManager)

if(BiocManager::version() != "3.10"){
    BiocManager::install(version="3.10",
                         update=TRUE, ask=FALSE)
}

std_pkgs <- c("remotes", "directPA", "ClueR")

gh_pkgs <- c("PengyiYang/PhosR")

builtins <- c(std_pkgs, gh_pkgs)

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(BiocManager::install(builtin,
                                              version="3.10",
                                              update=TRUE, ask=FALSE))
