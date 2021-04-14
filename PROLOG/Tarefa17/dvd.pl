% Relacao de filmes
%    filme(id, titulo, ano, diretor, nacionalidade).
%
filme(f1, 'Monty Python: O Sentido da Vida', 1983, 'Terry Jones', uk).
filme(f2, 'Edukators', 2004, 'Hans Weingartner', de).
filme(f3, 'Lavoura Arcaica', 2001, 'Luiz Fernando Carvalho', br).
filme(f4, 'Lisbela e o Prisioneira', 2003, 'Guel Arraes', br).
filme(f5, 'Abril despedacado', 2001, 'Walter Salles', br).
filme(f6, 'Diarios de motocicleta', 2004, 'Walter Salles', br).

% Relacao de paises
%     pais(sigla, nome).
%
pais(uk, 'Unided Kingdom').
pais(de, 'Alemanha').
pais(br, 'Brasil').

% Relacao de DVD (a caixa em si)
%     dvd(id do DVD, id do filme, estante).
%
dvd(d1, f1, est1).
dvd(d2, f2, est1).
dvd(d4, f4, est1).
dvd(d3, f3, est2).
dvd(d5, f5, est3).
dvd(d6, f1, est1).
dvd(d7, f2, est4).
dvd(d8, f2, est4).

% Relacao de clientes
%     cliente(cod, nome, telefone).
%
cliente(c1, 'Bob', '333-3112').
cliente(c2, 'Zeca', '245-1099').
cliente(c3, 'Tom', '323-0685').
cliente(c4, 'Bianca', '333-4391').
cliente(c5, 'Alice', '251-7439').
cliente(c6, 'Maria', '212-3271').

% Relacao de locacoes
%     locacao(cod cliente, nro do DVD, data de entrega)
%
locacao(c1, d1, '2005-11-07').
locacao(c1, d2, '2005-11-07').
locacao(c3, d5, '2005-11-09').
locacao(c2, d3, '2005-11-10').
locacao(c3, d3, '2005-11-11').
locacao(c4, d8, '2005-11-12').
locacao(c5, d7, '2005-11-12').
locacao(c6, d6, '2005-11-12').
locacao(c1, d5, '2005-11-13').
locacao(c1, d6, '2005-11-13').
locacao(c6, d2, '2005-11-14').
locacao(c3, d7, '2005-11-14').
locacao(c3, d8, '2005-11-14').
locacao(c5, d1, '2005-11-15').

/* =======================================================================================================================================
(a) Retornar a lista de todos os titulos de filmes lancados antes de 2001

findall(
    Titulo, 
    (filme(Id,Titulo,Ano,Diretor,Nacionalidade), Ano < 2001),
    Filmes).

Filmes = ['Monty Python: O Sentido da Vida'].
*/

/* =======================================================================================================================================
(b) Retornar a lista de todos os t´ıtulos de filmes lan¸cados entre 2001 (inclusive) e 2004 (inclusive).

findall(
    Titulo, 
    (filme(Id,Titulo,Ano,Diretor,Nacionalidade), Ano >= 2001, Ano =< 2004), 
    Filmes).

Filmes = ['Edukators', 'Lavoura Arcaica', 'Lisbela e o Prisioneira', 
        'Abril despedaÃ§ado', 'DiÃ¡rios de motocicleta'].

*/

/* =======================================================================================================================================
(c) Retornar a lista de todos os t´ıtulos de filmes, de maneira ordenada, produzidos no ’Brasil’.

findall(
    Titulo, 
    (filme(Id,Titulo,Ano,Diretor,Nacionalidade), Nacionalidade == br), 
    Filmes),
    sort(Filmes, FilmesOrdenados).

Filmes = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despedaÃ§ado', 'DiÃ¡rios de motocicleta'],

FilmesOrdenados = ['Abril despedaÃ§ado', 'DiÃ¡rios de motocicleta', 'Lavoura Arcaica', 'Lisbela e o Prisioneira'].
*/

/* =======================================================================================================================================
(d) Retornar a lista de todos os t´ıtulos de filmes, de maneira ordenada, n~ao produzidos no ’Brasil’.

findall(
    Titulo, 
    (filme(Id,Titulo,Ano,Diretor,Nacionalidade), not(Nacionalidade == br)), 
    Filmes), 
    sort(Filmes, FilmesOrdenados).

Filmes = ['Monty Python: O Sentido da Vida', 'Edukators'],

FilmesOrdenados = ['Edukators', 'Monty Python: O Sentido da Vida'].
*/

/* =======================================================================================================================================
(e) Retornar a lista de todos os t´ıtulos e diretores dos filmes produzidos na ’Alemanha’ com ano de
lan¸camento ´e 2004 ou anterior.

findall(
    filme(Titulo,Diretor),
    (filme(Id,Titulo,Ano,Diretor,Nacionalidade),Ano =< 2004, pais(Nacionalidade,Pais), Pais == 'Alemanha'),
    Filmes).

Filmes = [filme('Edukators', 'Hans Weingartner')].
*/

