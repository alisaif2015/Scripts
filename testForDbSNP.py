def main():

    from Bio import Entrez
    import sys

    Entrez.email = 'yourEmail@institution.com'

    handle = Entrez.efetch(db="snp", id="NP_005948.3", rettype = 'chr', retmode = 'text')

    sys.stdout.write(handle.read())
    handle.close()

main()
