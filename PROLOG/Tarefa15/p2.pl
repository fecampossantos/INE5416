%definiçoes unicas
disciplina(lidera).
disciplina(cco).
disciplina(psico).
disciplina(farmacia).

estudante(felipe).
estudante(karina).
estudante(madu).

professor(prof1).
professor(prof2).
professor(prof3).

%definicoes relacoes

estuda(felipe, cco).
estuda(felipe, lidera).
estuda(karina, psico).
estuda(karina, lidera).
estuda(madu, farmacia).

leciona(prof1, cco).
leciona(prof2, lidera).
leciona(prof2, psico).
leciona(prof3, farmacia).

%relaçoes

ensina(X,Y) :- professor(X), leciona(X,K), estuda(Y,K), estudante(Y).
colegas(X,Y) :- estuda(X,K),estuda(Y,K), X \== Y.
% se um aluno X atende as aulas de um professor Y
atende(X,Y) :- estuda(X,K), leciona(Y,K).

/*
CONSULTAS

ensina(prof1, cco) -> true
ensina(prof2, farmacia) -> false

colegas(felipe, karina) -> true
colegas(felipe, madu) -> false

atende(felipe, prof1) -> true
atende(felipe, prof3) -> false

*/