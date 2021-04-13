# NOT FINISHED
THIS HERE SHOULD THROW AND ERROR!!!

def main():
    control = True
    while(control):
        i = input().split(" ")
        if i[0] != '0':
            n_players = int(i[0])
            cards_to_players = int(i[1])
            total_cards = int(i[2])
            deck = []

            # creating deck
            for a in range(total_cards):
                c = input().split(" ")
                card = {
                    'rank': c[0],
                    'suit': c[1]
                }
                deck.append(card)
            
            # distributing cards
            players = []
            for i in range(n_players):
                player = {
                    'id':i,
                    'hand': deck[i*cards_to_players : ((i+1)*cards_to_players)]
                }
                players.append(player)
            
            play(deck, players)
        else:
            control = False
            break

def play(deck, players):
    last_played = 0
    on_table = deck.pop(0)

    while(len(deck) > 0 and for p in players len(p.get('hand')) > 0):
        playing = players[last_played]
        last_played += 1
        last_played = last_played % len(players)

        card_to_play = play_card(on_table, playing, deck)

def play_card(on_table, player, deck):
    rank = on_table.get('rank')
    suit = on_table.get('suit')

    for p in len(player.get('hand')):
        card = player.get('hand')[p]
        if p.get('rank') == rank:
            card_to_play = player.get('hand').pop(p)
            return card_to_play

    for p in len(player.get('hand')):
        card = player.get('hand')[p]
        if p.get('suit') == suit:
            card_to_play = player.get('hand').pop(p)
            return card_to_play
    
    player.get('hand').append(deck.pop(0))

    return -1
    

main()