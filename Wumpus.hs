import Data.List 
import System.Random
import System.IO

--Metodo que devuelve el icono del jugador--
jugador :: Char -> String
jugador apuntando =
    if apuntando == 'U'
        then "^"
    else if apuntando == 'D'
        then "v"
    else if apuntando == 'L'
        then "<"
    else if apuntando == 'R'
        then ">"
    else 
        ">"

--Metodo que genera las casillas del tablero--
generaCasillas :: Int -> Int -> Int -> String -> String -> Int -> Int -> [Int] -> Int -> String
generaCasillas inicio final pos jug cadena wumpus oro hoyos esFinal =
    if inicio == wumpus && inicio <= final && esFinal == 1
        then generaCasillas (inicio + 1) final pos jug (cadena ++ "W |") wumpus oro hoyos esFinal
    else if inicio == oro && inicio <= final && esFinal == 1
        then generaCasillas (inicio + 1) final pos jug (cadena ++ "O |") wumpus oro hoyos esFinal
    else if inicio `elem` hoyos && inicio <= final && esFinal == 1
        then generaCasillas (inicio + 1) final pos jug (cadena ++ "H |") wumpus oro hoyos esFinal
    else if inicio == pos && inicio <= final
        then generaCasillas (inicio + 1) final pos jug (cadena ++ jug ++ " |") wumpus oro hoyos esFinal
    else if inicio <= 9 && inicio <= final
        then generaCasillas (inicio + 1) final pos jug (cadena ++ show inicio ++ " |") wumpus oro hoyos esFinal
    else if inicio >= 9 && inicio <= final
        then generaCasillas (inicio + 1) final pos jug (cadena ++ show inicio ++ "|") wumpus oro hoyos esFinal
    else
        cadena

--Metodo que crea el tablero--
mostrarTablero :: Int -> String -> Int -> Int -> [Int] -> Int -> String
mostrarTablero pos jug wumpus oro hoyos esFinal =
    "----------------------------Tablero---------------------------\n"
    ++ generaCasillas 31 36 pos jug "" wumpus oro hoyos esFinal
    ++ "\n--+--+--+--+--+--\n"
    ++ generaCasillas 25 30 pos jug "" wumpus oro hoyos esFinal
    ++ "\n--+--+--+--+--+--\n"
    ++ generaCasillas 19 24 pos jug "" wumpus oro hoyos esFinal
    ++ "\n--+--+--+--+--+--\n"
    ++ generaCasillas 13 18 pos jug "" wumpus oro hoyos esFinal
    ++ "\n--+--+--+--+--+--\n"
    ++ generaCasillas 7 12 pos jug "" wumpus oro hoyos esFinal
    ++ "\n--+--+--+--+--+--\n"
    ++ generaCasillas 1 6 pos jug "" wumpus oro hoyos esFinal

--Metodo que analiza si el juego continua o se termino--
gameOver :: Int -> Int -> [Int] -> Int -> Int -> Char -> String -> Int -> IO ()
gameOver wumpus oro hoyos pos puntos apuntando opc flecha = do
    putStrLn "----------------------------Pistas----------------------------"
    putStrLn (pistas (casos pos) hoyos wumpus oro pos 0 4 "" [1, 2, 3, 4, 5])
    if puntos <= 0
        then putStrLn "\nUps parece que perdiste, bueno se intento :)\n"
    else if puntos > 100
        then putStrLn "\nParece que ganaste asi se hace compañero, \nyo me despierto todos los dias para hacer dos cosas comer mi cereal y resarte a ti, idolo :D"
    else if head opc == '1'
        then juego wumpus oro hoyos pos puntos apuntando flecha
    else if head opc == '2'
        then juego wumpus oro hoyos pos puntos apuntando flecha
    else if head opc == '3'
        then juego wumpus oro hoyos pos puntos apuntando flecha
    else if head opc == '4'
        then juego wumpus oro hoyos pos puntos apuntando flecha
    else if head opc == '5' && wumpus == 0 && flecha == 1
        then putStrLn "\nAcabas de matar al Wumpus, buena esa compañero sigue asi y llegaras lejos"
    else if head opc == '5' && flecha == 1
        then putStrLn "\nAcabas de desperdiciar tu unica flecha, creo que disparar ahora no fue una de tus mejores ideas"
    else if head opc == '5' && flecha == 0
        then putStrLn "\nLo siento compañero, ya no tienes mas flechas, asi que no podras jugar al Archer otra vez"
    else
        putStrLn ("Porfa seleciona una opcion valida")

    if head opc == '5' && puntos > 0 && flecha == 1
        then juego wumpus oro hoyos pos puntos apuntando 0
    else if head opc == '5' && puntos > 0 && flecha == 0
        then juego wumpus oro hoyos pos (puntos + 10) apuntando 0
    else if puntos <= 0
        then putStrLn ((mostrarTablero 1 (jugador 'R') wumpus oro hoyos 1) ++ "\n> = Jugador | W = Wumpus | O = Oro | H = Hoyo")
    else if puntos > 100
        then putStrLn ((mostrarTablero 1 (jugador 'R') wumpus oro hoyos 1) ++ "\n> = Jugador | W = Wumpus | O = Oro | H = Hoyo")
    else
        putStrLn ("")

