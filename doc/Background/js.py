import math 
import itertools
import sets

def getDivisors(x):
    max_calc = int(math.sqrt(x)) + 1
    divs = list(itertools.chain.from_iterable([[div,x/div] for div in range(2, max_calc) if x % div == 0]))
    return list(sets.Set([1] + divs))


print getDivisors(201610000000000)
