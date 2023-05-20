def is_cyclic(self):
    n = self.order()
    if n < 8:
       return True

    if n % 4 == 0:
       return False  # know n > 7, so n=4 case not a problem
    if n % 4 == 2:
        n = n // 2

def get_gen(self):
    try:
        return self.__mult_gen
    except AttributeError:
        if self.is_field():
            a = self(self.field().multiplicative_generator())
            self.__mult_gen = a
            return a
        if self.multiplicative_group_is_cyclic():
            v = self.unit_gens()
            if len(v) != 1:
                raise ArithmeticError
            return v[0]
        print(self,"multiplicative group of this ring is not cyclic")
        
Z101 = [a for a in Integers(101) if gcd(a, 101) == 1]
print(Z101)
Z150 = [a for a in Integers(150) if gcd(a, 150) == 1]
print(Z150)

print('\n')

print(is_cyclic(Integers(101)))
print(is_cyclic(Integers(150)))

print('\n')

print(get_gen(Integers(101)))
print(get_gen(Integers(150)))

print('\n')

print(Integers(101)(15).multiplicative_order())

print('\n')

print(Integers(150).multiplicative_subgroups())
