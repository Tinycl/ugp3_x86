#!/usr/bin/python
import sys
import os

UGP3_FITNESS_FILE="fitness.out"
print(sys.argv[1])
os.system("rm -rf main.o")
os.system("gcc-7  -g -c main.c")
os.system("rm -rf tprog compile.log fitness.out")
cmdtemp = "gcc-7 -g -o tprog main.o " + sys.argv[1] + " -lm 2>compile.log"
os.system(cmdtemp)
if not os.path.exists(os.getcwd() + "/tprog"):
    os.system("cat compile.log")
    sys.exit()
os.system("./tprog > fitness.out")


