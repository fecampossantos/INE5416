
cont = True

while(cont):
    l, r = input().split(" ")
    l = int(l)
    r = int(r)

    if l==0 and r==0:
        cont = False
        break
    else:
        print(l+r)
