#!/usr/bin/env Rscript 
# script to select longest variant if locus is annotated multiple time
# PROVISIONAL SCRIPT (no testing, no I/O check, only AA sequence)
library(biomaRt)
library(seqinr)
library(tidyverse)

args <- commandArgs(TRUE)
FASTA <- args[1]

# file Names
FASTANAME <- gsub("^.*/", "", FASTA)
OUTFASTA <- gsub("fa$",'OneGeneModel.fa', FASTANAME)
OUTFASTA <- gsub("fasta$",'OneGeneModel.fa', OUTFASTA)


originalFasta <- read.fasta(FASTA, seqtype = 'AA')

# extract name and length
lunghezza <- as.data.frame(names(originalFasta))
lunghezza$len <- as.data.frame(getLength(originalFasta))

# remove version
lunghezza$locus <- gsub("\\.[[:digit:]]+",'', lunghezza$`names(originalFasta)`)
cico <- lunghezza %>% 
  group_by(locus) %>% 
  mutate(mostLen = max(len)) %>% 
  filter(len == mostLen) %>% 
  slice_head(n=1)

  

# subset original fasta for longest
subsettedFasta <- originalFasta[names(originalFasta) %in% cico$`names(originalFasta)`]

# write out
write.fasta(subsettedFasta, names = names(subsettedFasta), file.out = OUTFASTA, 
            open = "w", nbchar = 60, as.string = FALSE)
