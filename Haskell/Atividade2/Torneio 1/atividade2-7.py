lines = input()
lines = int(lines)

coelhos = 0
ratos = 0
sapos = 0

for a in range(lines):
    numb, an = input().split(' ')
    numb = int(numb)
    if(an=='C'):
        coelhos += numb
    elif(an == 'R'):
        ratos += numb
    elif(an=='S'):
        sapos += numb

total = coelhos+ratos+sapos

print('Total: %d cobaias' % total)
print('Total de coelhos: %d' % coelhos)
print('Total de ratos: %d' % ratos)
print('Total de sapos: %d' % sapos)
print('Percentual de coelhos: %.2f %%' % float(coelhos*100/total))
print('Percentual de ratos: %.2f %%' % float(ratos*100/total))
print('Percentual de sapos: %.2f %%' % float(sapos*100/total))