cnt = True
am = 1

while(cnt):
    n = input()
    n = int(n)

    if n == 0:
        cnt = False
        break
    
    n50 = 0
    n10 = 0
    n5 = 0
    n1 = 0

    n50 = n//50
    n = n%50
    n10 = n//10
    n = n%10
    n5 = n//5
    n = n%5
    n1 = n

    print("Teste %d" % am)
    am += 1
    print(n50, n10, n5, n1)
    print()
