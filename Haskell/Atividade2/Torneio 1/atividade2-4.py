

def main():
    N = int(input())
    print(N)
    if (N > 0 and N < 1000000):
        calculate(N)
    else:
        print('not a valid input! N must be between 0 and 1000000!!')

def calculate(v):
    n100 = (v//100)
    v = v%100
    n50 = (v//50)
    v = v%50
    n20 = (v//20)
    v = v%20
    n10 = (v//10)
    v = v%10
    n5 = (v//5)
    v = v%5
    n2 = (v//2)
    v = v%2
    n1 = (v)
    
    print("%d nota(s) de R$ 100,00" % n100)
    print("%d nota(s) de R$ 50,00" % n50)
    print("%d nota(s) de R$ 20,00" % n20)
    print("%d nota(s) de R$ 10,00" % n10)
    print("%d nota(s) de R$ 5,00" % n5)
    print("%d nota(s) de R$ 2,00" % n2)
    print("%d nota(s) de R$ 1,00" % n1)


main()