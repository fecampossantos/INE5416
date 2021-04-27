/********************************************************************************************************************************

https://rachacuca.com.br/logica/problemas/jantar-romantico/

Felipe de Campos Santos
github: @felipecampossantos

input:
?- romantic_dinner(MenNames, WomenNames, WineNames, DatingTime, PastaNames, CandleColors, Table, Rslt), label(Rslt), maplist(writeln, Table).

expected output:

[4,2,3,5,1]
[5,3,2,4,1]
[2,1,3,5,4]
[2,4,1,3,5]
[1,4,3,2,5]
[4,5,1,3,2]
MenNames = [5-caue, 3-francisco, 2-murilo, 4-ronaldo, 1-tulio],
WomenNames = [2-andressa, 1-bianca, 3-daniela, 5-isabel, 4-lucia],
WineNames = [4-argentine, 5-chilean, 1-french, 3-italian, 2-portuguese],
DatingTime = [2-threeYears, 4-fourYears, 1-fiveYears, 3-sixYears, 5-sevenYears],
PastaNames = [1-canelone, 4-farfalle, 3-fetuccine, 2-spaghetti, 5-ravioli],
CandleColors = [4-white, 2-yellow, 3-blue, 5-green, 1-red],
Table = [[4, 2, 3, 5, 1], [5, 3, 2, 4, 1], [2, 1, 3, 5, 4], [2, 4, 1, 3, 5], [1, 4, 3, 2|...], [4, 5, 1|...]],
Rslt = [4, 2, 3, 5, 1, 5, 3, 2, 4|...]

i.e
_______________________________________________________________________
========|  Candle  |   Man   |  Woman  |  Time  |   Pasta   |  Wine    |
========|----------|---------|---------|--------|-----------|----------|
Tables 1|    Red   |  Tulio  |  Bianca |    5   |  Canelone |  French  |
Tables 2|  Yellow  |  Murilo | Andressa|    3   | Spaghetti |Portuguese|
Tables 3|   Blue   |Francisco| Daniela |    6   | Fettuccine|  Italian |
Tables 4|   White  | Ronaldo |  Lucia  |    4   |  Farfalle | Argentine|
Tables 5|   Green  |  Caue   |  Isabel |    7   |  Ravioli  | Chilean  |
========|==========|=========|=========|========|===========|==========|

--------------------------------------------------------------
http://bennycheung.github.io/solving-puzzles-using-clp
https://www.metalevel.at/prolog/puzzles
https://en.wikipedia.org/wiki/Zebra_Puzzle
https://github.com/triska/clpfd

*********************************************************************************************************************************/
:- use_module(library(clpfd)).