--Metodo que gira al jugador 90° segun sea el caso--
girar :: Char -> Char -> Char
girar apuntando giro =
    if apuntando == 'U' && giro == 'L'
        then 'L'
    else if apuntando == 'U' && giro == 'R'
        then 'R'
    else if apuntando == 'D' && giro == 'L'
        then 'R'
    else if apuntando == 'D' && giro == 'R'
        then 'L'
    else if apuntando == 'L' && giro == 'L'
        then 'D'
    else if apuntando == 'L' && giro == 'R'
        then 'U'
    else if apuntando == 'R' && giro == 'L'
        then 'U'
    else if apuntando == 'R' && giro == 'R'
        then 'D'
    else
        'L'

--Metodo que permite avanzar--
avanzar :: Char -> Int -> Int
avanzar apuntando pos =
    if apuntando == 'U'
        then (pos + 6)
    else if apuntando == 'D'
        then (pos - 6)
    else if apuntando == 'L'
        then (pos - 1)
    else if apuntando == 'R'
        then (pos + 1)
    else
        pos

--Metodo que permite recoger el oro--
recoger :: Int -> Int -> Int -> Int
recoger pos oro puntos =
    if pos == oro
        then (puntos + 1000)
    else
        (puntos - 1)

--Muestra las casillas continuas segun el caso--
casos :: Int -> [Int]
casos casilla =
    if casilla == 1
        then [2, 7]
    else if casilla == 2
        then [1, 3, 8]
    else if casilla == 3
        then [2, 4, 9]
    else if casilla == 4
        then [3, 5, 10]
    else if casilla == 5
        then [4, 6, 11]
    else if casilla == 6
        then [5, 12]
    else if casilla == 7
        then [1, 8, 13]
    else if casilla == 8
        then [2, 7, 9, 14]
    else if casilla == 9
        then [3, 8, 10, 15]
    else if casilla == 10
        then [4, 9, 11, 16]
    else if casilla == 11
        then [5, 10, 12, 17]
    else if casilla == 12
        then [6, 11, 18]
    else if casilla == 13
        then [7, 14, 19]
    else if casilla == 14
        then [8, 13, 15, 20]
    else if casilla == 15
        then [9, 14, 16, 21]
    else if casilla == 16
        then [10, 15, 17, 22]
    else if casilla == 17
        then [11, 16, 18, 23]
    else if casilla == 18
        then [12, 17, 24]
    else if casilla == 19
        then [13, 20, 25]
    else if casilla == 20
        then [14, 19, 21, 26]
    else if casilla == 21
        then [15, 20, 22, 27]
    else if casilla == 22
        then [16, 21, 23, 28]
    else if casilla == 23
        then [17, 22, 24, 29]
    else if casilla == 24
        then [18, 23, 30]
    else if casilla == 25
        then [19, 26, 31]
    else if casilla == 26
        then [20, 25, 27, 32]
    else if casilla == 27
        then [21, 26, 28, 33]
    else if casilla == 28
        then [22, 27, 29, 34]
    else if casilla == 29
        then [23, 28, 30, 35]
    else if casilla == 30
        then [24, 29, 36]
    else if casilla == 31
        then [25, 32]
    else if casilla == 32
        then [26, 31, 33]
    else if casilla == 33
        then [27, 32, 34]
    else if casilla == 34
        then [28, 33, 35]
    else if casilla == 35
        then [29, 34, 36]
    else if casilla == 36
        then [30, 35]
    else
        [0]

--Metodo para comparar listas--
comparaLista :: [Int] -> [Int] -> Int -> Int
comparaLista casos hoyos comp =
    if null casos
        then comp
    else if (head casos) `elem` hoyos
        then comparaLista (tail casos) hoyos 1
    else
        comparaLista (tail casos) hoyos comp

