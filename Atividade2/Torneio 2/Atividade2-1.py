control = True
time = 1
while(control):
    p = input().split(" ")
    if p[0] == '0':
        control = False
        break
    n_marbles = int(p[0])
    n_queues = int(p[1])

    marbles=[]
    print('CASE# {}:'.format(time))
    time+=1
    for i in range(n_marbles):
        marbles.append(int(input()))
    marbles.sort()

    for q in range(n_queues):
        m = int(input())
        try:
            idx = marbles.index(m)
        except ValueError:
            print('{} not found'.format(m))
        else:
            print('{} found at {}'.format(m, idx+1))