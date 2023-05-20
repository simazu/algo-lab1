import argparse

def ph(p,g,b):
	F=IntegerModRing(p)
	g=F(g)
	b=F(b)
	G=[]
	B=[]
	X=[]
	c=[]
	N=factor(p-1)
	for i in range(0,len(N)):
		G.append(g^((p-1)/(N[i][0]^N[i][1])))
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
	
	print("x =", c[0][0])
end

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--p', default=5)
parser.add_argument('-b', '--b', default=3)
parser.add_argument('-g', '--g', default=2)

args = parser.parse_args()
print(f'{args.g}^x = {args.b} mod {args.p}')
x = ph(int(args.p), int(args.g), int(args.b))

