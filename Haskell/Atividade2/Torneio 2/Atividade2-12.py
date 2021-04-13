def order_paises(paises):
    for i in range(len(paises) - 1, 0, -1):
        for j in range(i):
            if paises[j].get('ouro') > paises[j+1].get('ouro'):
                temp = paises[j]
                paises[j] = paises[j+1]
                paises[j+1] = temp
            elif paises[j].get('ouro') == paises[j+1].get('ouro'):
                if paises[j].get('prata') > paises[j+1].get('prata'):
                    temp = paises[j]
                    paises[j] = paises[j+1]
                    paises[j+1] = temp
                elif paises[j].get('prata') == paises[j+1].get('prata'):
                    if paises[j].get('bronze') > paises[j+1].get('bronze'):
                        temp = paises[j]
                        paises[j] = paises[j+1]
                        paises[j+1] = temp
                    elif paises[j].get('bronze') == paises[j+1].get('bronze'):
                        if paises[j].get('nome') < paises[j+1].get('nome'):
                            temp = paises[j]
                            paises[j] = paises[j+1]
                            paises[j+1] = temp
    # print(paises)
    print_paises(paises)
    

def print_paises(paises):
    for i in range(len(paises)-1, -1, -1):
        pais = paises[i]
        # print(pais)
        print('{} {} {} {}'.format(pais.get('nome'),pais.get('ouro'),pais.get('prata'), pais.get('bronze')))


def main():
    paises = []
    n_paises = int(input())
    for i in range(n_paises):
        line = input().split(" ")
        pais = {
            'nome': line[0],
            'ouro': int(line[1]),
            'prata': int(line[2]),
            'bronze': int(line[3])
        }
        paises.append(pais)

    order_paises(paises)


main()