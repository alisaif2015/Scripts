#!/bin/bash

prot="type protein name between quotes"
email="alisaif2015@gmail.com"
accessionNum="type accession number between quotes"
eid=sra2275 

start=$SECONDS
cd ~/
mkdir outputFiles_${prot}
cp ~/outputFiles/Scripts/biopython-1.73 ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/mafft-linux64 ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/getAlignment.sh ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/GetFASTA.py ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/newBlast.py ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/newTranspose.py ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/transposer.py ~/outputFiles_${prot}
cp ~/outputFiles/Scripts/refSeqGetter.py ~/outputFiles_${prot}


cd ~/outputFiles_${prot}/

python refSeqGetter.py $email $prot $accessionNum
python newBlast.py $prot $eid

xmlFiles="2_${prot}_100_BLAST 2_${prot}_1000_BLAST 2_${prot}_5000_BLAST 2_${prot}_20000_BLAST"

for file in $xmlFiles
do
	xmltable2csv --input "$file.xml" --output "$file.csv" --tag "Hit_accession"
done

python newTranspose.py $prot

python GetFASTA.py $email $accessionNum $prot

fastaFiles="_${prot}_100_ _${prot}_1000_ _${prot}_5000_ _${prot}_20000_"

echo Starting MAFFT, this will also take some time

for file in $fastaFiles
do
	echo Creating 4${file}MAFFT.fasta file
	~/outputFiles_${prot}/mafft-linux64/mafft.bat "2${file}BLAST.fasta" > "4${file}MAFFT.fasta"
	echo Finished creating 4${file}MAFFT.fasta file
done

duration=$(( SECONDS - start))
echo This process took $duration seconds
