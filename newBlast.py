def main ():
  import time,sys
  from Bio import Entrez, SeqIO
  from Bio.Blast import NCBIWWW

  
  start = time.time()   
  for numHits in ["100","250","500","1000","5000","10000","20000"]:
    fasta_string = open("1_" + sys.argv[1] +"_Ref_Seq.fasta").read()
    result_handle = NCBIWWW.qblast("blastp", "nr", fasta_string, hitlist_size=int(numHits))
    blast_result = open("2_"+ sys.argv[1] +"_" + numHits + "_BLAST.xml", "w")
    blast_result.write(result_handle.read())
    blast_result.close()
    result_handle.close()
  end = time.time()
  print(str(end-start) + "seconds")
main()
