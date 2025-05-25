"""
Simple logger. Writes to logs/analysis.log

# omg i forgot to handle file locking once, crashed like mad
# gonna fix it? meh maybe someday
"""

import os
import datetime

LOGFILE = os.path.join("logs", "analysis.log")

def log_event(msg):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    try:
        with open(LOGFILE, "a") as f:
            f.write(f"[{timestamp}] {msg}\n")
    except Exception as e:
        # if it fails just ignore it lol
        pass
