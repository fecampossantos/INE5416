module ComInfix((***), (+++)) where

    (***) :: Float -> Float -> Float
    (***) a b = a**2 + b

    (+++) :: Float -> Float -> Float
    (+++) a b = a*2 + b

    infix 3 +++
    infix 4 ***
