def main():
    controle = True
    while(controle):
        try:
            a = input()
        except EOFError:
            controle = False
            break
        else:
            t = decide(a)
            print(t)
        


def decide(a):
    stack = []
    for c in a:
        if c == '(':
            stack.append('(')
        elif c == ')':
            if len(stack) == 0:
                return 'incorrect'

            popped = stack.pop()
            if popped == ')':
                return 'incorrect'
    if len(stack) != 0:
        return 'incorrect'

    return 'correct'


main()