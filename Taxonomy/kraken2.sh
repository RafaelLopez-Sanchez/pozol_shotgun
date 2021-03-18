#!/bin/bash
#$ -N kraken2
#$ -l h_vmem=10G
#$ -cwd
#$ -pe mpi 20
kraken2  --db /tres/DB/kraken2DB/ --threads 20 --report kraken_out.report --use-names --paired *1.f*q* *2.f*q*


