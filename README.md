# Mundo de Wumpus en Haskell

Este es un juego de consola inspirado en el clásico **Hunt the Wumpus**, desarrollado **completamente desde cero en Haskell** como proyecto universitario.  
El tablero, las reglas y la lógica fueron implementados manualmente, sin usar plantillas externas.

## 🎮 Reglas del juego
- El jugador empieza en la casilla 1 mirando hacia la derecha (`>`).  
- En el tablero existen:
  - **Wumpus (W):** Si caes en su casilla, pierdes puntos.  
  - **Oro (O):** Si lo recoges, ganas muchos puntos.  
  - **Hoyos (H):** Si caes en uno, pierdes.  
- El jugador tiene **una flecha** para intentar matar al Wumpus.  
- Cada acción consume puntos. Si llegas a 0, pierdes.  
- Ganas al superar los 100 puntos o recoger el oro sin morir.

## 🕹️ Controles
En cada turno puedes elegir una acción:
1. Girar 90° a la izquierda  
2. Girar 90° a la derecha  
3. Avanzar una casilla  
4. Recoger oro  
5. Lanzar flecha  

## 🛠️ Ejecución

### Opción 1: Sin compilar
runghc Wumpus.hs

### Opción 2: Con GHCi
ghci Wumpus.hs
> main

## 📦 Dependencias
- [GHC](https://www.haskell.org/ghc/)  
- [random](https://hackage.haskell.org/package/random)

**Nota:** Si no tienes la librería random, instálala con:
cabal install random

📝 Notas
- Proyecto desarrollado completamente desde cero en Haskell.
- Se comparte aquí con fines de aprendizaje y diversión.
- Licencia MIT siéntete libre de usarlo, modificarlo o compartirlo.

## 🎮 Ejemplo de ejecucion

**Mundo de Wumpus**
Si desea jugar en un tablero aleatorio escriba R \n
y si desea jugar en el tablero predeterminado escriba P:
P
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
> |2 |3 |4 |5 |6 |

Puntaje actual: 100

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |> |3 |4 |5 |6 |

Puntaje actual: 99

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
1
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |^ |3 |4 |5 |6 |

Puntaje actual: 98

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |^ |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 97

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|^ |15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 96

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|^ |21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 95

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|^ |27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 94

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|^ |33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 93

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
2
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|> |33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 92

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
5
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada

Acabas de matar al Wumpus, buena esa compañero sigue asi y llegaras lejos
----------------------------Tablero---------------------------
31|> |33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 82

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
2
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|v |33|34|35|36|
--+--+--+--+--+--
25|26|27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 81

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|v |27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 80

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
1
----------------------------Pistas----------------------------

Buena suerte, parece que no hay nada
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|> |27|28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 79

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
3
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
Ha aparecido un resplandor tan grande que ciega la vista
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|> |28|29|30|
--+--+--+--+--+--
19|20|21|22|23|24|
--+--+--+--+--+--
13|14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|11|12|
--+--+--+--+--+--
1 |2 |3 |4 |5 |6 |

Puntaje actual: 78

Elige una opcion: 1. Girar 90° izquierda. | 2. Girar 90° derecha. | 3. Avanzar. | 4. Recoger Oro. | 5. Lanzar flecha.
4
----------------------------Pistas----------------------------

Parece que hay una brisa agradable soplando
Ha aparecido un resplandor tan grande que ciega la vista

Parece que ganaste asi se hace compañero,
yo me despierto todos los dias para hacer dos cosas comer mi cereal y resarte a ti, idolo :D
----------------------------Tablero---------------------------
31|32|33|34|35|36|
--+--+--+--+--+--
25|26|O |28|29|30|
--+--+--+--+--+--
19|20|H |22|H |24|
--+--+--+--+--+--
H |14|15|16|17|18|
--+--+--+--+--+--
7 |8 |9 |10|H |12|
--+--+--+--+--+--
> |2 |H |4 |5 |6 |
> = Jugador | W = Wumpus | O = Oro | H = Hoyo
