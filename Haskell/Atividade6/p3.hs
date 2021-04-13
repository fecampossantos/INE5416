data Ponto =
    Ponto2D Float Float
    | Ponto3D Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D x1 y1) (Ponto2D x2 y2) = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
distancia (Ponto3D x1 y1 z1) (Ponto3D x2 y2 z2) = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1))

comprimento :: Ponto -> Float
comprimento (Ponto2D x y) = sqrt((x*x + y*y))
comprimento (Ponto3D x y z) = sqrt((x*x + y*y + z*z))


getX :: Ponto -> Float
getX (Ponto2D x y) = x

main = do
    let ponto2d1 = (Ponto2D 0.0 0.0)
    let ponto2d2 = (Ponto2D 10.0 25.0)
    
    let ponto3d1 = (Ponto3D 0.0 0.0 0.0)
    let ponto3d2 = (Ponto3D 10.0 25.0 78.0)
    
    print(distancia ponto2d1 ponto2d2)
    print(distancia ponto3d1 ponto3d2)