/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Suguru 8x8 CLP(FD) formulation.
   
   Felipe de Campos Santos - 17200441
   Isac de Souza Campos - 17200449
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

:- use_module(library(clpfd)).

suguru([
            [AA, AB, AC, AD, AE, AF, AG, AH],
            [BA, BB, BC, BD, BE, BF, BG, BH],
            [CA, CB, CC, CD, CE, CF, CG, CH],
            [DA, DB, DC, DD, DE, DF, DG, DH],
            [EA, EB, EC, ED, EE, EF, EG, EH],
            [FA, FB, FC, FD, FE, FF, FG, FH],
            [GA, GB, GC, GD, GE, GF, GG, GH],
            [HA, HB, HC, HD, HE, HF, HG, HH]
        ]) :-

        % Defining areas
        Area0 = [AA,AB,AC,BA],
        Area1 = [AD,BD,CC,CD,DD],
        Area2 = [AE,AF,BE,BF,CE],
        Area3 = [AG,AH,BG,BH,CH],
        Area4 = [BB,BC,CA,CB,DA],
        Area5 = [CF,CG,DG,DH,EH],
        Area6 = [DB,DC,EC,ED,FD],
        Area7 = [DE,DF,EE,FE,GE],
        Area8 = [EA,EB,FB,FC,GC],
        Area9 = [EF,EG,FG,FH,GH],
        Area10 = [FA,GA,GB,HA,HB],
        Area11 = [GD,HC,HD,HE,HF],
        Area12 = [FF,GF,GG,HG,HH],

        % Defining the values that the cells in AreaX can be
        Area0 ins 1..4,
        Area1 ins 1..5,
        Area2 ins 1..5,
        Area3 ins 1..5,
        Area4 ins 1..5,
        Area5 ins 1..5,
        Area6 ins 1..5,
        Area7 ins 1..5,
        Area8 ins 1..5,
        Area9 ins 1..5,
        Area10 ins 1..5,
        Area11 ins 1..5,
        Area12 ins 1..5,

        % The cells around eachother should be different

        % ROWS
        all_different([AA,AB]),
        all_different([AB,AC]),
        all_different([AC,AD]),
        all_different([AD,AE]),
        all_different([AE,AF]),
        all_different([AF,AG]),
        all_different([AG,AH]),
        
        all_different([BA,BB]),
        all_different([BB,BC]),
        all_different([BC,BD]),
        all_different([BD,BE]),
        all_different([BE,BF]),
        all_different([BF,BG]),
        all_different([BG,BH]),

        all_different([CA,CB]),
        all_different([CB,CC]),
        all_different([CC,CD]),
        all_different([CD,CE]),
        all_different([CE,CF]),
        all_different([CF,CG]),
        all_different([CG,CH]),
        
        all_different([DA,DB]),
        all_different([DB,DC]),
        all_different([DC,DD]),
        all_different([DD,DE]),
        all_different([DE,DF]),
        all_different([DF,DG]),
        all_different([DG,DH]),

        all_different([EA,EB]),
        all_different([EB,EC]),
        all_different([EC,ED]),
        all_different([ED,EE]),
        all_different([EE,EF]),
        all_different([EF,EG]),
        all_different([EG,EH]),

        all_different([FA,FB]),
        all_different([FB,FC]),
        all_different([FC,FD]),
        all_different([FD,FE]),
        all_different([FE,FF]),
        all_different([FF,FG]),
        all_different([FG,FH]),

        all_different([GA,GB]),
        all_different([GB,GC]),
        all_different([GC,GD]),
        all_different([GD,GE]),
        all_different([GE,GF]),
        all_different([GF,GG]),
        all_different([GG,GH]),

        all_different([HA,HB]),
        all_different([HB,HC]),
        all_different([HC,HD]),
        all_different([HD,HE]),
        all_different([HE,HF]),
        all_different([HF,HG]),
        all_different([HG,HH]),

        % COLUMNS
        all_different([AA,BA]),
        all_different([BA,CA]),
        all_different([CA,DA]),
        all_different([DA,EA]),
        all_different([EA,FA]),
        all_different([FA,GA]),
        all_different([GA,HA]),

        all_different([AB,BB]),
        all_different([BB,CB]),
        all_different([CB,DB]),
        all_different([DB,EB]),
        all_different([EB,FB]),
        all_different([FB,GB]),
        all_different([GB,HB]),

        all_different([AC,BC]),
        all_different([BC,CC]),
        all_different([CC,DC]),
        all_different([DC,EC]),
        all_different([EC,FC]),
        all_different([FC,GC]),
        all_different([GC,HC]),

        all_different([AD,BD]),
        all_different([BD,CD]),
        all_different([CD,DD]),
        all_different([DD,ED]),
        all_different([ED,FD]),
        all_different([FD,GD]),
        all_different([GD,HD]),

        all_different([AE,BE]),
        all_different([BE,CE]),
        all_different([CE,DE]),
        all_different([DE,EE]),
        all_different([EE,FE]),
        all_different([FE,GE]),
        all_different([GE,HE]),

        all_different([AF,BF]),
        all_different([BF,CF]),
        all_different([CF,DF]),
        all_different([DF,EF]),
        all_different([EF,FF]),
        all_different([FF,GF]),
        all_different([GF,HF]),

        all_different([AG,BG]),
        all_different([BG,CG]),
        all_different([CG,DG]),
        all_different([DG,EG]),
        all_different([EG,FG]),
        all_different([FG,GG]),
        all_different([GG,HG]),

        all_different([AH,BH]),
        all_different([BH,CH]),
        all_different([CH,DH]),
        all_different([DH,EH]),
        all_different([EH,FH]),
        all_different([FH,GH]),
        all_different([GH,HH]),

        % DIAGONALS BELOW
        all_different([AA,BB]),
        all_different([AB,BA]),
        all_different([AB,BC]),
        all_different([AC,BB]),
        all_different([AC,BD]),
        all_different([AD,BC]),
        all_different([AD,BE]),
        all_different([AE,BD]),
        all_different([AE,BF]),
        all_different([AF,BE]),
        all_different([AF,BG]),
        all_different([AG,BF]),
        all_different([AG,BH]),
        all_different([AH,BG]),


        all_different([BA,CB]),
        all_different([BB,CA]),
        all_different([BB,CC]),
        all_different([BC,CB]),
        all_different([BC,CD]),
        all_different([BD,CC]),
        all_different([BD,CE]),
        all_different([BE,CD]),
        all_different([BE,CF]),
        all_different([BF,CE]),
        all_different([BF,CG]),
        all_different([BG,CF]),
        all_different([BG,CH]),
        all_different([BH,CG]),

        all_different([CA,DB]),
        all_different([CB,DA]),
        all_different([CB,DC]),
        all_different([CC,DB]),
        all_different([CC,DD]),
        all_different([CD,DC]),
        all_different([CD,DE]),
        all_different([CE,DD]),
        all_different([CE,DF]),
        all_different([CF,DE]),
        all_different([CF,DG]),
        all_different([CG,DF]),
        all_different([CG,DH]),
        all_different([CH,DG]),
        
        all_different([DA,EB]),
        all_different([DB,EA]),
        all_different([DB,EC]),
        all_different([DC,EB]),
        all_different([DC,ED]),
        all_different([DD,EC]),
        all_different([DD,EE]),
        all_different([DE,ED]),
        all_different([DE,EF]),
        all_different([DF,EE]),
        all_different([DF,EG]),
        all_different([DG,EF]),
        all_different([DG,EH]),
        all_different([DH,EG]),

        all_different([EA,FB]),
        all_different([EB,FA]),
        all_different([EB,FC]),
        all_different([EC,FB]),
        all_different([EC,FD]),
        all_different([ED,FC]),
        all_different([ED,FE]),
        all_different([EE,FD]),
        all_different([EE,FF]),
        all_different([EF,FE]),
        all_different([EF,FG]),
        all_different([EG,FF]),
        all_different([EG,FH]),
        all_different([EH,FG]),

        all_different([FA,GB]),
        all_different([FB,GA]),
        all_different([FB,GC]),
        all_different([FC,GB]),
        all_different([FC,GD]),
        all_different([FD,GC]),
        all_different([FD,GE]),
        all_different([FE,GD]),
        all_different([FE,GF]),
        all_different([FF,GE]),
        all_different([FF,GG]),
        all_different([FG,GF]),
        all_different([FG,GH]),
        all_different([FH,GG]),

        all_different([GA,HB]),
        all_different([GB,HA]),
        all_different([GB,HC]),
        all_different([GC,HB]),
        all_different([GC,HD]),
        all_different([GD,HC]),
        all_different([GD,HE]),
        all_different([GE,HD]),
        all_different([GE,HF]),
        all_different([GF,HE]),
        all_different([GF,HG]),
        all_different([GG,HF]),
        all_different([GG,HH]),
        all_different([GH,HG]),



        
        % The cells in the areas should be different too
        all_different(Area0),
        all_different(Area1),
        all_different(Area2),
        all_different(Area3),
        all_different(Area4),
        all_different(Area5),
        all_different(Area6),
        all_different(Area7),
        all_different(Area8),
        all_different(Area9),
        all_different(Area10),
        all_different(Area11),
        all_different(Area12),


        % Evaluate the cells (generate values for each variable that suits the rules)
        label(Area0),
        label(Area1),
        label(Area2),
        label(Area3),
        label(Area4),
        label(Area5),
        label(Area6),
        label(Area7),
        label(Area8),
        label(Area9),
        label(Area10),
        label(Area11),
        label(Area12).

/*
https://www.janko.at/Raetsel/Suguru/011.a.htm
*/
problem1(1,T) :- 
    T = [[_,_,_,3,_,_,2,_],
        [4,_,_,_,_,_,_,_],
        [_,2,_,_,_,_,_,_],
        [_,1,5,_,_,1,5,_],
        [_,2,_,_,_,_,_,_],
        [_,_,_,_,4,_,_,4],
        [_,_,_,_,_,3,_,_],
        [_,5,_,_,_,5,_,_]].

/*

?- problem1(1,T), suguru(T), maplist(writeln, T).

[1,3,2,3,2,3,2,3]
[4,5,1,5,1,5,4,5]
[3,2,4,2,4,2,3,1]
[4,1,5,1,3,1,5,4]
[3,2,4,2,5,2,3,1]
[4,1,5,3,4,1,5,4]
[2,3,4,1,2,3,2,1]
[1,5,2,3,4,5,4,5]
T = [[1, 3, 2, 3, 2, 3, 2, 3], [4, 5, 1, 5, 1, 5, 4|...], [3, 2, 4, 2, 4, 2|...], [4, 1, 5, 1, 3|...], [3, 2, 4, 2|...], [4, 1, 5|...], [2, 3|...], [1|...]].
*/
