import argparse

def readTNT():
    f = open(args.input, mode = 'r');
    lines = f.readlines()
    buf = "";
    
    for line in lines:
        i = -1;
        flag = False;
        splited = line.split();
        if("TNT" in splited):
            flag = True;
            i = splited.index("TNT");
        if(flag and i > -1):
            s = splited[i+1];
            for word in s:
                if word is 'T':
                    buf += 'T';
                elif word is 'N':
                    buf += 'N';
                else:
                    continue;
    f.close();
    
    return buf;

def main():
    print("------------------------------------------------------------------------------");
    print("* Read Input.");
    
    tnts = readTNT();
    
    print("* Read Success.");
    print("------------------------------------------------------------------------------");
    print("* Write Output.");
    
    f = open(args.output, mode = 'w');
    f.write(tnts);
    f.close();
    
    print("* Write Success.");
    print("------------------------------------------------------------------------------");
 
if __name__ == '__main__':
    
    parser = argparse.ArgumentParser(description = "TNT Parser for the output of perf.data");
    parser.add_argument("-i", "--input", dest = "input", help = "input file");
    parser.add_argument("-o", "--output", dest = "output", help = "output file");
    
    args = parser.parse_args();
    
    print("------------------------------------------------------------------------------");
    print("* Option Information.");
    print("\t- Input File : %s." % args.input);
    print("\t- Output File : %s." % args.output);
    
    main();
