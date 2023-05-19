import argparse
from random import randint
from hashlib import sha1

def auth(pk, i, r, filename):
    pks = [int(line) for line in open(filename, 'r').readlines()]
    pks[i] = pk
    h = hash(pks)
    print(f'computed root is {h}')
    print(f'pks is {pks}')
    return r == h 
        
def hash(half):
    if len(half) == 1:
        return sha1(str(half[0]).encode()).hexdigest()
    
    mid = int(len(half)/2.0 + 0.5)
    concat = hash(half[0:mid]) + hash(half[mid:len(half)])
    return sha1(concat.encode()).hexdigest()

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--p', default=getrandbits(26))
parser.add_argument('-i', '--i', default=1)
parser.add_argument('-r', '--r', default='d5b71a18938d8f22373c727883e63dca7ec1ded7')
parser.add_argument('-f', '--f', default='task2_kd_p_file')

args = parser.parse_args()
print(f'checking {args.p} \nuser {args.i}\nsaved root is {args.r} \npublic file is {args.f}\n\n')
isAuth = auth(int(args.p), int(args.i), args.r, args.f)
print(isAuth)

