def dl(a, b, p):
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

if __name__ == '__main__':
    print(dl(2, 3, 5))
