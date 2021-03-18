######### TAXONOMIC ANNOTATION KRAKEN2#################################################################################
# !/usr/bin/bash
# Rafael López-Sánchez
# Workflow to make the taxonomy annotation with kraken2 against the NCBI nt and Refseq of Bacteria, Arquea and Viruses databases.

1. Make 4 directories with the names 0hrs 9hrs 24hrs 48hrs
$ for cosa in $(cat list.txt);do (mkdir $cosa) ;done

2. Create a symbolic link to the pozol fastqs and make the folders for them. 
$ ln -s //tres/samples/pozol/shotgun/raw_sequences/*fastq .
$ for cosa in $(cat list.txt); do (mv *$cosa*.f*q* $cosa);done

3. Make kraken2 taxonomic annotation from fastqs with the kraken.sh script
kraken2.sh script content;
$ kraken2  --db /tres/DB/kraken2DB/ --threads 20 --report kraken_out.report --use-names --paired *1.f*q* *2.f*q*

4.Use KrakenTools (https://github.com/jenniferlu717/KrakenTools/) to transform the kraken_out.report into a "Metaphlan" type report with the kreport2mpa.py script

$ python3.7 /home/install/KrakenTools/kreport2mpa.py -r kraken_out.report --no-intermediate-ranks -o mpa.report

5. Retrieve all bacteria counts in the four kraken.
$ grep 'k__Bacteria' mpa.report > bacteria.report

6.Use KrakenTools (https://github.com/jenniferlu717/KrakenTools/) combine all the "Metaphlan" type report with the combine_mpa.py script.

$ python3.7 /home/install/KrakenTools/combine_mpa.py -i /0hrs/bacteria.report /9hrs/bacteria.report /24hrs/bacteria.report /48hrs/bacteria.report -o combine.report

7. Get only counts from genus level with no intermediate ranks and put a header.
$ sed '/s__/d;/g__/d;/f__/d;/o__/d;/c__/d' combine.report | grep 'p__' | sed -e '1i\TAXA\th-0\th-9\th-24\th-48' > phylum.report

8. Get only counts from genus level with no intermediate ranks and put a header.
$ sed '/s__/d' combine.report | grep 'g__' |sed -e '1i\TAXA\th-0\th-9\th-24\th-48'  > genus.report

9. Get only counts from species level with no intermediate ranks and put a header.
$ grep 's__' combine.report | sed -e '1i\TAXA\th-0\th-9\th-24\th-48'  > species.report
