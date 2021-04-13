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
    def PrintTree(self):
        if self.left:
            self.left.PrintTree()
        print(self.data),
        if self.right:
            self.right.PrintTree()

    # A function to do inorder tree traversal 
def printInorder(root, l): 

    if root: 

        # First recur on left child 
        printInorder(root.left, l) 

        # then print the data of node 
        # print(root.data)
        l.append(root.data)

        # now recur on right child 
        printInorder(root.right, l) 



# A function to do postorder tree traversal 
def printPostorder(root,l ): 

    if root: 

        # First recur on left child 
        printPostorder(root.left, l) 

        # the recur on right child 
        printPostorder(root.right, l) 

        # now print the data of node 
        # print(root.data)
        l.append(root.data)


# A function to do preorder tree traversal 
def printPreorder(root, l): 

    if root: 

        # First print the data of node 
        # print(root.data)
        l.append(root.data)


        # Then recur on left child 
        printPreorder(root.left, l) 

        # Finally recur on right child 
        printPreorder(root.right, l) 


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
        l =[]
        s = 'Pre.:'
        printPreorder(root, l)
        for i in l:
            s+= ' '
            s += str(i)
        print(s)

        l =[]
        s = 'In..:'
        printInorder(root, l)
        for i in l:
            s+= ' '
            s += str(i)
        print(s)

        l =[]
        s = 'Post:'
        printPostorder(root, l)
        for i in l:
            s+= ' '
            s += str(i)
        print(s)
        print()



main()