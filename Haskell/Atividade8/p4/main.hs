import Pilha (Pilha (Stack), emptyStack, push, pop, top)
import Fila (Fila(Queue), getList, enqueue, first, dequeue, flipList)


main = do 
    putStrLn (show (push (push emptyStack 1) 2))
    putStrLn (show (top (Stack [1,2,3,4,5])))
    putStrLn (show (pop (Stack [1,2,3,4,5])))

    putStrLn (show (getList (Queue [1,2,3,4,5])))
    putStrLn (show (enqueue (Queue [1,2,3,4,5]) 6))
    putStrLn (show (first (Queue [1,2,3,4,5])))
    putStrLn (show (dequeue (Queue [1,2,3,4,5])))