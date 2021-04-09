divisivel(N,K) :- mod(N,K) =:= 0.

triangulo(X,Y,Z) :- (menorQueSoma(X,Y,Z),maiorQueSubtracao(X,Y,X)) , (menorQueSoma(Y,X,Z),maiorQueSubtracao(Y,X,Z)) , (menorQueSoma(Z,X,Y),maiorQueSubtracao(Z,X,Y)). 


menorQueSoma(N,I,J) :- N =< I + J.
maiorQueSubtracao(N,I,J) :- N >= I - J.


max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- Y > X.

min(X,Y,X) :- X =< Y.
min(X,Y,Y) :- Y < X.

eqSegundoGrau(A,B,C,Valor1, Valor2) :-  D is 4*A*C,
                                E is (B^2),
                                G is (E-D),
                                F is sqrt(G),
                                H is (B*(-1)),
                                UNDER is (2*A),
                                SOMA is (H+F),
                                SUB is (H-F),
                                Valor1 is (SOMA/UNDER),
                                Valor2 is (SUB/UNDER).

potencia(X,Y,Resultado) :- Resultado is (X^Y).

absoluto(N,X) :- N < 0, X is (N* (-1)).
absoluto(N,X) :- N >= 0, X is N.

areaTriangulo(B,A,Area) :- T is (B*A),
                            Area is (T/2).


%xor2(X,Y) :-    A is Y . not(X), ----------------- REFAZER (9)
%                B is X . not(Y),
%                (A;B).


aprovado(A,B,C) :- 6 =< (A+B+C)/3.

fib(0,K) :- K is 1.
fib(1,K) :- K is 1.
fib(N,K) :- N1 is N-1,
            N2 is N-2,
            fib(N1, R1),
            fib(N2, R2),
            K is R1+R2.

 distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2), Dist) :-  A is (X2-X1)^2,
                                                        B is (Y2-Y1)^2,
                                                        C is (Z2-Z1)^2,
                                                        D is A+B+C,
                                                        Dist is sqrt(D).

maior(A,B,C,X) :-   D is max(A,B),
                    X is max(D,C).

operacao(Op,X,Y,Resultado) :-   + == Op,
                                Resultado is X+Y;
                                - == Op,
                                Resultado is X-Y;
                                * == Op,
                                Resultado is X*Y;
                                '/' == Op,
                                Resultado is X/Y.

mdc(X,Y,Resultado) :-   0 == Y, Resultado is X;
                        A is mod(X,Y),
                        mdc(Y, A, Resultado).

mdc(X,Y,Z,Resultado) :- mdc(X,Y,R), mdc(Z,R,Resultado).

mmc(X,Y,Resultado) :-   mdc(X,Y,R), 
                        A is X*Y,
                        Resultado is A/R.

% coprimos(X,Y) :- mdc(X,Y,R), 1 == R. -- dando divisao por zero em mdc (?)

primo(2) :- true,!.
primo(X) :- X < 2,!,false.
primo(X) :- not(divisivel(X, 2)).

/* CONSULTAS

divisivel(4,2). -> true
divisivel(5,2). -> false


*/