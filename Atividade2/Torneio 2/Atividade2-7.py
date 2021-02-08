controle = True

while(controle):

    a = int(input())
    if a == 0:
        controle = False
        break
    
    deck = list(range(1, a+1))
    discarded = []
    while(len(deck) != 1):
        discarded.append(deck.pop(0))
        deck.append(deck.pop(0))

    # print('Discarded cards: ', *discarded, sep = ", ")
    if len(discarded) == 0:
        print('Discarded cards:')
    else:
        print('Discarded cards:', str(discarded)[1:-1])
    print('Remaining card:', deck[0])
        