--Metodo que muestra las pistas en pantalla--
pistas :: [Int] -> [Int] -> Int -> Int -> Int -> Int -> Int -> String -> [Int] -> String
pistas casos hoyos wumpus oro pos inicio final cadena pistasNoDadas =
    if wumpus `elem` casos && 1 `elem` pistasNoDadas
        then
            pistas casos hoyos wumpus oro pos (inicio - 1) final (cadena ++ "\nParece que hay un olor desagradable cerca") [2, 3, 4, 5]
    else if (comparaLista casos hoyos 0) == 1 && 2 `elem` pistasNoDadas
        then
            pistas casos hoyos wumpus oro pos (inicio - 1) final (cadena ++ "\nParece que hay una brisa agradable soplando") [3, 4, 5]
    else if pos == oro && 3 `elem` pistasNoDadas
        then
            pistas casos hoyos wumpus oro pos (inicio - 1) final (cadena ++ "\nHa aparecido un resplandor tan grande que ciega la vista") [4, 5]
    else if pos == wumpus && 4 `elem` pistasNoDadas
        then
            pistas casos hoyos wumpus oro pos (inicio - 1) 0 (cadena ++ "\nMala suerte amigo has caido en la guarida del Wumpus") [5]
    else if pos `elem` hoyos && 5 `elem` pistasNoDadas
        then
            pistas casos hoyos wumpus oro pos (inicio - 1) 0 (cadena ++ "\nMala suerte compañero parece que has caido en un hoyo") [0]
    else if inicio >= final
        then cadena
    else if pistasNoDadas == [1, 2, 3, 4, 5]
        then "\nBuena suerte, parece que no hay nada"
    else
        cadena

--Calcula Puntos--
calculaPuntos :: Int -> Int -> Int -> [Int] -> Int
calculaPuntos puntos pos wumpus hoyos =
    if pos == wumpus
        then (puntos - 100)
    else if pos `elem` hoyos
        then (puntos - 100)
    else
        puntos

--Metodo para lanzar la flecha--
lanzarFlecha :: Int -> Int -> Char -> Int
lanzarFlecha wumpus pos apuntando =
    if (pos <= 6 && pos >= 1) && apuntando == 'L' && wumpus < pos && wumpus <= 6 && wumpus >= 1
        then 0
    else if (pos <= 6 && pos >= 1) && apuntando == 'R' && wumpus > pos && wumpus <= 6 && wumpus >= 1
        then 0
    else if (pos <= 6 && pos >= 1) && apuntando == 'U' && (wumpus == pos || wumpus == (pos + 6) || wumpus == (pos + 12) || wumpus == (pos + 18) || wumpus == (pos + 24) || wumpus == (pos + 30))
        then 0
    else if (pos <= 12 && pos >= 7) && apuntando == 'L' && wumpus < pos && wumpus <= 12 && wumpus >= 7
        then 0
    else if (pos <= 12 && pos >= 7) && apuntando == 'R' && wumpus > pos && wumpus <= 12 && wumpus >= 7
        then 0
    else if (pos <= 12 && pos >= 7) && apuntando == 'U' && (wumpus == pos || wumpus == (pos + 6) || wumpus == (pos + 12) || wumpus == (pos + 18) || wumpus == (pos + 24))
        then 0
    else if (pos <= 12 && pos >= 7) && apuntando == 'D' && (wumpus == pos || wumpus == (pos - 6))
        then 0
    else if (pos <= 18 && pos >= 13) && apuntando == 'L' && wumpus < pos && wumpus <= 18 && wumpus >= 13
        then 0
    else if (pos <= 18 && pos >= 13) && apuntando == 'R' && wumpus > pos && wumpus <= 18 && wumpus >= 13
        then 0
    else if (pos <= 18 && pos >= 13) && apuntando == 'U' && (wumpus == pos || wumpus == (pos + 6) || wumpus == (pos + 12) || wumpus == (pos + 18))
        then 0
    else if (pos <= 18 && pos >= 13) && apuntando == 'D' && (wumpus == pos || wumpus == (pos - 6) || wumpus == (pos - 12))
        then 0
    else if (pos <= 24 && pos >= 19) && apuntando == 'L' && wumpus < pos && wumpus <= 24 && wumpus >= 19
        then 0
    else if (pos <= 24 && pos >= 19) && apuntando == 'R' && wumpus > pos && wumpus <= 24 && wumpus >= 19
        then 0
    else if (pos <= 24 && pos >= 19) && apuntando == 'U' && (wumpus == pos || wumpus == (pos + 6) || wumpus == (pos + 12))
        then 0
    else if (pos <= 24 && pos >= 19) && apuntando == 'D' && (wumpus == pos || wumpus == (pos - 6) || wumpus == (pos - 12) || wumpus == (pos - 18))
        then 0
    else if (pos <= 30 && pos >= 25) && apuntando == 'L' && wumpus < pos && wumpus <= 30 && wumpus >= 25
        then 0
    else if (pos <= 30 && pos >= 25) && apuntando == 'R' && wumpus > pos && wumpus <= 30 && wumpus >= 25
        then 0
    else if (pos <= 30 && pos >= 25) && apuntando == 'U' && (wumpus == pos || wumpus == (pos + 6))
        then 0
    else if (pos <= 30 && pos >= 25) && apuntando == 'D' && (wumpus == pos || wumpus == (pos - 6) || wumpus == (pos - 12) || wumpus == (pos - 18) || wumpus == (pos - 24))
        then 0
    else if (pos <= 36 && pos >= 31) && apuntando == 'L' && wumpus < pos && wumpus <= 36 && wumpus >= 31
        then 0
    else if (pos <= 36 && pos >= 31) && apuntando == 'R' && wumpus > pos && wumpus <= 36 && wumpus >= 31
        then 0
    else if (pos <= 36 && pos >= 31) && apuntando == 'U' && wumpus == pos
        then 0
    else if (pos <= 36 && pos >= 31) && apuntando == 'D' && (wumpus == pos || wumpus == (pos - 6) || wumpus == (pos - 12) || wumpus == (pos - 18) || wumpus == (pos - 24) || wumpus == (pos - 30))
        then 0
    else
        wumpus