romantic_dinner(MenNames, WomenNames, WineNames, DatingTime, PastaNames, CandleColors, Tables, Rslt) :-
    % The table is made of a candle, a couple that has been dating for X years, the type os pasta they are eating
    % and nationality of the wine they are drinking
    Tables =[Candles, Men, Women, Datings, Pastas, Wines],

    % Options for candles and the names that will be assigned to each variable
    Candles = [White, Yellow, Blue, Green, Red],
    ColorsCandle = [white, yellow, blue, green, red],

    % Men's names and the names that will be assigned to each variable
    Men = [Caue, Francisco, Murilo, Ronaldo, Tulio],
    NamesMen = [caue, francisco, murilo, ronaldo, tulio],

    % Women's names and the names that will be assigned to each variable
    Women = [Andressa, Bianca, Daniela, Isabel, Lucia],
    NamesWomen = [andressa, bianca, daniela, isabel, lucia],

    % Dating times and the names that will be assigned to each variable
    Datings = [ThreeYears, FourYears, FiveYears, SixYears, SevenYears],
    DatingsNumbers = [threeYears, fourYears, fiveYears, sixYears, sevenYears],

    % Pasta options and the names that will be assigned to each variable
    Pastas = [Canelone, Farfalle, Fetuccine, Spaghetti, Ravioli],
    NamesPasta = [canelone, farfalle, fetuccine, spaghetti, ravioli],

    % Wine options and the names that will be assigned to each variable
    Wines = [Argentine, Chilean, French, Italian, Portuguese],
    NamesWine = [argentine, chilean, french, italian, portuguese],
 
    % pairing the variables to the assigned names (for better reading in the output)
    pairs_keys_values(MenNames, Men, NamesMen),
    pairs_keys_values(WomenNames, Women, NamesWomen),
    pairs_keys_values(WineNames, Wines, NamesWine),
    pairs_keys_values(DatingTime, Datings, DatingsNumbers),
    pairs_keys_values(PastaNames, Pastas, NamesPasta),
    pairs_keys_values(CandleColors, Candles, ColorsCandle),

    % this will make sure that the options (people, candles, etc) don't repeat on the set of tables.
    % same as doing 'all_distinct(datings), all_distinct(...)...'
    maplist(all_distinct, Tables),

    % assigns numbers to the variables. This way we can associate each option to the index of the table they will occupy.
    % i.e -> if the table 1 has John eating Ramen, John=1 and Ramen=1.
    append(Tables, Rslt),
    Rslt ins 1..5,

    /**
    Afirmations given on the website
    **/

    % The couple eating Ravioli is on the table with the green candle
    Ravioli #= Green,
    % The table with the blue candle is exaclty on the right of the couple eating spaghetti
    Blue #= Spaghetti + 1,
    % The couple thats been dating for 3 years in somewhere in between the couple drinking French wine (French)
    % and the couple thats been dating for 6 years (on that order)
    (ThreeYears #> French,
    ThreeYears #< SixYears),
    % Andressa is exactly on the left of Daniela
    Andressa #= Daniela - 1,
    % Francisco and his girlfriend are on the table with the blue candle
    Francisco #= Blue,
    % on the second position is the couple that is drinking portuguese wine
    Portuguese #= 2,
    % The couplea eating fettuccine are on the side of the couple with the white candle
    (Fettuccine #= White - 1 ; Fettuccine #= White + 1),
    % Murilo is somewhere in between the couple in the table with the red candle and Francisco, on thar order.
    (Murilo #> Red,
    Murilo #< Francisco),
    % Isabel is on the side of the couple that has been toghether for 4 years
    (Isabel #= FourYears + 1;
    Isabel #= FourYears - 1),
    % The couple eating fettuccine is the on table with the blue candle
    Fetuccine #= Blue,
    % Francisco is on the side of the couple that are driking wine from Argentina (Argentine)
    (Francisco #= Argentine + 1;
    Francisco #= Argentine - 1),
    % Caue and his girlfriend are on the first or the last table
    (Caue #= 1;
    Caue #= 5),
    % The couple eating farfalle is somewhere on the right of the couple with the blue candle
    Farfalle #> Blue,
    % Lucia is on the side of the couple that are eating Ravioli
    (Lucia #= Ravioli + 1;
    Lucia #= Ravioli - 1),
    % the couple that has been dating for 4 year is on the table with the white candle
    FourYears #= White,
    % Tulio is exactly on the left of Murilo
    Tulio #= Murilo - 1,
    % In the first or last table, the couple is eating ravioli
    (Ravioli #= 1;
    Ravioli #= 5),
    % The couple that has been dating for 4 years is somewhere in between the table with the red candle and
    % the couple that has been dating for 7 years, on that order
    FourYears #> Red,
    FourYears #< SevenYears,
    % Daniela and her boyfriend are drinking Italian wine (Italian)
    Daniela #= Italian,
    % The couple drinking wine from Chile (Chilean) is exactly on the right of the table with the white candle
    Chilean #= White + 1,
    % Ronaldo is on the side of the table with the blue candle
    (Ronaldo #= Blue + 1;
    Ronaldo #= Blue - 1).