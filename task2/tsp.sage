import rsa
import argparse
from random import randint
from hashlib import sha1
from datetime import datetime
import rsa

invalid_keys = []

def ts(sc):
    f = open(sc[1], 'r')
    pk = f.read()
    f.close()
    if pk not in invalid_keys:
        print('-> valid, timestamp: ' + str(datetime.now()))
    else:
        print('-> invalid')

def report(sc):
    f = open(sc[1], 'r')
    pk = f.read()
    f.close()
    invalid_keys.append(pk)
    print('->' + sc[1] + ' key invalid')

def verify(sc):
    f = open(sc[1], 'r')
    msg = f.read()
    f.close()
    f = open(sc[2], 'rb')
    sign = f.read()
    f.close()
    f = open(sc[3], 'r')
    keydata = f.read()
    f.close()
    pk = rsa.PublicKey.load_pkcs1(keydata)
    res = rsa.verify(msg.encode(), sign, pk)
    if res == 'SHA-1':
        print('-> verified')
    else:
        print('-> rejected')

def main():
    while True:
        c = input()
        if c == '':
            continue
        sc = c.split()
        match sc[0]:
            case 'ts':
                ts(sc)
            case 'report':
                report(sc)
            case 'verify':
                verify(sc)
            case _:
                pass

parser = argparse.ArgumentParser()

args = parser.parse_args()
main() 


