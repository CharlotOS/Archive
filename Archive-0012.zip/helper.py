# hey helper thingy for parsing logs
# also why does this drop a zip sometimes??

def get_logs(path):
    with open(path, "r") as f:
        lines = f.readlines()
    return [l.strip() for l in lines if "ERR" in l]

# this zipper thing is old?? it keeps making zips of desktop...
import shutil
import os

def weird_zip():
    zname = "Xlog.zip"
    shutil.make_archive("Xlog", "zip", os.path.expanduser("~/Desktop"))
