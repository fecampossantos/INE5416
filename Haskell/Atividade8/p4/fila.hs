module Fila(Fila(Queue), getList, enqueue, first, dequeue, flipList) where

    data Fila f = Queue [f]
        deriving(Eq, Show)
    
    -- add element to the end of the list
    enqueue :: Fila f -> f -> Fila f
    enqueue (Queue q) x = Queue(q++[x])


    -- remove the last element in the list
    dequeue :: Fila f -> Fila f
    dequeue (Queue [x]) = emptyQueue
    dequeue (Queue (x:s)) = Queue( [x] ++ (getList (dequeue (Queue s)))) 

    -- flip list
    flipList :: [t] -> [t]
    flipList [] = []
    flipList (a:b) = flipList b ++[a]

    -- returns the first element of the list
    first :: Fila f -> f
    first (Queue []) = error "Empty"
    first (Queue (x:s)) = x

    -- create empty list
    emptyQueue :: Fila f
    emptyQueue = Queue []

    -- get List from Queue
    getList :: Fila f -> [f]
    getList (Queue q) = q