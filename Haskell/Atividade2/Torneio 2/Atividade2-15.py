def main():
    n = int(input())
    stack = []
    for i in range(n):
        line = input()
        op = line.split(" ")[0]
        if op == 'PUSH':
            stack.append(int(line.split(" ")[1]))
        elif op == 'POP':
            if len(stack) == 0:
                print('EMPTY')
            else:
                p = stack.pop()
        elif op == 'MIN':
            if len(stack) == 0:
                print('EMPTY')
            else:
                copy = stack.copy()
                copy.sort()
                print(copy[0])

main()