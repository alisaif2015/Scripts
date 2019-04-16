from Bio import Entrez, SeqIO
Entrez.email = "Email Here"
proteinName = "Protein Name Here"
accessionNum = "Accession Number Here"
download_handle = Entrez.efetch(db="protein", id=accessionNum, rettype="fasta", retmode="text")
data = download_handle.read()
download_handle.close()

# Store data into file:
out_handle = open("1_"+ proteinName +"_Ref_Seq.fasta", "w")
out_handle.write(data)
out_handle.close()
