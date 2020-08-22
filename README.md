# MultiFastaDemultiplexer

!Be careful!     
Script is working but only minimal testing was performed. 

Protein Sequence from annotation often contain multiple gene version for the same locus. For various application only one single gene model is needed. MultiFastaDemultiplexer subsets a input fasta and keeps only the longest annotated sequence.


### Usage

Download
```
git clone https://github.com/mwylerCH/MultiFastaDemultiplexer
chmod +x MultiFastaDemultiplexer/MultiFastaReduceR
echo 'export PATH="$HOME/MultiFastaDemultiplexer:$PATH"' >> ~/.bashrc
```

Subset fasta
```
MultiFastaReduceR [MOLECULE] [OverAnnotatedFASTA.fa]
```
Molecule is a string: "DNA" for nucleotide sequence or "AA" for proteins.
OverAnnotatedFASTA.fa is the original multi fasta file. The file can be compressed (gzip) or not. Fasta header can contain gene description or other information, but the different gene model versions need to be named as follow: "NC_000019.1", "NC_000019.2", "NC_000019.3",...
