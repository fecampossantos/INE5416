a = int(input())
for i in range(a):
    ex = input()
    stack = []
    n_diamonds = 0
    for c in ex:
        if c == "<":
            stack.append("<")
        if c == ">" and len(stack) > 0:
            stack.pop()
            n_diamonds += 1
    
    print(n_diamonds)