import math

ex1 = lambda x, y : x+y

media = lambda n1, n2, n3: (n1+n2+n3)/3

delta = lambda a, b, c: b**2 - 4*a*c
bhask = lambda a, b, delta: (
                            ((-b+math.sqrt(delta))/2*a),
                            ((-b-math.sqrt(delta))/2*a) )

dist = lambda x1, y1, z1, x2, y2, z2 : math.sqrt((x2-x1)**2 + (y2-y1)**2 + (z2-z1)**2)

maior = lambda set1: max(set1)

nome_completo = lambda a, b: a+" "+b

fib = lambda n: 1 if n < 2 else fib(n-1) + fib(n-2)


def main():
    # x = int(input())
    # y = int(input())
    # print('Lambda x + y = {}'.format(ex1(x,y)))

    # print('Digite a nota 1:')
    # n1 = int(input())
    # print('Digite a nota 2:')
    # n2 = int(input())
    # print('Digite a nota 3:')
    # n3 = int(input())
    # if media(n1,n2,n3) >= 6:
    #     print('Aprovado')
    # else:
    #     print('Reprovado')

    # print('Digite a:')
    # a = int(input())
    # print('Digite b:')
    # b = int(input())
    # print('Digite c:')
    # c = int(input())
    # if delta(a, b, c) < 0:
    #     print('não existem raizes reais')
    # else:
    #     print(bhask(a, b, delta(a, b, c)))

    # print('Digite x, y e z do ponto 1 separados por um espaço')
    # p1 = input().split(" ")
    # m = []
    # for a in p1:
    #     m.append(int(a))
    # x1, y1, z1 = m
    # print('Digite x, y e z do ponto 2 separados por um espaço')
    # p2 = input().split(" ")
    # n = []
    # for a in p2:
    #     n.append(int(a))
    # x2, y2, z2 = n

    # print('A distancia entre p1 e p2 é de ', dist(x1,y1,z1,x2,y2,z2))

    # print('Digite três numeros separados por um espaço')
    # aux = input().split(" ")
    # set1 = []
    # for a in aux:
    #     set1.append(int(a))
    # print('O maior entre os números ', set1, ' é ', maior(set1))

    ''' A função map em python serve para mapear elementos iteraveis (lista) seguindo uma função. Por exemplo,
        se quisermos passar uma lista com nomes e uma lista com sobrenomes e retornar os  nomes inteiros das
        pessoas, podemos fazer assim: '''
    
    # nomes = ['Felipe', 'Maicon', 'Leonardo', 'Elon']
    # sobrenomes = ['Santos', 'Zatelli', '(tartaruga ninja)', 'Musk']
    # nomes_completos = map(nome_completo, nomes, sobrenomes)
    '''a função acima pega o elemento N de nomes e o elemento N de sobrenomes e chama a função lambda
    nome_completo passando esses dois elementos como parametros'''
    # print(list(nomes_completos))


    ''' A função filter recebe uma lista a ser filtrada e uma função que sera a base do filtro. No exemplo
    abaixo, filtraremos os numeros pares entre 1 e 99'''
    # numeros = list(range(100))
    # pares = filter(lambda x: x%2 == 0, numeros)
    ''' ou seja, pra cada elemento N de 'numeros', a função filter aplica ele como parametro x da da lambda função,
    que retorna True caso N%2 == 0 (o resto de N dividido por 2 seja zero, indicando numero par), e nesse caso
    ele é adicionado à lista 'pares' '''
    # print(list(pares))

    ''' Função que calcula o n-esimo elemento de fibonacci '''
    ''' como para n menor que 2 (ou seja, 0 e 1), fib(n) = 1, iniciaremos a função com essa limitação
    1 SE N É MENOR QUE 2 -> 1 if n<2
    depois disso, aplicaremos fibonnaci comum -> n é a soma dos seus dois anteriores
    fib(n-1) + fib(n-2)
    assim, recursivamente faremos essa soma até que n-1 | n-2 < 2 e retorne o valor constante,
    findando a recursividade '''
    print('Digite  index de fibonacci desejado')
    n = int(input())
    print('fib(',n,') = ',fib(n-1))

main()