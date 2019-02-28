def main():
  import pandas as pd
  import sys
  for file in ["2_" + sys.argv[1] + "_100_BLAST.csv", "2_" + sys.argv[1] + "_250_BLAST.csv", "2_" + sys.argv[1] + "_500_BLAST.csv", "2_" + sys.argv[1] + "_1000_BLAST.csv", "2_" + sys.argv[1] + "_5000_BLAST.csv", "2_" + sys.argv[1] + "_10000_BLAST.csv", "2_" + sys.argv[1] + "_20000_BLAST.csv"]:
    pd.read_csv(file).T.to_csv(file,header=False)
main()