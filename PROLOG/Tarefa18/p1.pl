/*
    Estrutura ponto
    p(id,x,y)
*/

p(0,0,0).
p(1,0,10).
p(2,10,0).
p(3,0,3).
p(4,4,0).


distancia(nil, nil, 0).
distancia(p(X1,Y1),p(X2,Y2),R) :- R is sqrt((X2 - X1)**2 + (Y2 - Y1)**2).

%colineares(p(X1,Y1),p(X2,Y2),p(X3,Y3)) :- determinante(X1,Y1,X2,Y2,X3,Y3,R), 0 == R.

%determinante(X1,Y1,X2,Y2,X3,Y3,R) :-  R is (((X1*Y2)+(X2*Y3)+(Y1*X3)) - ((X3*Y2) + (X2*Y1) + (X1*Y3))).

iszero(X,Y) :- 0 is (X-Y).

colineares(p(X1,Y1),p(X2,Y2),p(X3,Y3)) :- 0 is (((X1*Y2)+(X2*Y3)+(Y1*X3)) - ((X3*Y2) + (X2*Y1) + (X1*Y3))).


formaTriangulo(p(X1,Y1),p(X2,Y2),p(X3,Y3)) :- 
        distancia(p(X1,Y1),p(X2,Y2),D1), distancia(p(X2,Y2),p(X3,Y3),D2), distancia(p(X3,Y3),p(X1,Y1),D3), 
        check(D1,D2,D3), check(D1,D3,D2), check(D2,D3,D1).


check(D1,D2,D3) :- subAbs(D1,D2,T1), D3 > T1, D3 < D1+D2.

subAbs(X,Y,R) :- T is X-Y, abs(T,R).

/*
A: Crie uma regra distancia, a qual recebe dois pontos como parˆametro de deve retornar a distˆancia
entre eles.

p(0,X1,Y1),p(1,X2,Y2),distancia(p(X1,Y1),p(X2,Y2),R).
X1 = Y1, Y1 = X2, X2 = 0,
Y2 = 10,
R = 10.0.
========================================================================================================================
B: Crie uma regra colineares, a qual recebe trˆes pontos como parˆametro e ´e verdade se eles s˜ao colineares.
DICA: os trˆes pontos ser˜ao colineares se o determinante de suas coordenadas for igual a 0.

p(0,X1,Y1),p(1,X2,Y2),p(3,X3,Y3),colineares(p(X1,Y1),p(X2,Y2),p(X3,Y3)).

X1 = Y1, Y1 = X2, X2 = X3, X3 = 0,
Y2 = 10,
Y3 = 3.

p(0,X1,Y1),p(1,X2,Y2),p(3,X3,Y3),colineares(p(X1,Y1),p(X2,Y2),p(X3,Y3)).
false

========================================================================================================================
C: Crie uma regra formaTriangulo, a qual recebe trˆes pontos como parˆametro e ´e verdade se eles podem
ser usados para formar um triˆangulo.

p(0,X1,Y1),p(3,X2,Y2),p(4,X3,Y3),formaTriangulo(p(X1,Y1),p(X2,Y2),p(X3,Y3)).

X1 = Y1, Y1 = X2, X2 = Y3, Y3 = 0,
Y2 = 3,
X3 = 4.

p(0,X1,Y1),p(1,X2,Y2),p(3,X3,Y3),formaTriangulo(p(X1,Y1),p(X2,Y2),p(X3,Y3)).
false

*/