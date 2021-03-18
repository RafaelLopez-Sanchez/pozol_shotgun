######### ASSEMBLY AND POZOL ANNOTATION KRAKEN2#################################################################################
# !/usr/bin/bash
# Rafael López-Sánchez
#March 18 2021
# Workflow to make the remove of maize from the fastq samples, the assembly with megahit and the CDS from Prodigal.

#################REMOVING MAIZE############################
1.Create index con bwa.
bwa index -p maize_index -a bwtsw <DIRECTORIO>/*.fa

#2. Align maize sequence sort the bam file and get the stats.

$ bwa index -p index index.fa && bwa mem -t 16 maize_index *_R1.fastq *_R2.fastq |samtools view -Sb - | samtools sort - mapping.sorted && samtools flagstat mapping.sorted.bam > stats.map.txt


3.Use flags 77 and 141 in sorted bam to extract the fastqs.

$ samtools view -f77 $1 | awk '{print "@" $1 "\n" $10 "\n+\n" $11}' > ${1/$2/_R1.fastq}

$ samtools view -f141 $1 | awk '{print "@" $1 "\n" $10 "\n+\n" $11}' > ${1/$2/_R2.fastq}

##################ASSEMBLY#########################################################

1. Symbolic link to fastqs and make folders 
$ ln -s /tres/samples/pozol/shotgun/no_mais_sequences/*fastq .
$ ls *R1.fastq | sed 's/_R1.fastq//' > list.txt
$ ls *R1.fastq.gz | sed 's/_R1.fastq.gz//' > list.txt
$ for cosa in $(cat list.txt); do (mkdir $cosa && mv $cosa*.fastq $cosa);done
$for cosa in $(cat list.txt); do (cd $cosa && mkdir ensamble);done
$for cosa in $(cat list.txt); do (cd $cosa && mv *.fastq ensamble/);done

2. Symbolic link  to megahit script megahit.sh
megahit  -t 32 -1 *R1.fastq -2 *R2.fastq -o megahit_out 

$ for cosa in $(cat list.txt); do (cd $cosa/ensamble && ln -s ~/scripts/megahit.sh . );done
$ for cosa in $(cat list.txt); do (cd $cosa/ensamble && qsub -V megahit.sh);done


#####GENE CALLING##########################
1.Symbolic link to the script ok prodigal.sh and the contig file.
prodigal.sh contains. prodigal -i *.fa -o genes -a proteins.fa -d genes.fa -p meta
$ for cosa in $(cat list.txt); do (cd $cosa && mkdir gene_calling);done
$ for cosa in $(cat list.txt); do (cd $cosa/ && ln -s ~/scripts/prodigal.sh .);done
$ for cosa in $(cat list.txt); do (cd $cosa/ && qsub -V prodigal.sh);done
 