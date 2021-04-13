class Node:

    def __init__(self, data):

        self.left = None
        self.right = None
        self.data = data

    # Insert method to create nodes
    def insert(self, data):

        if self.data:
            if data < self.data:
                if self.left is None:
                    self.left = Node(data)
                else:
                    self.left.insert(data)
            elif data > self.data:
                if self.right is None:
                    self.right = Node(data)
                else:
                    self.right.insert(data)
        else:
            self.data = data

# Print the tree
def PrintTree(root, toPrint = []):
    if len(toPrint) > 0:
        root = toPrint.pop(0)
        print(' ', end='')
    print(root.data, end='')
    if root.left:
        toPrint.append(root.left)
    if root.right:
        toPrint.append(root.right)
    
    for a in toPrint:
        PrintTree(a, toPrint)
    
    


def main():
    n = int(input())

    for i in range(n):
        print('Case {}:'.format(i+1))
        n_nodes = int(input())
        nodes = []
        for nn in input().split(" "):
            nodes.append(int(nn))

        for a in range(n_nodes):
            if a == 0:
                root = Node(nodes[a])
            else:
                root.insert(nodes[a])

        PrintTree(root)
        print()
        print()

main()