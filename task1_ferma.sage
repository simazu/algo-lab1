import argparse
from random import randint

def ferma(p, k):
    i = 0
    while(i<k):
        a = randint(1, p-1)
        print(a)
        if power_mod(a, p-1, p) == 1:
            i +=1
        else:
            return False, -1
    return True, 1 / pow(2, k)

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--p', default=getrandbits(26))
parser.add_argument('-k', '--k', default=10)

args = parser.parse_args()
print(args.p, args.k)
isPrime, probability = ferma(int(args.p), int(args.k))
print(isPrime)
print(probability)
