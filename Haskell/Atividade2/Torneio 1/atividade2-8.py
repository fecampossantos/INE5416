control = True

while(control):
    h1, m1, h2, m2 = input().split(" ")

    h1 = int(h1)
    m1= int(m1)
    h2= int(h2)
    m2 = int(m2)

    if h1==0 and m1==0 and h2==0 and m2==0:
        control = False
        break
    
    hf = 0
    mf = m2 - m1

    if h1 == h2:
        if m1 >= m2:
            hf = 24 - h1+h2
        else:
            hf = 0
    elif h2-h1 < 0:
        hf = 24 - h1+h2
    else:
        hf = h2-h1
    
    if mf < 0:
        hf -= 1
        mf = 60 + mf

    print(hf*60 + mf)