/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Suguru 5x5 CLP(FD) formulation.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- use_module(library(clpfd)).

suguru([
            [AA, AB, AC, AD, AE],
            [BA, BB, BC, BD, BE],
            [CA, CB, CC, CD, CE],
            [DA, DB, DC, DD, DE],
            [EA, EB, EC, ED, EE]
        ]) :-
        
        Table = [
            [AA, AB, AC, AD, AE],
            [BA, BB, BC, BD, BE],
            [CA, CB, CC, CD, CE],
            [DA, DB, DC, DD, DE],
            [EA, EB, EC, ED, EE]
        ],

        Line0 = [AA, AB, AC, AD, AE],
        Line1 = [BA, BB, BC, BD, BE],
        Line2 = [CA, CB, CC, CD, CE],
        Line3 = [DA, DB, DC, DD, DE],
        Line4 = [EA, EB, EC, ED, EE],

        Area0 = [AA,AB,AC,BA],
        Area1 = [AD,AE,BE,CE,DE],
        Area2 = [BB,BC,CA,CB,DA],
        Area3 = [BD,CC,CD,DB,DC],
        Area4 = [DD,EA,EB,EC,ED],
        Area5 = [EE],

        Area0 ins 1..4,
        Area1 ins 1..5,
        Area2 ins 1..5,
        Area3 ins 1..5,
        Area4 ins 1..5,
        %Area5 ins 1..1,
        EE #= 1,

        %the cells around eachother should be different

        createLineGroups(Line0, Line0Groups),
        createLineGroups(Line1, Line1Groups),
        createLineGroups(Line2, Line2Groups),
        createLineGroups(Line3, Line3Groups),
        createLineGroups(Line4, Line4Groups),

        getAllDifferent(Line0Groups),
        getAllDifferent(Line1Groups),
        getAllDifferent(Line2Groups),
        getAllDifferent(Line3Groups),
        getAllDifferent(Line4Groups),

        transpose(Table, TableTransposed),

        
        % ROWS
        all_different([AA,AB]),
        all_different([AB,AC]),
        all_different([AC,AD]),
        all_different([AD,AE]),
        
        all_different([BA,BB]),
        all_different([BB,BC]),
        all_different([BC,BD]),
        all_different([BD,BE]),

        all_different([CA,CB]),
        all_different([CB,CC]),
        all_different([CC,CD]),
        all_different([CD,CE]),
        
        all_different([DA,DB]),
        all_different([DB,DC]),
        all_different([DC,DD]),
        all_different([DD,DE]),

        all_different([EA,EB]),
        all_different([EB,EC]),
        all_different([EC,ED]),
        all_different([ED,EE]),

        %COLUMNS
        all_different([AA,BA]),
        all_different([BA,CA]),
        all_different([CA,DA]),
        all_different([DA,EA]),

        all_different([AB,BB]),
        all_different([BB,CB]),
        all_different([CB,DB]),
        all_different([DB,EB]),

        all_different([AC,BC]),
        all_different([BC,CC]),
        all_different([CC,DC]),
        all_different([DC,EC]),

        all_different([AD,BD]),
        all_different([BD,CD]),
        all_different([CD,DD]),
        all_different([DD,ED]),

        all_different([AE,BE]),
        all_different([BE,CE]),
        all_different([CE,DE]),
        all_different([DE,EE]),

        %DIAGONALS BELOW
        all_different([AA,BB]),
        all_different([AB,BA]),
        all_different([AB,BC]),
        all_different([AC,BB]),
        all_different([AC,BD]),
        all_different([AD,BC]),
        all_different([AD,BE]),
        all_different([AE,BD]),
        all_different([BA,CB]),
        all_different([BB,CA]),
        all_different([BB,CC]),
        all_different([BC,CB]),
        all_different([BC,CD]),
        all_different([BD,CC]),
        all_different([BD,CE]),
        all_different([BE,CD]),
        all_different([CA,DB]),
        all_different([CB,DA]),
        all_different([CB,DC]),
        all_different([CC,DB]),
        all_different([CC,DD]),
        all_different([CD,DC]),
        all_different([CD,DE]),
        all_different([CE,DD]),
        all_different([DA,EB]),
        all_different([DB,EA]),
        all_different([DB,EC]),
        all_different([DC,EB]),
        all_different([DC,ED]),
        all_different([DD,EC]),
        all_different([DD,EE]),
        all_different([DE,ED]),


        
        %the cells in the areas should be different too
        all_different(Area0),
        all_different(Area1),
        all_different(Area2),
        all_different(Area3),
        all_different(Area4),
        all_different(Area5),


        %evaluate the cells
        label(Area0),
        label(Area1),
        label(Area2),
        label(Area3),
        label(Area4),
        label(Area5).

        %label(Table).

problem1(1,T) :- 
    T = [[1,_,_,5,_],
        [_,_,_,_,_],
        [1,_,2,_,4],
        [_,_,_,_,_],
        [_,3,_,_,_]].

/*

?- problem1(1,T), suguru(T), maplist(labeling([ff]), T), maplist(writeln, T).

[1,3,2,5,1]
[4,5,4,3,2]
[1,3,2,1,4]
[2,5,4,5,3]
[4,3,1,2,1]
T = [[1, 3, 2, 5, 1], [4, 5, 4, 3, 2], [1, 3, 2, 1, 4], [2, 5, 4, 5, 3], [4, 3, 1, 2|...]] .

*/

/*
Receives a list and returns a list with neighboring cells
example:

createLineGroups([1,2,3,4],X).
X = [[1, 2], [2, 3], [3, 4]].

*/
createLineGroups([B,C],[[B,C]]) :- !.
createLineGroups([A,B|T], [[A,B]|X]) :- createLineGroups([B|T],X). 

/*
runs all_different for all the list passed
*/
getAllDifferent([_]) :- !.
getAllDifferent([A|T]) :- all_different(A), getAllDifferent(T);