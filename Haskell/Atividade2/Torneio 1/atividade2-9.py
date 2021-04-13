## those with values equal or lower to 127 are considered black
# and those with values higher than 127 will be considered white.
cont = True

while(cont):
    n = input()
    n = int(n)

    if n == 0:
        cont = False
        break
    else:
        for x in range(n):
            a, b, c, d, e = input().split(" ")
            a = int(a)
            b = int(b)
            c = int(c)
            d = int(d)
            e = int(e)

            resp = [a,b,c,d,e]

            # print(resp)

            abaixo = 0
            marcado = 0
            for i in range(5):
                if resp[i] <= 127:
                    abaixo += 1
                    marcado = i
                    # print('maracdo', resp[i])
                    # print('i = ', i)
            
            if abaixo != 1:
                print("*")
            else:
                if marcado == 0:
                    print("A")
                elif marcado == 1:
                    print("B")
                elif marcado == 2:
                    print("C")
                elif marcado == 3:
                    print("D")
                else:
                    print("E")


