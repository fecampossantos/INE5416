{-
NEWTYPE -> instancia tipos que são "desfeitos" quando compilados, não tem construtor (na compilação)
, tornando ele um tipo restrito. Ou seja, se eu tentar instanciar um objeto com "undefined"
ele vai dar erro ja na compilação, diferente de DATA.
Servem basicamente pra agrupar visualmente (no código) um tipo.
Também vale lembrar que newtype só pode ser usado com um construtor em código.

O ex abaixo daria erro:
newtype Ponto = Ponto2D Int Int | Ponto3D Int Int Int
O exemplo dado no código é do tipo

DATA -> instancia tipos com construtores, e são considerados lazy, ou seja, se eu instanciar um
objeto com um atributo undefined, não ocorrerá erro (a não ser que eu tente fazer algo
com esse atributo em específico).

TYPE -> Usado apenas para "renomear" um tipo primitivo.

-}

-- ISSO FUNCIONA
data Forma = Triangulo | Retangulo | Circulo

-- ISSO NAO FUNCIONA (porque tem mais de um construtor)
--newtype Forma = Triangulo | Retangulo | Circulo

data Quantidade_data = Quantidade_data Int
newtype Quantidade_newtype = Quantidade_newtype Int

type Nome = String
