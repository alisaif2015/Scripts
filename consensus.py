def main():
  from Bio.Align import AlignInfo
  from Bio import AlignIO
  alignment = AlignIO.read("4_HA_NorthTemp_mafft.fasta", "fasta")
  summary_align = AlignInfo.SummaryInfo(alignment)
  #consensus = summary_align.dumb_consensus()
  consensus = summary_align.gap_consensus()
  Outfile = open("outputConsensus(north2).fasta","a+")
  Outfile.write(str(consensus))
  Outfile.close()
main()