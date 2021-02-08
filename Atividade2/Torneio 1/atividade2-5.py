cn = input()
cn = int(cn)

for a in range(cn):
    word = list(input())
    
    for i in range(len(word)):
        if word[i].isupper() or word[i].islower():
            word[i] = chr(ord(word[i])+3)

    word.reverse()

    if len(word)%2 == 0:
        start = int(len(word)/2)
        for i in range(start, len(word)):
            word[i] = chr(ord(word[i])-1)
    else:
        start = int((len(word)-1)/2)
        for i in range(start, len(word)):
            word[i] = chr(ord(word[i])-1)
    
    palavra = ''
    for i in range(len(word)):
        palavra += word[i]
    
    print(palavra)

