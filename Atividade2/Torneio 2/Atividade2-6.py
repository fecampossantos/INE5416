control = True
while(control):
    n = int(input())
    if n  == 0:
        control = False
        break
    line = input().split(" ")
    samples = []

    for a in line:
        samples.append(int(a))
    samples.append(int(line[0]))

    var = 0
    # print(samples)
    for s in range(1, len(samples)-1):
        print('--> {}'.format(s))
        if (samples[s-1] > samples[s] and samples[s] < samples[s+1]) or (samples[s-1] < samples[s] and samples[s] > samples[s+1]):
            var += 1
            # print('{} -> {} -> {}'.format(samples[s-1], samples[s], samples[s+1]))
    
    print(var)
