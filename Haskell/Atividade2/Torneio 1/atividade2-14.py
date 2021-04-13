#2 xícaras de farinha de trigo, 3 ovos e 5 colheres de sopa de leite

far, ovo, lei = input().split(" ")
far = int(far)
ovo = int(ovo)
lei = int(lei)

cont = True
a = 0

while(cont):
    if far < 2*a or ovo < 3*a or lei < 5*a:
        cont = False
        break
    else:
        a+=1

print(a-1)