## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include=TRUE, message=FALSE---------------------------------------------
library(taxonbridge)
sample <- load_sample()
dim(sample)

## ---- include=TRUE------------------------------------------------------------
lineages <- get_lineages(sample)

## ---- include= TRUE-----------------------------------------------------------
kingdom <- get_validity(lineages, rank = "kingdom", valid = FALSE)
family <- get_validity(lineages, rank = "family", valid = FALSE)
candidates <- list(kingdom, family)

## ---- include= TRUE-----------------------------------------------------------
get_inconsistencies(candidates, uninomials = FALSE)

## ---- include= TRUE-----------------------------------------------------------
lineages[lineages$canonicalName=="Attheya septentrionalis", "taxonomicStatus"]

## ---- include= TRUE-----------------------------------------------------------
lineages <- get_status(get_lineages(sample), status = "accepted")
kingdom <- get_validity(lineages, rank = "kingdom", valid = FALSE)
family <- get_validity(lineages, rank = "family", valid = FALSE)
candidates <- list(kingdom, family)
get_inconsistencies(candidates, uninomials = FALSE)

## ---- include=TRUE, message=FALSE---------------------------------------------
library(taxonbridge)
sample <- load_sample()
decapoda <- get_taxa(sample, order = "decapoda")

## ---- include=TRUE, message=FALSE---------------------------------------------
swimming_crabs <- get_taxa(sample, family = "portunidae")

## ---- include=TRUE, message=FALSE---------------------------------------------
decapoda <- annotate(decapoda, names = swimming_crabs$canonicalName, 
                     new_column = "swimming_crabs", present = "1")

## ---- include=TRUE, message=TRUE----------------------------------------------
colnames(decapoda)

## ---- include=TRUE, message=TRUE----------------------------------------------
decapoda[!is.na(decapoda$swimming_crabs),"canonicalName"]

## ---- include=TRUE, message=TRUE, fig.show="hold"-----------------------------
GBIF_dist <- prepare_rank_dist(decapoda, GBIF = TRUE)
NCBI_dist <- prepare_rank_dist(decapoda, NCBI = TRUE)
plot_mdb(GBIF_dist)
plot_mdb(NCBI_dist)

## ---- include=TRUE, message=TRUE----------------------------------------------
GBIF_dist
NCBI_dist 

## ---- include=TRUE, message=TRUE, fig.show="hold"-----------------------------
lineages <- get_lineages(decapoda)
GBIF_dist <- prepare_rank_dist(lineages, GBIF = TRUE)
NCBI_dist <- prepare_rank_dist(lineages, NCBI = TRUE)
plot_mdb(GBIF_dist)
plot_mdb(NCBI_dist)

## ---- include=TRUE, message=TRUE----------------------------------------------
get_validity(decapoda, valid = FALSE)

## ---- include=TRUE, message=TRUE----------------------------------------------
decapoda <- annotate(decapoda, get_validity(decapoda, valid = FALSE)$canonicalName,
                    new_column = "family_inconsistencies", present = 1)
colnames(decapoda)
decapoda[!is.na(decapoda$family_inconsistencies),"canonicalName"]

