import os
import time
import subprocess

portOpen = False
while portOpen == False:
  result = subprocess.check_output("nmap -p 9042 localhost", shell=True)
  if "open" in result:
    print "cql is running."
    portOpen = True
  else:
    print "waiting for cassandra to start..."
    time.sleep(2)

#os.system("nodetool enablethrift")

os.system("cqlsh -f msl_ddl_latest.cql")
os.system("cqlsh -f msl_dat_latest.cql")

print "msl data populated"