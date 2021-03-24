class (Integral x) => MeuInt x where
    bigger :: x -> x -> x
    smaller :: x -> x -> x
    par :: x -> Bool -- Retorna se um dado número é par ou não
    impar :: x -> Bool -- Retorna se um dado número é émpar ou não
    primo :: x -> Bool -- Retorna se um dado número é primo ou não
    mdc :: x -> x -> x -- Retorna o máximo divisor comum entre dois números
    (===) :: x -> x -> Bool -- Retorna True se a diferança entre dois números inteiros é igual ou menor que 1 e False se é maior
    primosEntreSi :: x -> x -> Bool -- Retorna se dois números são primos entre si (mdc = 1)
    (***) :: x -> x -> x -- Retorna a soma do quadrado do primeiro mais o quadrado do segundo ( a***b = a*a + b*b )
    
    bigger a b  | a > b = a
                | otherwise = b
    
    smaller a b | a == (bigger a b) = b
                | otherwise = a

    par a   | a `mod` 2 == 0 = True
            | otherwise = False

    impar a | (par a) == True = False
            | otherwise = True


    primo a = if a > 1 then null
            [ x | x <- [2..a-1], a `mod` x == 0]
            else False

    mdc a b | (bigger a b) `mod` (smaller a b) == 0 = smaller a b
            | otherwise = mdc ((bigger a b)`mod`(smaller a b)) (smaller a b)
    
    
    (===) a b   | (bigger a b) - (smaller a b) > 1 = False
                | otherwise = True
                
    
    primosEntreSi a b =  if (mdc a b) == 1 then True
                        else False


    (***) a b = a*a + b*b
    
instance MeuInt Integer
instance MeuInt Int

-- Faça um exemplo ilustrativo utilizando os métodos ceiling e floor da classe RealFrac.

class RealFrac f => MeuFrac f where
arredondaCima :: (Integral b, RealFrac f) => f -> b
arredondaBaixo :: (Integral b, RealFrac f) => f -> b

arredondaCima a = ceiling a
arredondaBaixo a = floor a

instance MeuFrac Double


-- Faça um exemplo ilustrativo utilizando o método abs da classe Num
subAbsolute :: (Num x) => x -> x -> x
subAbsolute a b = abs (a-b)

-- Faça um exemplo ilustrativo utilizando os métodos min e max da classe Ord
getMin :: (Ord a) => a -> a -> a
getMax :: (Ord a) => a -> a -> a

getMin a b = min a b
getMax a b = max a b


data Mes =
      Janeiro
    | Fevereiro
    | Marco
    | Abril
    | Maio
    | Junho
    | Julho
    | Agosto
    | Setembro
    | Outubro
    | Novembro
    | Dezembro
	deriving(Eq, Show)

getMes :: Int -> Mes
getMes num
    | (num == 1) = Janeiro
	| (num == 2) = Fevereiro
	| (num == 3) = Marco
	| (num == 4) = Abril
	| (num == 5) = Maio
	| (num == 6) = Junho
	| (num == 7) = Julho
	| (num == 8) = Agosto
	| (num == 9) = Setembro
	| (num == 10) = Outubro
	| (num == 11) = Novembro
	| (num == 12) = Dezembro


main = do
    --print (bigger (4::Integer) (12::Integer))
    --print (smaller (4::Integer) (12::Integer))
    --print (par (4::Integer))
    --print (par (5::Integer))
    --print (impar (4::Integer))
    --print (impar (5::Integer))
    --print (primo (4::Integer))
    --print (primo (7::Integer))
    --print (mdc (4::Integer) (6::Integer))
    --print (mdc (4::Integer) (28::Integer))
    --print (mdc (6::Integer) (8::Integer))
    --print (mdc (3::Integer) (7::Integer))
    --print (mdc (3::Integer) (9::Integer))
    --print (mdc (4::Integer) (6::Integer))
    --print ((5::Integer) === (4::Integer))
    --print ((3::Integer) === (7::Integer))
    --print ( primosEntreSi (3::Integer) (7::Integer))
    --print ( (3::Integer) *** (7::Integer))
    --print (arredondaCima (4.32::Double))
    --print (arredondaBaixo (4.32::Double))
    --print(subAbsolute 1 3)
    --print(getMin 5 10)
    --print(getMax 5 10)
    --print(getMes 11)
 