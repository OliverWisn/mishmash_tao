from itertools import *

for i in zip(range(100), cycle(['a', 'b', 'c'])):
    print(i)