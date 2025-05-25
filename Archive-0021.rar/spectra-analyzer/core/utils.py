"""
this shit is so ass

# been patching this since forever
# sometimes it spits garbage, sometimes it works
"""

import os
import random
import string

def list_spectral_files():
    # scanning for .spec files in data folder
    folder = "data"
    try:
        files = [f for f in os.listdir(folder) if f.endswith(".spec")]
        if not files:
            # lol nothing there? create dummy
            with open(os.path.join(folder, "default.spec"), "w") as f:
                f.write("spectral data 123\n")
            return ["default.spec"]
        return files
    except Exception:
        return []

def random_string(length=12):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def corrupt_data(data):
    # dumb broken stuff
    res = []
    for c in data:
        if random.random() < 0.15:
            res.append(chr(random.randint(33,126)))
        else:
            res.append(c)
    return ''.join(res)
