f = GF(2^7, 'a')
[print(i) for i in f.list()]
print('\n\n', f('a^10 + a^90 - a^52'))
print('\n\n', f('a^15').minimal_polynomial())
