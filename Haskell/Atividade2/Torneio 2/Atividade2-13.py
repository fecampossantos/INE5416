def define(cadeia):
    stack = []
    for c in cadeia:
        # print(c)
        if c == '{' or c == '(' or c == '[':
            stack.append(c)
        elif c == '}':
            if len(stack) == 0 or stack[-1] != '{':
                return 'N'
            else:
                stack.pop()
        elif c == ')':
            if len(stack) == 0 or stack[-1] != '(':
                return 'N'
            else:
                stack.pop()
        elif c == ']':
            if len(stack) == 0 or stack[-1] != '[':
                return 'N'
            else:
                stack.pop()
    if len(stack) == 0:
        return 'S'
    else:
        return 'N'

def main():
    n = int(input())

    for i in range(n):
        cadeia = input()
        bem_definida = define(cadeia)
        print(bem_definida)

main()