/* =======================================================================================================================================
(f) Retornar a lista de todos os identificadores de DVD’s com filmes n˜ao produzidos no ’Brasil’.

findall(
    Id, 
    (filme(Id, _,_,_,Nacionalidade),pais(Nacionalidade, Pais), not(pais == 'Brasil')),
    Filmes).

Filmes = [f1, f2, f3, f4, f5, f6]
*/

/* =======================================================================================================================================
(g) Retornar a lista de todos os identificadores de DVD’s com filmes produzidos no ’Brasil’ e que est˜ao
na estante 2.

findall(
    Dvdid, 
    (filme(Id,_,_,_,N), pais(N,Nome),Nome=='Brasil',dvd(Dvdid,Id,E), E==est2),
    Filmes).

Filmes = [d3].

*/

/* =======================================================================================================================================
(h) Retornar a lista de todos os diretores de filmes, ordenados, cujos DVD’s est˜ao na estante 1.

setof(Diretor,Id ^ E ^ _A^_B^_C^_D^(filme(Id,_A,_B,Diretor,_C),dvd(_D,Id,E),E==est1),Diretores).

Diretores = ['Guel Arraes', 'Hans Weingartner', 'Terry Jones'].


*/

/* =======================================================================================================================================
(i) Retornar a lista de todos os t´ıtulos de filmes que n˜ao possuem um DVD.

setof(Titulo, _A^_B^_C^_D^_E^(filme(Id,Titulo,_A,_B,_C), not(dvd(_D,Id,_E))),Filmes).

Filmes = ['Diarios de motocicleta'].
*/

/* =======================================================================================================================================
(j) Retornar a lista de todos os nomes de pa´ıses que possuem filmes com DVD’s nas estantes 1 ou 4.

setof(
    Pais,
    Id ^ Nac ^ E ^ _A^_B^_C^_D^(filme(Id,_A,_B,_C,Nac), pais(Nac, Pais), dvd(_D,Id,E), (E == est1;E==est4)),
    Paises)

Paises = ['Alemanha', 'Brasil', 'Unided Kingdom']
*/

/* =======================================================================================================================================
(k) Retornar a lista de todos os nomes de clientes que alugaram filmes no dia 7 de novembro de 2005.

setof(
    Nome,
    _A^_B^_C^_D^_E^_F^ FId^DId^Data^CId^(filme(FId,_A,_B,_C,_D),dvd(DId,FId,_E),locacao(CId,DId,Data),cliente(CId,Nome,_F),Data=='2005-11-07'),
    Nomes).

Nomes = ['Bob']
*/

/* =======================================================================================================================================
(l) Retornar a lista de todas as estantes que possuem filmes que tiveram alguma loca¸c~ao.

setof(
    E,
    _A^_B^_C^_D^_E^_F^ Fid^Did^(filme(Fid,_A,_B,_C,_D), dvd(Did,Fid,E),locacao(_E,Did,_F)),
    Estantes).

EstOrd = [est1, est2, est3, est4]

*/

/* =======================================================================================================================================
(m) Retornar a lista de t´ıtulos de filmes alugados pela cliente ’Maria’.

setof(
    Tit,
    _A^_B^_C^_D^_E^_F^ Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C),dvd(Did,Fid,_D), locacao(Cid,Did,_E),cliente(Cid,Nome,_F), Nome == 'Maria'),
    Titulos).

Titulos = ['Edukators', 'Monty Python: O Sentido da Vida']
*/

/* =======================================================================================================================================
(n) Retornar a quantidade de filmes diferentes alugados pela cliente ’Maria’.

setof(
    Tit,
    _A^_B^_C^_D^_E^_F^ Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C),dvd(Did,Fid,_D), locacao(Cid,Did,_E),cliente(Cid,Nome,_F), Nome == 'Maria'),
    Titulos), length(Titulos, NumeroTitulos).

Titulos = ['Edukators', 'Monty Python: O Sentido da Vida'],
NumeroTitulos = 2

*/

/* =======================================================================================================================================
(o) Retornar a lista de t´ıtulos de filmes agrupados por estante, ou seja, para cada estante mostrar os
filmes nela.

bagof(Titulo, Fid ^ _A^_B^_C^_D^ (filme(Fid, Titulo,_A,_B,_C), dvd(_D,Fid,E)), Filmes).

E = est1,
Filmes = ['Monty Python: O Sentido da Vida', 'Monty Python: O Sentido da Vida', 'Edukators', 'Lisbela e o Prisioneira'] ;
E = est2,
Filmes = ['Lavoura Arcaica'] ;
E = est3,
Filmes = ['Abril despedacado'] ;
E = est4,
Filmes = ['Edukators', 'Edukators'].

*/

