
npedras, nsapos = input().split(" ")

npedras = int(npedras)
nsapos = int(nsapos)

lst = [0] * npedras

for a in range(nsapos):
    pos, dist = input().split(" ")
    pos = int(pos) - 1
    dist = int(dist)

    for i in range(npedras):
        if pos - dist*i >= 0 and pos - dist*i < npedras:
            lst[pos - dist*i] = 1
        
        if pos + dist*i >= 0 and pos + dist*i < npedras:
            lst[pos + dist*i] = 1
        
for i in range(npedras):
    print(lst[i])