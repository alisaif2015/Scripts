#!/bin/bash

#Commenting out script to run 20,000 in mafft
#Commenting out Mafft to try 20000 in muscle

#python GetFASTA.py alisaif2015@gmail.com hope.csv hope2.fasta NP_005948.3

#xmltable2csv --input "my_blast.xml" --output "test.csv" --tag "Hit_accession"

#/home/sra2275/mafft-linux64/mafft.bat output.txt > output2.txt

#/home/sra2275/mafft-linux64/mafft.bat 4_MTHFR_20000_cobalt_in.txt > 20000_output_mafft.txt

#mv 4_MTHFR_20000_cobalt_in.txt 4_MTHFR_20000_cobalt_in.fa

#/home/sra2275/muscle3.8.31_i86linux64 -in 4_MTHFR_20000_cobalt_in.fa -out 4_MTHFR_20000_cobalt_out.fa

############################### OFFICIAL SCRIPT (JUST FOR MTHFR) DOWN HERE ###########################

#python Blast.py

#xmlFiles="2_MTHFR_100_BLAST 2_MTHFR_250_BLAST 2_MTHFR_500_BLAST 2_MTHFR_1000_BLAST 2_MTHFR_5000_BLAST 2_MTHFR_10000_BLAST 2_MTHFR_20000_BLAST"

#for file in $xmlFiles
#do
#	xmltable2csv --input "$file.xml" --output "$file.csv" --tag "Hit_accession"
#done

#python transpose.py

#python GetFASTA.py alisaif2015@utexas.edu NP_005948.3

#fastaFiles="_MTHFR_100_ _MTHFR_250_ _MTHFR_500_ _MTHFR_1000_ _MTHFR_5000_ _MTHFR_10000_ _MTHFR_20000_"

#for file in $fastaFiles
#do
#	/home/sra2275/mafft-linux64/mafft.bat "2${file}BLAST.fasta" > "4${file}MAFFT.fasta"
#done
 

########################### MAKING SCRIPT FOR ALL PROTEIN TYPES (TESTING PHASE, changed original getfasta.py)############################

prot="BRSK1"
email=alisaif2015@gmail.com
accessionNum=NP_115806.1
eid=sra2275

start=$SECONDS

python newBlast.py $prot 

xmlFiles="2_${prot}_100_BLAST 2_${prot}_250_BLAST 2_${prot}_500_BLAST 2_${prot}_1000_BLAST 2_${prot}_5000_BLAST 2_${prot}_10000_BLAST 2_${prot}_20000_BLAST"

for file in $xmlFiles
do
	xmltable2csv --input "$file.xml" --output "$file.csv" --tag "Hit_accession"
done

python newTranspose.py $prot

python GetFASTA.py $email $accessionNum $prot

fastaFiles="_${prot}_100_ _${prot}_250_ _${prot}_500_ _${prot}_1000_ _${prot}_5000_ _${prot}_10000_ _${prot}_20000_"

for file in $fastaFiles
do
	/home/${eid}/mafft-linux64/mafft.bat "2${file}BLAST.fasta" > "4${file}MAFFT.fasta"
done

duration=$(( SECONDS - start))
echo $duration




