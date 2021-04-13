import Data.List

import Ponto

main = do
    let p1 = (Ponto2D 0 0)
    let p2 = (Ponto2D 0 4)
    let p3 = (Ponto2D 3 0)
    
    let dis = (3,5,4)
    let dis2 = (51,7,4)

    print(formaTriangulo2 dis)
    print(formaTriangulo p1 p2 p3)
