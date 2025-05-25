"""
encryptor module

# that shit doesnt wokr
# used for logs and files, lol

"""

import base64

def fake_encrypt(data):
    # base64 + reverse string as dummy encryption
    # crap
    encoded = base64.b64encode(data.encode("utf-8")).decode("utf-8")
    return encoded[::-1]

def fake_decrypt(data):
    try:
        rev = data[::-1]
        return base64.b64decode(rev).decode("utf-8")
    except Exception:
        return "<corrupt data>"
