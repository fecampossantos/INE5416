genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

%adicionado depois
genitor(mari, piero).
genitor(mari, ini).
genitor(tito, piero).
genitor(tito, ini).
genitor(ini, rick).
genitor(pablo, rick).
genitor(ana, luke).
genitor(ana, iry).
genitor(bob, marc).
genitor(luke, tina).


mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).

%adicionado depois
mulher(mari).
mulher(ini).
mulher(iry).
mulher(tina).


homem(tom).
homem(bob). 
homem(jim).
homem(bill).

%adicionado depois
homem(tito).
homem(piero).
homem(pablo).
homem(rick).
homem(luke).
homem(marc).



pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo


%implementacao_do_exercicio
tio(X,Y) :- genitor(K,Y), irmaos(K,X), homem(K). % ARRUMAR AQUI --------------------------------------------------
tia(X,Y) :- genitor(K,Y), irmaos(K,X) , mulher(K).

primo(X,Y) :- (tio(K,X), pai(K,Y); tia(K,X), mae(K,Y)), homem(X). % ARRUMAR AQUI --------------------------------------------------
prima(X,Y) :- (tio(K,X), pai(K,Y); tia(K,X), mae(K,Y)), mulher(X). % ARRUMAR AQUI --------------------------------------------------

primos(X,Y) :- (tio(K,X), pai(K,Y); tia(K,X), mae(K,Y)), X \== Y.

bisavo(X,Y) :- (avo(K,Y); avoh(K,Y)), pai(X,K).
bisavoh(X,Y) :- (avo(K,Y); avoh(K,Y)), mae(X,K).

descendente(X,Y) :- genitor(Y,X). %recursao passo base
descendente(X,Y) :- genitor(Z,X), descendente(Z,Y). %recursao passo recursivo

feliz(X) :- (pai(X,Y);mae(X,Y)), X\==Y.

%consulta nova
primosegundograu(X,Y) :- genitor(K,Y), primo(X,K).


/*
CONSULTAS:
tia(ana, jim) -> true
tio(marc, jim) -> true
primo(jim, luke) -> true
primo(jim, iry) -> true
primos(iry, jim) -> true
feliz(pat) -> true
feliz(jim) -> false
bisavo(tom, luke) -> true
bisavoh(pam, luke) -> true
primosegundograu(jim, tina) -> true
*/