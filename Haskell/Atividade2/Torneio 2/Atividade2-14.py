
n_casas = int(input())
casas = []
for i in range(n_casas):
    casas.append(int(input()))

soma = int(input())
for i in range(n_casas):
    for j in range(i, n_casas, 1):
        if i != j:
            if casas[i] + casas[j] == soma:
                print("{} {}".format(casas[i], casas[j]))