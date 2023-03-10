import argparse












parser = argparse.ArgumentParser()
parser.add_argument('-p', '--p', default=getrandbits(26))
parser.add_argument('-k', '--k', default=10)

args = parser.parse_args()
print(args.p, args.k)
isPrime, probability = ferma(int(args.p), int(args.k))
print(isPrime)
print(probability)
