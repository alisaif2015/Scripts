def main():
  import pandas as pd
  for file in ["2_MTHFR_100_BLAST.csv", "2_MTHFR_250_BLAST.csv", "2_MTHFR_500_BLAST.csv", "2_MTHFR_1000_BLAST.csv", "2_MTHFR_5000_BLAST.csv", "2_MTHFR_10000_BLAST.csv", "2_MTHFR_20000_BLAST.csv"]:
    pd.read_csv(file).T.to_csv(file,header=False)
main()