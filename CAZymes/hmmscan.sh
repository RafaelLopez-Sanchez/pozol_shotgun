#!/bin/bash
#$ -N hmmscan
#$ -cwd
#$ -pe mpi 16
#$ -l h_vmem=14G

hmmscan --domtblout proteins.out.dm --cpu 16 /tres/DB/CAZyDB/dbCAN-HMMdb-V9.txt proteins.fa > cazy.domains.out
