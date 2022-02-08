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

