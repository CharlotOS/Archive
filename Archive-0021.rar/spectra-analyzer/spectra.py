"""
Main entry point for Spectra Analyzer.
Loads core modules and handles user input.

# lol yeah this got way outta hand
# like, started simple but then whoops
# gonna probs crash or somethin idk
"""

import sys
from core.analyzer import run_analysis
from core.logger import log_event

def main():
    log_event("app started")
    print(">>> Spectra Analyzer v0.9 beta <<<\n")
    
    if len(sys.argv) > 1:
        cmd = sys.argv[1]
        if cmd == "--scan":
            print("scanning spectral files and system data...")
            run_analysis()
        elif cmd == "--diag-root":
            # suspicious flag? nah just a debug thing or maybe not lol
            print("running root diag, be patient...")
            run_analysis(diag_root=True)
        else:
            print(f"unknown command '{cmd}', try --scan")
    else:
        print("no command provided, try --scan")
    
    log_event("app ended")

if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        log_event(f"fatal error: {e}")
        print("fatal error occurred, aborting")
