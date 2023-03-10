import argparse
from random import randint

def div2(t):
    s = 0
    while (t%2 != 1):
        s += 1
        t /= 2
    return s, t 

def fea(basis, power, mod):
    result = 1
    while (power > 0):
        if power % 2 == 1:
            result = (result * result) % mod
        power /= 2
        basis = (basis * basis) % mod
    return result

def ml(p, k):
    R = Integers(p)
    s, t = div2(p-1) 
    for i in range(k):
        a = randint(2, p-2)
        x = power_mod(R(a), int(t), p)
        if x==1 or x==p-1:
            continue
        
        for j in range(s-1):
            x = (x**2) % p
            if x==1:
                return False, -1
            if x==p-1:
                break
        else:
            return False, -1

    return True, 4**(-k)
        
parser = argparse.ArgumentParser()
parser.add_argument('-p', '--p', default=getrandbits(26))
parser.add_argument('-k', '--k', default=10)

args = parser.parse_args()
print(args.p, args.k)
isPrime, probability = ml(int(args.p), int(args.k))
print(isPrime)
print(probability)
