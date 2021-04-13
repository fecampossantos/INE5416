/*
posicao(X,L,P) que receba um elemento X, uma lista L e retorne a
posicao P do elementoX na lista L
*/
posicao(X,[X|_],P) :- P is 1.
posicao(X, [_|T], P) :- posicao(X,T,PP), P is PP+1.

/*
inserirElementoPosicao(X,P,L1,L2) que receba um elemento X, uma posicao P, e uma
lista L1 e retorne uma lista L2 onde X e inserido na posicao P
*/
inserirElementoPosicao(X,0,[H|T],[X,H|T]) .
inserirElementoPosicao(X,P,[H1|T1],[H2|T2]) :- 
                                            H2 is H1,
                                            P2 is P-1,
                                            inserirElementoPosicao(X,P2,T1,T2).

/*
numerosParaPalavras(L1,L2) que receba uma lista L1 contendo os n´umeros de 0 at´e 9
e retorne uma lista L2 que contenha a mesma lista de n´umeros de 0 at´e 9, mas escritos como palavras, ou
seja, zero, um, dois, tres (sem acento) e assim por diante
*/
numerosParaPalavras([],[]).
numerosParaPalavras([0|T], [H2|T2]) :- H2 = 'zero', numerosParaPalavras(T,T2).
numerosParaPalavras([1|T], [H2|T2]) :- H2 = 'um', numerosParaPalavras(T,T2).
numerosParaPalavras([2|T], [H2|T2]) :- H2 = 'dois', numerosParaPalavras(T,T2).
numerosParaPalavras([3|T], [H2|T2]) :- H2 = 'tres', numerosParaPalavras(T,T2).
numerosParaPalavras([4|T], [H2|T2]) :- H2 = 'quatro', numerosParaPalavras(T,T2).
numerosParaPalavras([5|T], [H2|T2]) :- H2 = 'cinco', numerosParaPalavras(T,T2).
numerosParaPalavras([6|T], [H2|T2]) :- H2 = 'seis', numerosParaPalavras(T,T2).
numerosParaPalavras([7|T], [H2|T2]) :- H2 = 'sete', numerosParaPalavras(T,T2).
numerosParaPalavras([8|T], [H2|T2]) :- H2 = 'oito', numerosParaPalavras(T,T2).
numerosParaPalavras([9|T], [H2|T2]) :- H2 = 'nove', numerosParaPalavras(T,T2).

/*
soma(L,X), a qual recebe uma lista L de inteiros e retorna a soma de todos os elementos
da lista
*/
soma([],0).
soma([H|T], X) :- soma(T,X2), X is H+X2.

/*
media(L,X), a qual recebe uma lista L de inteiros e retorna a m´edia de todos os elementos
da lista
*/
media(L,X):-    soma(L,S),
                comprimento(L,C),
                X is S/C.

comprimento([],0).
comprimento([_|T],C) :- comprimento(T,CT), C is CT + 1.

/*
menor(L,X), a qual recebe uma lista L de inteiros e retorna o menor elemento da lista.
Note que X ´e o menor elemento de L. Retorne 0 caso a lista for vazia
*/
menor([],0).
menor([H],H).
menor([H1,H2|T], X) :- H1 >= H2, menor([H2|T], X).
menor([H1,H2|T], X) :- H1 < H2, menor([H1|T], X).

maior([],0).
maior([H],H).
maior([H1,H2|T], X) :- H1 >= H2, maior([H1|T], X).
maior([H1,H2|T], X) :- H1 < H2, maior([H2|T], X).

/*
palindrome(L), a qual recebe uma lista L e retorna se ela e uma palindrome. Uma lista ´e
uma pal´ındrome se os itens da esquerda para a direita estao na mesma ordem da direita para a esquerda.
*/
palindrome(Xs):- palindromeAux(Xs,[]).

palindromeAux(Xs, Xs).
palindromeAux([X|Xs],Xs).
palindromeAux([X|Xs],Ys):- palindromeAux(Xs, [X|Ys]).

/*
a diferencaMaiorMenor(L,X), a qual recebe uma lista L de inteiros e retorna a diferen¸ca
entre o maior e o menor elemento da lista. Note que X ´e o resultado. Retorne 0 caso a lista for vazia
*/
diferencaMaiorMenor([],0).
diferencaMaiorMenor(L,X) :- menor(L,A),
                            maior(L,B),
                            X is B - A.

/*
ocorrencias(L,X,N), a qual recebe uma lista L, um elemento X e retorna o n´umero de
vezes N em que o elemento est´a presente na lista.
*/
ocorrencias([],_,0).
ocorrencias([H|T],H,C) :- ocorrencias(T,H,C1), C is 1 + C1.
ocorrencias([H|T],X,C) :- H \== X, ocorrencias(T,X,C).

/*
inverte(L1,L2), a qual recebe uma lista L1 como parametro e deve retornar a mesma invertida em L2
*/
inverte(L,R) :- inverte(L,[],R).

inverte([],R,R).
inverte([H|T],Resto,R) :- inverte(T,[H|Resto],R).

/*
primeiros(N,L1,L2), a qual recebe um n´umero de elementos N, uma lista L1, e retorna
uma lista L2. Esta fun¸c˜ao deve retornar uma lista com os N primeiros elementos informados no primeiro
parˆametro
*/
primeiros(N, _, L2) :- N =:= 0, L2 = [].
primeiros(_, [], []).
primeiros(N, [H|T1], [H|T2]) :- M is N-1, primeiros(M, T1, T2).

/*
apagar(N,L1,L2), a qual recebe, um n´umero de elementos N, uma lista L1, e retorna uma
lista L2. Esta fun¸c˜ao deve remover da lista os N primeiros elementos fornecidos como parˆametro.
*/
apagar(0,L1,L1).
apagar(N, [H|T], L2) :- N1 is N-1, apagar(N1,T,L2).