#!/usr/bin/python
import sys
import os
import time
import subprocess
import re



time.sleep(1)
UGP3_FITNESS_FILE="fitness.out"
print(sys.argv[1])
os.system("rm -rf main.o")
os.system("gcc-7 -c main.c")
os.system("rm -rf tprog compile.log fitness.out")

fitfile = open("fitness.out",'w')
asmfile = open(sys.argv[1],'r')
asmlen = len(asmfile.readlines())
asmfile.close()
cmdtemp = "gcc-7 -o tprog main.o " + sys.argv[1] + " -lm 2>compile.log"
os.system(cmdtemp)
if not os.path.exists(os.getcwd() + "/tprog"):
    os.system("cat compile.log")
    sys.exit()

start_time = time.time()
subtprog = subprocess.Popen("./tprog", stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
subtprog.wait()
end_time = time.time()
tproglogs = subtprog.stdout.readlines()
for log in tproglogs:
    if log:
        pattern = re.compile(r"hung")
        result = pattern.findall(log.decode("utf-8"))
        if result:
            fitvalue = "0 0 0"
            fitfile.write(fitvalue)
            os.system("rm -rf " + sys.argv[1])
        else:
            fitvalue = str(end_time-start_time) + " " + str(asmlen) + " " + str((end_time-start_time)/asmlen)
            fitfile.write(fitvalue)
subtprog.stdout.close()
fitfile.close()



