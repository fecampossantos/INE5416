c = True

while(c):
    control = input()
    control = int(control)
    if(control == 0):
        c = False
        break
    elif(control>1000):
        print('Not a valid number')
        c = False
        break
    else:
        x1, y1 = input().split(" ")
        x1, y1 = int(x1), int(y1)

        for i in range(control):
            x2, y2 = input().split(" ")
            x2, y2 = int(x2), int(y2)

            if x2==x1 or y2==y1:
                print('divisa')
            elif x2<x1:
                if y2<y1:
                    print('SO')
                else:
                    print('NO')
            elif y2>y1:
                print('NE')
            else:
                print('SE')
