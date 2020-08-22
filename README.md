# MultiFastaDemultiplexer

!Be careful!
Script is working but incomplete, only minimal testing was performed. The script will be substantially upgraded soon.

Protein Sequence from annotation often contain multiple gene version for the same locus. For various application onlyone single gene model is needed. MultiFastaDemultiplexer subsets a input fasta and keeps only the longest annotated sequence.


### Usage

Download
```
git clone https://github.com/mwylerCH/MultiFastaDemultiplexer
chmod +x MultiFastaDemultiplexer/MultiFastaReduceR
```

Subset fasta
```
MultiFastaReduceR DNA OverAnnotatedFASTA.fa
```
