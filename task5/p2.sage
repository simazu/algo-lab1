p = 985739879
q = 1388749507
n = p * q
x = 2
y = p - 2
print("x^2 ≡ y^2 mod N:", x^2 % N == y^2 % N)
print("x ≢ y mod N:", x % N != y % N)
x = 2
y = q - 2
print("x^2 ≡ y^2 mod N:", x^2 % N == y^2 % N)
print("x ≢ y mod N:", x % N != y % N)
