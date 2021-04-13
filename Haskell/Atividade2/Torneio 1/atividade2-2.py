#include <stdio.h>


# int: X -> distance in kilometers
# float: Y -> total fuel spent
X = int(input())
Y = float(input())

value = X/Y

print("%.3f km/l" % value)