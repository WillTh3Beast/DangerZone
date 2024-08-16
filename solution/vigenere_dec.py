import sys

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

alphabet = list(ALPHABET)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print(f"{sys.argv[0]} <key> <infile> <outfile>")
        exit(1)
    

    key = list(sys.argv[1])
    for i in range(len(key)):
        key[i] = key[i].upper()

    infile = sys.argv[2]
    outfile = sys.argv[3]

    f = open(infile, "r")
    data = f.read()
    f.close()

    dec_data = ""

    i = 0 
    for c in data:
        if (c.isalpha()):
            k = alphabet.index(key[i])
            e = alphabet.index(c.upper())
            dec_data = dec_data + alphabet[(e - k) % 26]
            i = (i+1)%len(key)
        else:
            dec_data = dec_data + c
    f = open(outfile, "w")
    f.write(dec_data)
    f.close()

    print("DONE!")