--Metodo que controla el juego--
juego :: Int -> Int -> [Int] -> Int -> Int -> Char -> Int -> IO ()
juego wumpus oro hoyos pos puntos apuntando flecha = do 
    putStrLn (mostrarTablero pos (jugador apuntando) wumpus oro hoyos 0)
    putStrLn ("\nPuntaje actual: " ++ show puntos)
    putStrLn ("\nElige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.")
    l <- getLine
    if head l == '1'
        then
            gameOver wumpus oro hoyos pos ((calculaPuntos puntos pos wumpus hoyos) - 1) (girar apuntando 'L') l flecha
    else if head l == '2'
        then
            gameOver wumpus oro hoyos pos ((calculaPuntos puntos pos wumpus hoyos) - 1) (girar apuntando 'R') l flecha
    else if head l == '3'
        then
            gameOver wumpus oro hoyos (avanzar apuntando pos) ((calculaPuntos puntos (avanzar apuntando pos) wumpus hoyos) - 1) apuntando l flecha
    else if head l == '4'
        then 
            gameOver wumpus oro hoyos pos ((recoger pos oro puntos)) apuntando l flecha
    else if head l == '5'
        then 
            gameOver (lanzarFlecha wumpus pos apuntando) oro hoyos pos (puntos - 10) apuntando l flecha
    else
        juego wumpus oro hoyos pos puntos apuntando flecha

--Metodo para generar los cinco Hoyos de manera aleatoria--
hoyos :: Int -> Int -> [Int] -> Int -> IO ()
hoyos w o h final = do 
    n <- randomRIO (3::Int, 36)
    if n == 0 || n == 7 || n == 8 || n == w || n == o || n `elem` h
        then hoyos w o h final
    else if (final <= 0)
        then juego w o (init h) 1 100 'R' 1
    else
        hoyos w o (n:h) (final - 1)

--Metodo para generar un Oro aleatorio--
oro :: Int -> IO ()
oro w = do
    n <- randomRIO (3::Int, 36)
    if n == 0 || n == 7 || n == 8 || n == w
        then oro w
    else
        hoyos w n [0] 5

--Metodo para generar un Wumpus aleatorio--
wumpus :: IO ()
wumpus = do
    n <- randomRIO (3::Int, 36)
    if n == 0 || n == 7 || n == 8
        then wumpus
    else
        oro n

--Metodo principal--
main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "**Mundo de Wumpus**"                  
    putStrLn "Si desea jugar en un tablero aleatorio escriba R"
    putStrLn "y si desea jugar en el tablero predeterminado escriba P:"   
    l <- getLine         
    putStrLn "----------------------------Pistas----------------------------"
    putStrLn ("\nBuena suerte, parece que no hay nada")                    
    if head l `elem` ['p', 'P']
        then juego 35 27 [3, 11, 13, 21, 23] 1 100 'R' 1          
        else wumpus