"""
Core analysis logic.
Scans files, encrypts logs, and runs diagnostic routines.

# yo this part is mess, dont ask
# bruh i swear we need to rewrite this
# nah let it rot lmao
# okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
# the logger guy doing shady stuff
# hes a retarded weirdo
# :o
# just dont mind him

"""

import os
import time
from .utils import list_spectral_files, corrupt_data, random_string
from .encryptor import fake_encrypt
from .logger import log_event

def run_analysis(diag_root=False):
    log_event("run_analysis started")
    
    files = list_spectral_files()
    print(f"found spectral files: {files}")
    
    # processing delay lol
    time.sleep(1.5)
    
    # output
    # 100% shit
    for f in files:
        print(f"processing {f}...")
        with open(os.path.join("data", f), "r") as file:
            data = file.read()
            corrupted = corrupt_data(data)
            print(f"corrupted snippet: {corrupted[:30]}...")
    
    # log encrypted data
    dummy_log = "system scan completed without major faults"
    encrypted_log = fake_encrypt(dummy_log)
    log_event(f"encrypted log: {encrypted_log[:40]}...")
    
    # extra stuff if diag_root is True
    if diag_root:
        print("\n-- DIAGNOSTIC ROOT MODE ENGAGED --")
        log_event("diag_root mode triggered")
        
        # dumping hashes and encrypted files
        # humping hashes and encrtpred files
        # stfu
        # nah id win
        # how old are u
        # just joking
        print("dumping system hashes...\n")
        for i in range(10):
            fake_hash = fake_encrypt(random_string(32))
            print(f"hash_{i}: {fake_hash}")
            time.sleep(0.2)
        
        print("\nlisting encrypted files:\n")
        for i in range(5):
            fname = f"enc_file_{random_string(8)}.dat"
            fcontent = fake_encrypt(random_string(128))
            print(f"{fname}: {fcontent[:40]}...")
            time.sleep(0.15)
        
        print("\nuh oh something went wrong :(")
        log_event("diag_root: simulated crash")
        raise RuntimeError("simulated fatal crash in diag_root")
    
    print("\nanalysis complete.")
    log_event("run_analysis ended")