/* =======================================================================================================================================
(p) Retornar a lista de nomes de pa´ıses que o cliente ’Bob’ alugou filmes no dia 7 de novembro de 2005.

setof(
    Nome, 
    (filme(Fid,_A,_B,_C,N),pais(N,Nome),dvd(Did,Fid,_D),locacao(Cid,Did,Data), cliente(Cid,Nomecliente,_E), Data == '2005-11-07', Nomecliente = 'Bob'), 
    Paises).

Paises = ['Unided Kingdom', 'Alemanha'].
*/

/* =======================================================================================================================================
(q) Retornar a quantidade de filmes produzidos no Brasil alugados por ’Bob’.

setof(
    Titulo, 
    _A^_B^_C^_D^_E^Fid^N^Nome^Did^Cid^Data^Nomecliente^(filme(Fid,Titulo,_,_,N),pais(N,Nome),dvd(Did,Fid,_),locacao(Cid,Did,Data), cliente(Cid,Nomecliente,_), Nomecliente = 'Bob', Nome = 'Brasil'), 
    Filmes), 
    length(Filmes, FilmesBrasileiros).

Filmes = ['Abril despedacado'],
FilmesBrasileiros = 1.
*/

/* =======================================================================================================================================
(r) Retornar a lista de t´ıtulos dos filmes (sem repeti¸c˜oes) agrupados por cliente, ou seja, para cada cliente
mostrar os filmes alugados por ele.

bagof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D),locacao(Cid,Did,_E),cliente(Cid,Nome,_F)),
    Filmes
)

Nome = 'Alice',
Filmes = ['Monty Python: O Sentido da Vida', 'Edukators'] ;
Nome = 'Bianca',
Filmes = ['Edukators'] ;
Nome = 'Bob',
Filmes = ['Monty Python: O Sentido da Vida', 'Monty Python: O Sentido da Vida', 'Edukators', 'Abril despedacado'] ;
Nome = 'Maria',
Filmes = ['Monty Python: O Sentido da Vida', 'Edukators'] ;
Nome = 'Tom',
Filmes = ['Edukators', 'Edukators', 'Lavoura Arcaica', 'Abril despedacado'] ;
Nome = 'Zeca',
Filmes = ['Lavoura Arcaica'].

*/

/* =======================================================================================================================================
(s) Retornar a lista de t´ıtulos dos filmes alugados por ambos ’Zeca’ e ’Tom’, ou seja, apenas os filmes
em comum alugados por ambos.

% criar dois conjuntos (um com os de Tom e outro com os de Zeca) e pegar a inteseção deles

setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Zeca'),
    TitulosZeca
),
setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Tom'),
    TitulosTom
),
intersection(TitulosZeca, TitulosTom, TitulosAmbos).

TitulosZeca = TitulosAmbos, 
TitulosAmbos = ['Lavoura Arcaica'],
TitulosTom = ['Abril despedacado', 'Edukators', 'Lavoura Arcaica'].

** a resposta é o set TituloAmbos

*/

/* =======================================================================================================================================
(t) Retornar a lista de t´ıtulos dos filmes alugados por ’Bob’, mas n˜ao alugados por ’Maria’.
setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Bob'),
    TitulosBob
),
setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Maria'),
    TitulosMaria
),
intersection(TitulosBob, TitulosMaria, TitulosAmbos),
subtract(TitulosBob, TitulosMaria, Resultado).

TitulosBob = ['Abril despedacado', 'Edukators', 'Monty Python: O Sentido da Vida'],
TitulosMaria = TitulosAmbos,
TitulosAmbos = ['Edukators', 'Monty Python: O Sentido da Vida'],
Resultado = ['Abril despedacado'].

*/

/* =======================================================================================================================================
(u) Retornar a lista de t´ıtulos dos filmes nunca alugados nem por ’Bob’ e nem por ’Maria’

setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Bob'),
    TitulosBob
),
setof(
    Tit,
    _A^_B^_C^_D^_E^_F^Fid^Did^Cid^Nome^(filme(Fid,Tit,_A,_B,_C), dvd(Did,Fid,_D), locacao(Cid,Did,_E), cliente(Cid, Nome,_F), Nome=='Maria'),
    TitulosMaria
),
findall(
    Nome,
    filme(_,Nome,_,_,_),
    Todos),
subtract(Todos,TitulosBob,TodosSemBob),
subtract(TodosSemBob, TitulosMaria, TitulosSemBobEMaria).

TitulosBob = ['Abril despedacado', 'Edukators', 'Monty Python: O Sentido da Vida'],
TitulosMaria = ['Edukators', 'Monty Python: O Sentido da Vida'],
Todos = ['Monty Python: O Sentido da Vida', 'Edukators', 'Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despedacado', 'Diarios de motocicleta'],
TodosSemBob = TitulosSemBobEMaria, 
TitulosSemBobEMaria = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Diarios de motocicleta'].

** a resposta é o set TitulosSemBobEMaria
*/