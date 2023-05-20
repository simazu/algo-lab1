import matplotlib.pyplot as plt
from matplotlib.collections import EventCollection
import time
from random import randint

def bsgs(a, b, p):
    bst = dict()
    m = ceil(sqrt(euler_phi(p)))
    for j in range(m):
        bst[power_mod(a, j, p)] = j
    gs = inverse_mod(power_mod(a, m, p), p)
    y = b
    for i in range(m):
        if bst.get(y) is not None:
           return (i*m+bst[y])%p
        else:
           y = y * gs % p

def ph(a, b ,p):
	F=IntegerModRing(p)
	a=F(a)
	b=F(b)
	G=[]
	B=[]
	X=[]
	c=[]
	N=factor(p-1)
	for i in range(0,len(N)):
		G.append(a^((p-1)/(N[i][0]^N[i][1])))
		B.append(b^((p-1)/(N[i][0]^N[i][1])))
		X.append(log(B[i],G[i]))
		c.append((X[i],(N[i][0]^N[i][1])))
		
	c.reverse()
	
	for i in range(len(c)):
		if len(c) < 2:
			break
		t1=c.pop()
		t2=c.pop()
		r=crt(t1[0],t2[0],t1[1],t2[1])
		m=t1[1]*t2[1]
		c.append((r,m))
	
	return c[0][0]

def bf(a, b, p):
    i = 1
    while power_mod(a, i, p) != b:
        i += 1
    return i

def main():
    x = []
    phl = []
    bsgsl = []
    bfl = []
    p = 5
    while p < 10000:
        K = GF(p)
        K.<a> = GF(p, modulus = 'primitive')
        x.append(a.multiplicative_order())
        b = randint(1, p-1)

        a = int(a)
        p = int(p)
        st = time.time()
        ph(a, b, p)
        et = time.time()
        phl.append(et-st)

        st = time.time()
        bsgs(a, b, p)
        et = time.time()
        bsgsl.append(et-st)

        st = time.time()
        bf(a, b, p)
        et = time.time()
        bfl.append(et-st)

        p = next_prime(p)
    
    fig = plt.figure() 
    ax = fig.add_subplot(1, 1, 1)
    ax.plot(x, phl, color='tab:blue')
    ax.plot(x, bsgsl, color='tab:orange')
    ax.plot(x, bfl, color='tab:red')

    plt.show()
    
if __name__ == '__main__':
    main()
