#!/bin/bash

prot="GDF9"
email=alisaif2015@gmail.com
accessionNum=NP_005251
eid=sra2275

start=$SECONDS

mv ~/outputFiles/Scripts/biopython-1.73 ~/outputFiles
mv ~/outputFiles/Scripts/mafft-linux64 ~/outputFiles
mv ~/outputFiles/Scripts/getAlignment.sh ~/outputFiles
mv ~/outputFiles/Scripts/GetFASTA.py ~/outputFiles
mv ~/outputFiles/Scripts/newBlast.py ~/outputFiles
mv ~/outputFiles/Scripts/newTranspose.py ~/outputFiles
mv ~/1_${prot}_Ref_Seq.fasta ~/outputFiles

cd ~/outputFiles/

python newBlast.py $prot $eid

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
	~/outputFiles/mafft-linux64/mafft.bat "2${file}BLAST.fasta" > "4${file}MAFFT.fasta"
done

mv ~/outputFiles/biopython-1.73 ~/outputFiles/Scripts
mv ~/outputFiles/mafft-linux64 ~/outputFiles/Scripts
mv ~/outputFiles/getAlignment.sh ~/outputFiles/Scripts
mv ~/outputFiles/GetFASTA.py ~/outputFiles/Scripts
mv ~/outputFiles/newBlast.py ~/outputFiles/Scripts
mv ~/outputFiles/newTranspose.py ~/outputFiles/Scripts
mv ~/outputFiles/Scripts ~/

duration=$(( SECONDS - start))
echo $duration




